import 'package:crypto_app/futures/portfolio/portfolio_mode/widgets/circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/model.dart';

class PortfolioMode extends StatefulWidget {
  const PortfolioMode({super.key});

  @override
  State<PortfolioMode> createState() => _PortfolioModeState();
}

class _PortfolioModeState extends State<PortfolioMode> {
  late List<CoinUserData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Card(
              color: theme.cardColor,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Portfolio',
                          style: theme.textTheme.labelMedium,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 20,
                            ))
                      ],
                    ),
                    const Divider(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Balance'), Text('500000\$')],
                    ),
                    const Divider(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Profit/Loss'),
                        Row(
                          children: [Text('\$0.00'), Text('(0.00%)')],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CircularChart(
            chartData: _chartData,
            tooltipBehavior: _tooltipBehavior,
          ),
        )
      ],
    );
  }
}

List<CoinUserData> getChartData() {
  final List<CoinUserData> chartData = [
    const CoinUserData(cryptocurrencyName: 'BTC', priceCurrent: 12012.2),
    const CoinUserData(cryptocurrencyName: 'ETH', priceCurrent: 2012.2),
    const CoinUserData(cryptocurrencyName: 'PEPE', priceCurrent: 112.2),
    const CoinUserData(cryptocurrencyName: 'USDT', priceCurrent: 8012.2),
    const CoinUserData(cryptocurrencyName: 'SOL', priceCurrent: 3012.2),
    const CoinUserData(cryptocurrencyName: 'BNB', priceCurrent: 502.2),
    const CoinUserData(cryptocurrencyName: 'DOGE', priceCurrent: 1012.2),
  ];
  return chartData;
}
