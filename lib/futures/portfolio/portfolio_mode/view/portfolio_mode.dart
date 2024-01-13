import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/portfolio/bloc/portfolio_bloc.dart';
import 'package:crypto_app/futures/portfolio/portfolio_mode/widgets/circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PortfolioMode extends StatefulWidget {
  const PortfolioMode({super.key});

  @override
  State<PortfolioMode> createState() => _PortfolioModeState();
}

class _PortfolioModeState extends State<PortfolioMode> {
  late TooltipBehavior _tooltipBehavior;
  final updatePortfolioNameController = TextEditingController();

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    // context.read<PortfolioBloc>().add(const PortfolioInfoLoadedEvent());
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
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Balance:',
                                style: theme.textTheme.displaySmall,
                              ),
                              Text(
                                '${state.balance}\$',
                                style: theme.textTheme.displaySmall,
                              )
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Profit/Loss',
                                style: theme.textTheme.displaySmall,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${state.totalProfitInUsd.toStringAsFixed(2)}\$',
                                    style: theme.textTheme.displaySmall,
                                  ),
                                  Text(
                                    '(${state.totalProfitPercentage.toStringAsFixed(3)}%)',
                                    style: theme.textTheme.displaySmall,
                                  )
                                ],
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
                  chartData: state.portfolioList,
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
          backgroundColor: theme.scaffoldBackgroundColor,
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
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))))),
        );
      });
}
