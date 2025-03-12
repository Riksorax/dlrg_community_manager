import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../shared/data/models/member.dart';
import '../../shared/data/models/memberCheckIn.dart';
import '../../shared/presentation/widgets/base_scaffold.dart';
import '../../shared/providers/firebase_repository.provider.dart';

class OverView extends ConsumerStatefulWidget {
  const OverView({super.key});
  static const routeName = "/over_view";

  @override
  ConsumerState<OverView> createState() => _OverViewState();
}

class _OverViewState extends ConsumerState<OverView> {
  final Color leftBarColor = Colors.yellow;
  final Color rightBarColor = Colors.red;
  final Color avgColor = Colors.orange;

  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  late List<int> checkInsPerSaturday; // Als Instanzvariable deklarieren

  List<int> countCheckInsPerSaturday(
      List<Member> members, List<String> saturdays) {
    List<int> counts =
    List.filled(saturdays.length, 0); // Initialisiere Liste mit Nullen

    for (Member member in members) {
      for (MemberCheckIn checkIn in member.memberCheckIn) {
        DateTime checkInDate = DateTime.parse(checkIn.checkInDate.toString());
        String formattedCheckInDate = DateFormat('dd.MM').format(checkInDate);

        int index = saturdays.indexOf(formattedCheckInDate);
        if (index != -1) {
          counts[index]++;
        }
      }
    }
    return counts; // Hier wurde das return counts; hinzugefügt
  }

  @override
  Widget build(BuildContext context) {
    final membersAsyncValue = ref.watch(getAllMembersRepoProvider);

    return BaseScaffold(
        title: "Anzahl an Einlässe",
        body: AspectRatio(
        aspectRatio: 1,
        child: Padding(
        padding: const EdgeInsets.all(16),
          child: membersAsyncValue.when(
            data: (members) {
              final List<String> saturdays = getSaturdaysOfCurrentMonth();
              checkInsPerSaturday = countCheckInsPerSaturday(members, saturdays);

              final double maxPossibleValue = 100;
              final List<BarChartGroupData> items = [];
              for (int i = 0; i < checkInsPerSaturday.length; i++) {
                double scaledY = (checkInsPerSaturday[i] / maxPossibleValue) * 100;
                items.add(makeGroupData(i, scaledY, scaledY));
              }

              rawBarGroups = items;
              showingBarGroups = rawBarGroups;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: BarChart(
                      BarChartData(
                        maxY: 100,
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            getTooltipItem: (
                                BarChartGroupData group,
                                int groupIndex,
                                BarChartRodData rod,
                                int rodIndex,
                                ) {
                              return BarTooltipItem(
                                '${checkInsPerSaturday[groupIndex]}',
                                const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: bottomTitles,
                              reservedSize: 42,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 28,
                              interval: 1,
                              getTitlesWidget: (value, meta) =>
                                  leftTitles(value, meta, 100),
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: showingBarGroups,
                        gridData: const FlGridData(show: false),
                      ),
                    ),
                  ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(child: Text('Fehler: $error')),
          ),
        ),
        ),
      onItemTapped: (_) {},
    );
  }

  Widget leftTitles(double value, TitleMeta meta, double maxY) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    final Map<double, String> labels = {
      0: '0',
      25: '25',
      50: '50',
      75: '75',
      100: '100',
    };

    final String? text = labels[value];
    if (text == null) {
      return Container();
    }

    return SideTitleWidget(
      meta: meta,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = getSaturdaysOfCurrentMonth();

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      meta: meta,
      space: 16, //margin top
      child: text,
    );
  }

  List<String> getSaturdaysOfCurrentMonth() {
    final now = DateTime.now();
    final year = now.year;
    final month = now.month;

    List<String> saturdays = [];
    final daysInMonth = DateTime(year, month + 1, 0).day;

    for (int day = 1; day <= daysInMonth; day++) {
      final date = DateTime(year, month, day);
      if (date.weekday == DateTime.saturday) {
        final formatter = DateFormat('dd.MM');
        final formattedDate = formatter.format(date);
        saturdays.add(formattedDate);
      }
    }
    return saturdays;
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: rightBarColor,
          width: width,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withValues(alpha: 0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withValues(alpha: 0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withValues(alpha: 1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withValues(alpha: 0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withValues(alpha: 0.4),
        ),
      ],
    );
  }
}