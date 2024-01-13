import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/coin_user_data.dart';

class CircularChart extends StatefulWidget {
  const CircularChart({
    Key? key,
    required this.chartData,
    required this.tooltipBehavior,
  }) : super(key: key);
  final List<CoinUserData> chartData;
  final TooltipBehavior tooltipBehavior;

  @override
  State<CircularChart> createState() => _CircularChartState();
}

class _CircularChartState extends State<CircularChart> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          'My Cryptocurrency',
          style: theme.textTheme.bodyLarge?.copyWith(fontSize: 18),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SfCircularChart(
          tooltipBehavior: widget.tooltipBehavior,
          legend: widget.chartData.isNotEmpty
              ? Legend(
                  textStyle: theme.textTheme.displaySmall,
                  isVisible: true,
                  position: LegendPosition.bottom,
                  alignment: ChartAlignment.center,
                  padding: 10,
                  // offset: const Offset(0, 10.0),
                  overflowMode: LegendItemOverflowMode.wrap,
                  toggleSeriesVisibility: true)
              : const Legend(isVisible: false),
          series: <CircularSeries>[
            PieSeries<CoinUserData, String>(
              radius: '105%',
              dataSource: widget.chartData,
              xValueMapper: (CoinUserData data, _) => data.cryptocurrencyName,
              yValueMapper: (CoinUserData data, _) => data.coinInUsd,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                textStyle: TextStyle(color: Colors.white),
              ),
              enableTooltip: true,
            ),
          ],
        )
      ],
    );
  }
}
