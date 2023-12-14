import 'package:crypto_app/futures/crypto_coin_details/model/chart_data.dart';
import 'package:crypto_app/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CryptoChart extends StatefulWidget {
  const CryptoChart(
      {super.key, required this.data, required this.max, required this.min});
  final List<ChartData> data;
  final double max;
  final double min;

  @override
  State<CryptoChart> createState() => _CryptoChartState();
}

class _CryptoChartState extends State<CryptoChart> {
  late List<ChartData> data;
  late double max;
  late double min;
  @override
  void initState() {
    data = widget.data;
    max = widget.max;
    min = widget.min;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      margin: const EdgeInsets.all(0),
      borderWidth: 0,
      borderColor: Colors.transparent,
      plotAreaBorderWidth: 0,
      //add my custom max and min
      primaryXAxis: NumericAxis(
          maximum: 1,
          minimum: 168,
          isVisible: false,
          borderWidth: 0,
          borderColor: Colors.transparent),
      primaryYAxis: NumericAxis(
          maximum: max,
          minimum: min,
          interval: 1000,
          isVisible: false,
          borderWidth: 0,
          borderColor: Colors.transparent),
      series: <ChartSeries<ChartData, int>>[
        SplineAreaSeries(
          dataSource: data,
          xValueMapper: (ChartData data, _) => data.index,
          yValueMapper: (ChartData data, _) => data.price,
          splineType: SplineType.natural,
          gradient: LinearGradient(
              colors: [splineColor, scaffoldBackground.withAlpha(150)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        SplineSeries(
            // markerSettings: MarkerSettings(
            //     // isVisible: true,
            //     // color: accentColor,
            //     // borderWidth: 0.001,
            //     ),
            color: accentColor,
            dataSource: data,
            xValueMapper: (ChartData data, _) => data.index,
            yValueMapper: (ChartData data, _) => data.price)
      ],
      trackballBehavior: TrackballBehavior(
        enable: true,
        lineType: TrackballLineType.vertical,
        tooltipSettings: const InteractiveTooltip(enable: true),
      ),
    );
  }
}
