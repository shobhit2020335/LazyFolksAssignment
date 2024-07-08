import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraph extends StatelessWidget {
  final List<SingleBar> barDataList;

  BarGraph({required this.barDataList});

  Color darkGreen = Color.fromRGBO(68, 116, 106, 1);
  Color lightGreen = Color.fromRGBO(219, 234, 229, 1);
  Color textGreyColor = Color.fromRGBO(151, 151, 151, 1);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(
          top: height * 0.032, left: width * .045, right: width * .045),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1.5),
      ),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 5000,
          minY: 0,
          barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            leftTitles: SideTitles(
              // textDirection: TextDirection.ltr,
              showTitles: true,
              getTextStyles: (context, value) => TextStyle(
                color: textGreyColor,
                fontWeight: FontWeight.bold,

                // fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              interval: 1000,
              getTitles: (double value) {
                switch (value.toInt()) {
                  case 1000:
                    return '1000';
                  case 2000:
                    return '2000';
                  case 3000:
                    return '3000';
                  case 4000:
                    return '4000';
                  case 5000:
                    return '5000';
                  default:
                    return '';
                }
              },
              margin: 16,
              reservedSize: 40,
            ),
            rightTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
              showTitles: false, // Hide bottom titles (1st, 2nd, ..., 6th)
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            // drawHorizontalGrid: true,
            horizontalInterval: 999,
            // Interval at which to draw horizontal grid lines
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.2),
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(show: false),

          axisTitleData: FlAxisTitleData(show: false),
          // Hides axis titles
          // axisTextStyle: TextStyle(color: Colors.transparent), // Hides axis text
          barGroups: barDataList.map((data) {
            return BarChartGroupData(
              x: data.x,
              barRods: [
                BarChartRodData(
                  y: data.y,
                  colors: [data.x % 2 == 0 ? darkGreen : lightGreen],
                  // Alternating colors
                  width: width * 0.09,
                  // Increased bar width
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class BarData {
  final double firstValue;
  final double secondValue;
  final double thirdValue;
  final double fourthValue;
  final double fifthValue;
  final double sixthValue;

  List<SingleBar> barDataList = [];

  BarData({
    required this.firstValue,
    required this.secondValue,
    required this.thirdValue,
    required this.fourthValue,
    required this.fifthValue,
    required this.sixthValue,
  }) {
    initializeData();
  }

  void initializeData() {
    barDataList = [
      SingleBar(x: 0, y: firstValue),
      SingleBar(x: 1, y: secondValue),
      SingleBar(x: 2, y: thirdValue),
      SingleBar(x: 3, y: fourthValue),
      SingleBar(x: 4, y: fifthValue),
      SingleBar(x: 5, y: sixthValue),
    ];
  }
}

class SingleBar {
  final int x;
  final double y;

  SingleBar({required this.x, required this.y});
}
