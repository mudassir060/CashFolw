import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Pie_Chart extends StatefulWidget {
  final String AvailableBalance;
  final String TOTALEARNPOINT;
  final String PandingBalance;
  final String TOTALCLICK;
  final String REMAINTODAYCLICK;
  const Pie_Chart(
      {Key? key,
      required this.AvailableBalance,
      required this.TOTALEARNPOINT,
      required this.PandingBalance,
      required this.TOTALCLICK,
      required this.REMAINTODAYCLICK})
      : super(key: key);

  @override
  _Pie_ChartState createState() => _Pie_ChartState();
}

class _Pie_ChartState extends State<Pie_Chart> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    var AvailableBalance = int.parse(widget.AvailableBalance) ;
    var TOTALEARNPOINT = int.parse(widget.TOTALEARNPOINT);
    var PandingBalance = int.parse(widget.PandingBalance);
    var TOTALCLICK = int.parse(widget.TOTALCLICK);
    var REMAINTODAYCLICK = int.parse(widget.REMAINTODAYCLICK);
    // Totel =
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback:
                          (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections()),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Color(0xff0293ee),
                  text: 'Available_Balance',
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xfff8b250),
                  text: 'Total Point',
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xff845bef),
                  text: 'Panding Balance',
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xff13d38e),
                  text: 'Total Click',
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xff13d38e),
                  text: 'Remain Today Click',
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    var abc = 0;
    return List.generate(6, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '$abc%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 4:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 5:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  const Indicator({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: color,
          height: 5,
          width: 10,
        ),
        Text(text)
      ],
    );
  }
}
