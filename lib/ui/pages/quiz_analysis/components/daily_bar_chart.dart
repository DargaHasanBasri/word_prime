import 'package:fl_chart/fl_chart.dart';
import 'package:word_prime/export.dart';

class DailyBarChart extends StatelessWidget {
  final List<double> values1;
  final List<double> values2;
  final List<String> days;
  final double maxYValue;

  const DailyBarChart({
    Key? key,
    required this.values1,
    required this.values2,
    required this.days,
    required this.maxYValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: BarChart(
        swapAnimationDuration: const Duration(milliseconds: 300),
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxYValue,
          barTouchData: BarTouchData(enabled: true),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, _) {
                  return Text(
                    days[value.toInt()],
                    style: const TextStyle(fontSize: 12),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: 5,
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: List.generate(
            days.length,
            (index) => BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: (values1.isNotEmpty && index < values1.length) ? values1[index] : 0.0,
                  color: AppColors.cornflowerBlue,
                  width: 12,
                ),
                BarChartRodData(
                  toY: (values2.isNotEmpty && index < values2.length) ? values2[index] : 0.0,
                  color: AppColors.artyClickRed,
                  width: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
