import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/router/router.dart';
import 'package:crypto_app/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:crypto_app/repository/crypto_coin/abstract_coin_repository.dart';
import '../bloc/crypto_coin_list_bloc.dart';
import '../widget/crypto_list_tile.dart';

// ignore: camel_case_types
enum buttonStateEnum { topFifty, topHundred, topTwoHundredFifty }

@RoutePage()
class CryptoCoinListScreen extends StatefulWidget {
  const CryptoCoinListScreen({super.key});

  @override
  State<CryptoCoinListScreen> createState() => _CryptoCoinListScreenState();
}

class _CryptoCoinListScreenState extends State<CryptoCoinListScreen> {
  final _cryptoListBloc = CryptoCoinListBloc(GetIt.I<AbstractCoinRepository>());
  final ScrollController _scrollController = ScrollController();
  bool topFiftyButtonEnabled = true;
  bool topHundredButtonEnabled = false;
  bool topTwoHundredFiftyButtonEnabled = true;
  @override
  void initState() {
    _cryptoListBloc.add(CryptoCoinListLoadEvent());
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        _cryptoListBloc.add(CryptoCoinListLoadNextPageEvent());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => _cryptoListBloc,
      child: Scaffold(
        body: BlocBuilder<CryptoCoinListBloc, CryptoCoinListState>(
          builder: (BuildContext context, CryptoCoinListState state) {
            if (state is CryptoCoinListLoaded) {
              return RefreshIndicator.adaptive(
                onRefresh: () async {
                  _cryptoListBloc.add(CryptoCoinListLoadEvent());
                },
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverAppBar(
                      backgroundColor: scaffoldBackground,
                      centerTitle: true,
                      leading: IconButton(
                        onPressed: () {
                          AutoRouter.of(context).push(
                            const SettingsRoute(),
                          );
                        },
                        icon: const Icon(Icons.notification_add_outlined),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Crypto App',
                            style: theme.textTheme.bodyLarge,
                          )
                        ],
                      ),
                      actions: [
                        IconButton(
                          onPressed: () {
                            AutoRouter.of(context).push(
                              const SearchCoinRoute(),
                            );
                          },
                          icon: const Icon(Icons.search_outlined),
                        ),
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.005),
                                child: ElevatedButton(
                                  onPressed: topFiftyButtonEnabled
                                      ? () => buttonEnabled(
                                          buttonStateEnum.topFifty)
                                      : null,
                                  child: Text('Top 50',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.005),
                                child: ElevatedButton(
                                  onPressed: topHundredButtonEnabled
                                      ? () => buttonEnabled(
                                          buttonStateEnum.topHundred)
                                      : null,
                                  child: Text('Top 100',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.005),
                                child: ElevatedButton(
                                  onPressed: topTwoHundredFiftyButtonEnabled
                                      ? () => buttonEnabled(
                                          buttonStateEnum.topTwoHundredFifty)
                                      : null,
                                  child: Text('Top 250',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.005),
                                child: ElevatedButton(
                                  onPressed: () => _cryptoListBloc
                                      .add(CryptoCoinListSorByRankEvent()),
                                  child: Text('Sort By Rank',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.005),
                                child: ElevatedButton(
                                  onPressed: () => _cryptoListBloc
                                      .add(CryptoCoinListSorByMarketCupEvent()),
                                  child: Text('Sort By Market Cap',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.005),
                                child: ElevatedButton(
                                  onPressed: () => _cryptoListBloc.add(
                                      CryptoCoinListSorByPercentChangeEvent()),
                                  child: Text('Sort By % Change',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.005),
                                child: ElevatedButton(
                                  onPressed: () => _cryptoListBloc
                                      .add(CryptoCoinListSorByPriceEvent()),
                                  child: Text('Sort By Price',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SliverList.separated(
                        itemCount: state.cryptoCoinList.length + 1,
                        itemBuilder: (context, index) {
                          if (index < state.cryptoCoinList.length) {
                            final coin = state.cryptoCoinList[index];
                            return CryptoListTile(
                              coin: coin,
                            );
                          } else {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 32),
                              child: Center(
                                  child: CircularProgressIndicator.adaptive()),
                            );
                          }
                        },
                        separatorBuilder: (context, i) => const Divider())
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator.adaptive());
          },
        ),
      ),
    );
  }

  void buttonEnabled(buttonStateEnum buttonEnum) {
    switch (buttonEnum) {
      case buttonStateEnum.topFifty:
        setState(() {
          topFiftyButtonEnabled = false;
          topHundredButtonEnabled = true;
          topTwoHundredFiftyButtonEnabled = true;
        });
        _cryptoListBloc.add(CryptoCoinListLoadTopFiftyCoinEvent());
      case buttonStateEnum.topHundred:
        setState(() {
          topFiftyButtonEnabled = true;
          topHundredButtonEnabled = false;
          topTwoHundredFiftyButtonEnabled = true;
        });
        _cryptoListBloc.add(CryptoCoinListLoadEvent());
      case buttonStateEnum.topTwoHundredFifty:
        setState(() {
          topFiftyButtonEnabled = true;
          topHundredButtonEnabled = true;
          topTwoHundredFiftyButtonEnabled = false;
        });
        _cryptoListBloc.add(CryptoCoinListLoadTopTwoHundredFiftyCoinEvent());
    }
  }
}
