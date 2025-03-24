import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../providers/entrance/entrance.notifier.dart';
import '../../providers/nfc/nfc_read.notifier.dart';
import '../../providers/nfc/nfc_write.notifier.dart';
import '../../shared/presentation/widgets/base_scaffold.dart';
import '../../shared/providers/firebase_repository.provider.dart';

class Entrance extends ConsumerStatefulWidget {
  const Entrance({super.key});
  static const routeName = "/entrance";

  @override
  ConsumerState<Entrance> createState() => _EntranceState();
}

class _EntranceState extends ConsumerState<Entrance> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    late String saturday;

    String calcNextSaturday() {
      DateTime jetzt = DateTime.now();
      DateTime naechsterSamstag;

      if (jetzt.weekday == DateTime.saturday) {
        naechsterSamstag = jetzt;
      } else {
        // Berechne die Tage bis zum nächsten Samstag
        int tageBisSamstag = DateTime.saturday - jetzt.weekday;
        if (tageBisSamstag < 0) {
          tageBisSamstag += 7; // Wenn wir schon über Samstag hinaus sind
        }
        naechsterSamstag = jetzt.add(Duration(days: tageBisSamstag));
      }

      // Formatiere das Datum nach Wunsch
      DateFormat formatter = DateFormat('dd.MM.yyyy');
      return saturday = formatter.format(naechsterSamstag);
    }

    saturday = calcNextSaturday();

    ref.read(nfcReadNotifierProvider.notifier).scanMember();
    var memberList = ref.watch(entranceNotifierProvider);

    clickPayed(String memberNumber, bool? value, int index) {
      print(memberNumber);
      ref
          .read(entranceNotifierProvider.notifier)
          .updateMember(memberNumber, value!, index);
    }

    return BaseScaffold(
      title: "Einlass",
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.nfc),
                      title: const Text(
                          "Karte ans Handy halten um den Nächsten zu scannen!"),
                      subtitle: Text(saturday),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: memberList.length,
                        itemBuilder: (context, index) {
                          var firstName =
                              memberList[index].firstname.toString();
                          var lastName = memberList[index].lastname.toString();
                          var birthDay = DateTime.parse(
                              memberList[index].birthday.toString());
                          var memberNo =
                              memberList[index].memberNumber.toString();
                          var memberCardDone = memberList[index].memberCheckIn;
                          return SizedBox(
                            height: deviceSize.height / 1.4,
                            child: ListTile(
                              trailing: SizedBox(
                                width: 125,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ...memberCardDone.asMap().entries.map(
                                      (entry) {
                                        int index = entry.key;
                                        var element = entry.value;
                                        var checkDate = DateFormat("dd.MM.yyyy")
                                            .format(element.checkInDate);
                                        return element.checkIn
                                            ? Expanded(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Flexible(
                                                              child: Text(
                                                                  checkDate)),
                                                          Flexible(
                                                            child: Checkbox(
                                                              value: element
                                                                  .checkIn,
                                                              onChanged: null,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          const Flexible(
                                                              child: Text(
                                                                  "Bezahlt")),
                                                          Flexible(
                                                            child: Checkbox(
                                                              value:
                                                                  element.payed,
                                                              onChanged: element
                                                                      .payed
                                                                  ? null
                                                                  : (value) => clickPayed(
                                                                  memberNo,
                                                                      value,
                                                                      index),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : const SizedBox();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              title: Text("$firstName $lastName"),
                              subtitle: Text(
                                DateFormat("dd.MM.yyyy").format(birthDay),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
