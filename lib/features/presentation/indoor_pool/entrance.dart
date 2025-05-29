import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../providers/entrance/entrance.notifier.dart';
import '../../providers/entrance/search_member.notifier.dart';
import '../../providers/nfc/nfc_read.notifier.dart';
import '../../shared/presentation/widgets/base_scaffold.dart';
import '../member_cards/widgets/member_list_widget.dart';

class Entrance extends ConsumerStatefulWidget {
  const Entrance({super.key});
  static const routeName = "/entrance";

  @override
  ConsumerState<Entrance> createState() => _EntranceState();
}

class _EntranceState extends ConsumerState<Entrance> {
  late SearchController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = SearchController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    late String saturday;

    String calcNextSaturday() {
      DateTime now = DateTime.now();
      DateTime nextSaturday;

      if (now.weekday == DateTime.saturday) {
        nextSaturday = now;
      } else {
        // Berechne die Tage bis zum nächsten Samstag
        int daysToSaturday = DateTime.saturday - now.weekday;
        if (daysToSaturday < 0) {
          daysToSaturday += 7; // Wenn wir schon über Samstag hinaus sind
        }
        nextSaturday = now.add(Duration(days: daysToSaturday));
      }

      // Formatiere das Datum nach Wunsch
      DateFormat formatter = DateFormat('dd.MM.yyyy');
      return saturday = formatter.format(nextSaturday);
    }

    saturday = calcNextSaturday();

    ref.read(nfcReadNotifierProvider.notifier).scanMember();
    var memberList = ref.watch(entranceNotifierProvider);

    clickPayed(String memberNumber, bool? value, int index) {
      ref
          .read(entranceNotifierProvider.notifier)
          .updateMember(memberNumber, value!, index);
    }

    return BaseScaffold(
      title: "Einlass",
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          children: [
            SearchAnchor.bar(
              // SearchBar-Eigenschaften werden direkt hier übergeben:
              isFullScreen: false,
              searchController: _searchController,
              barHintText: "Suche nach Mitglied",
              barLeading: const Icon(Icons.search),
              barTrailing: [
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    ref.read(searchTextNotifierProvider.notifier).setText("");
                  },
                ),
              ],
              // Die Eigenschaft, die auf Textänderungen reagiert, heißt hier 'onChanged'.
              // Sie entspricht funktional dem 'viewOnChanged' des Standard-Konstruktors.
              onChanged: (text) {
                ref.read(searchTextNotifierProvider.notifier).setText(text);
              },
              // Der suggestionsBuilder bleibt genau gleich. Er ist für die Ergebnisliste zuständig.
              suggestionsBuilder: (BuildContext context, SearchController controller) {
                final asyncMembers = ref.watch(searchMemberNotifierAsyncProvider);

                return asyncMembers.when(
                  data: (members) {
                    if (controller.text.isEmpty && members.isEmpty) {
                      return [const Center(child: Padding(padding: EdgeInsets.all(16.0), child: Text("Tippe um nach Mitgliedern zu suchen.")))];
                    }
                    if (members.isEmpty) {
                      return [Center(child: Padding(padding: EdgeInsets.all(16.0), child: Text("Keine Ergebnisse für '${controller.text}'.")))];
                    }
                    return members.map((member) {
                      return ListTile(
                        title: Text("${member.firstname} ${member.lastname}"),
                        onTap: () {
                          controller.closeView("${member.firstname} ${member.lastname}");
                          ref.read(nfcReadNotifierProvider.notifier).loadUpdateMember(member.memberNumber);
                          ref.read(searchTextNotifierProvider.notifier).setText("");
                          _searchController.clear();
                          FocusScope.of(context).unfocus();
                        },
                      );
                    }).toList();
                  },
                  loading: () => [const Center(child: Padding(padding: EdgeInsets.all(16.0), child: CircularProgressIndicator()))],
                  error: (err, stack) => [Center(child: Padding(padding: EdgeInsets.all(16.0), child: Text('Fehler beim Suchen: $err')))],
                );
              },
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.nfc),
                      title: const Text(
                          "Karte ans Handy halten um den Nächsten zu scannen!"),
                      subtitle: Text(saturday),
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          memberList = ref.read(entranceNotifierProvider);
                          await Future.delayed(const Duration(milliseconds: 50));
                        },
                        child: MemberListWidget(
                          memberList: memberList,
                          deviceSize: deviceSize,
                          onPayedClicked: (memberNo, value, index) =>
                              clickPayed(memberNo, value, index),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onItemTapped: (_) {},
    );
  }
}


