import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/portfolio/bloc/portfolio_bloc.dart';
import 'package:crypto_app/futures/portfolio/portfolio_mode/widgets/circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final updatePortfolioNameController = TextEditingController();
  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    context.read<PortfolioBloc>().add(const PortfolioInfoLoadedEvent());
    super.initState();
  }

  @override
  void dispose() {
    updatePortfolioNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final portfolioBloc = context.read<PortfolioBloc>();
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        if (state is PortfolioLoaded) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Card(
                    color: theme.cardColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 12, left: 12, right: 12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  state.portfolioName.isNotEmpty
                                      ? state.portfolioName
                                      : 'My Portfolio',
                                  style: theme.textTheme.labelMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                  onPressed: () async {
                                    await openDialog(context);
                                  },
                                  icon: const Icon(
                                    Icons.more_vert,
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
                                children: [Text('0.00'), Text('(0.00%)')],
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
        } else if (state is PortfolioFailure) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: Column(
                children: [
                  Text(state.error.toString()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  TextButton(
                      onPressed: () {
                        portfolioBloc.add(const PortfolioInfoLoadedEvent());
                      },
                      child: Text(
                        'Try Again',
                        style: theme.textTheme.bodySmall,
                      ))
                ],
              ))
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }

  Future openDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        return AlertDialog(
          backgroundColor: theme.dialogBackgroundColor,
          title: Text(
            'Portfolio name',
            style: theme.textTheme.bodyLarge,
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  context.read<PortfolioBloc>().add(UpdatePortfolioNameEvent(
                      updatePortfolioName: updatePortfolioNameController.text));
                  updatePortfolioNameController.clear();
                  AutoRouter.of(context).pop();
                },
                child: const Text('Update'))
          ],
          content: TextFormField(
              controller: updatePortfolioNameController,
              style: theme.textTheme.bodySmall,
              decoration: InputDecoration(
                  hintText: 'Enter your name of the portfolio',
                  hintStyle: TextStyle(color: theme.hintColor),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  enabledBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none))),
        );
      });
}

List<CoinUserData> getChartData() {
  final List<CoinUserData> chartData = [
    const CoinUserData(
        cryptocurrencyName: 'BTC',
        priceCurrent: 12012.2,
        id: 'BTC',
        image: '',
        rank: 1,
        priceWhichBought: 1000),
    const CoinUserData(
        cryptocurrencyName: 'ETH',
        priceCurrent: 2012.2,
        id: '',
        image: '',
        rank: 2,
        priceWhichBought: 1000),
    const CoinUserData(
        cryptocurrencyName: 'PEPE',
        priceCurrent: 112.2,
        id: '',
        image: '',
        rank: 3,
        priceWhichBought: 1000),
    const CoinUserData(
        cryptocurrencyName: 'USDT',
        priceCurrent: 8012.2,
        id: '',
        image: '',
        rank: 4,
        priceWhichBought: 1000),
    const CoinUserData(
        cryptocurrencyName: 'SOL',
        priceCurrent: 3012.2,
        id: '',
        image: '',
        rank: 5,
        priceWhichBought: 1000),
    const CoinUserData(
        cryptocurrencyName: 'BNB',
        priceCurrent: 502.2,
        id: '',
        image: '',
        rank: 6,
        priceWhichBought: 1000),
    const CoinUserData(
        cryptocurrencyName: 'DOGE',
        priceCurrent: 1012.2,
        id: '',
        image: '',
        rank: 7,
        priceWhichBought: 1000),
  ];
  return chartData;
}
