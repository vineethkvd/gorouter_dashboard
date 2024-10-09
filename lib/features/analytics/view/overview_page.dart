import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsOverviewPage extends StatefulWidget {
  const AnalyticsOverviewPage({super.key});

  @override
  State<AnalyticsOverviewPage> createState() => _AnalyticsOverviewPageState();
}

class _AnalyticsOverviewPageState extends State<AnalyticsOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "Overview",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Expanded(child: LineChartSample()),
        ],
      ),
    );
  }
}

// Line Chart Sample using fl_chart

class LineChartSample extends StatefulWidget {
  const LineChartSample({super.key});

  @override
  State<LineChartSample> createState() => _LineChartSampleState();
}

class _LineChartSampleState extends State<LineChartSample> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(
          show: false,
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                const style = TextStyle(
                  color: Color(0xff68737d),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                );
                Widget text;
                switch (value.toInt()) {
                  case 0:
                    text = const Text('MON', style: style);
                    break;
                  case 2:
                    text = const Text('TUE', style: style);
                    break;
                  case 4:
                    text = const Text('WED', style: style);
                    break;
                  case 6:
                    text = const Text('THU', style: style);
                    break;
                  case 8:
                    text = const Text('FRI', style: style);
                    break;
                  case 10:
                    text = const Text('SAT', style: style);
                    break;
                  case 12:
                    text = const Text('SUN', style: style);
                    break;
                  default:
                    text = const Text('');
                    break;
                }
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: text,
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const style = TextStyle(
                  color: Color(0xff67727d),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                );
                String text;
                switch (value.toInt()) {
                  case 1:
                    text = '10K';
                    break;
                  case 3:
                    text = '30k';
                    break;
                  case 5:
                    text = '50k';
                    break;
                  default:
                    return Container();
                }
                return Text(text, style: style, textAlign: TextAlign.left);
              },
              reservedSize: 42,
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(color: Colors.black26, width: 1),
            left: BorderSide(color: Colors.black26, width: 1),
            right: BorderSide(color: Colors.transparent),
            top: BorderSide(color: Colors.transparent),
          ),
        ),
        minX: 0,
        maxX: 12,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 3),
              FlSpot(2.5, 2),
              FlSpot(4.9, 5),
              FlSpot(6.8, 3.1),
              FlSpot(8, 4),
              FlSpot(9.5, 3),
              FlSpot(11, 4),
            ],
            isCurved: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: Colors.blue, end: Colors.purple).lerp(0.2)!,
                ColorTween(begin: Colors.blue, end: Colors.purple).lerp(0.8)!,
              ],
            ),
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: const FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  ColorTween(begin: Colors.blue, end: Colors.purple)
                      .lerp(0.2)!
                      .withOpacity(0.1),
                  ColorTween(begin: Colors.blue, end: Colors.purple)
                      .lerp(0.8)!
                      .withOpacity(0.1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
