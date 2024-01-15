import 'package:crypto_app/futures/crypto_coin_details/model/chart_data.dart';
import 'package:crypto_app/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CryptoChart extends StatefulWidget {
  const CryptoChart({
    super.key,
    required this.data,
    required this.max,
    required this.min,
  });

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
    final theme = Theme.of(context);
    return SfCartesianChart(
      margin: const EdgeInsets.all(0),
      borderWidth: 0,
      borderColor: Colors.transparent,
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
        maximum: data.first.index.toDouble(),
        minimum: data.last.index.toDouble(),
        isVisible: false,
        borderWidth: 0,
        borderColor: Colors.transparent,
      ),
      primaryYAxis: NumericAxis(
        maximum: max,
        minimum: min,
        interval: 1000,
        isVisible: false,
        borderWidth: 0,
        borderColor: Colors.transparent,
      ),
      series: <CartesianSeries<dynamic, dynamic>>[
        SplineAreaSeries<ChartData, int>(
          dataSource: data,
          xValueMapper: (ChartData data, _) => data.index,
          yValueMapper: (ChartData data, _) => data.price,
          splineType: SplineType.natural,
          gradient: LinearGradient(
            colors: [splineColor, scaffoldBackground.withAlpha(150)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        SplineSeries<ChartData, int>(
          enableTooltip: false,
          color: accentColor,
          dataSource: data,
          xValueMapper: (ChartData data, _) => data.index,
          yValueMapper: (ChartData data, _) => data.price,
        ),
      ],
      trackballBehavior: TrackballBehavior(
        enable: true,
        lineType: TrackballLineType.vertical,
        tooltipSettings: const InteractiveTooltip(enable: true),
        builder: (BuildContext context, TrackballDetails details) {
          if (details.pointIndex == 0) {
            return Container(
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                details.point!.y!.toStringAsFixed(8),
                style: theme.textTheme.displaySmall,
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
