import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:crypto_app/repository/abstract_coin_repository.dart';
import '../bloc/crypto_coin_list_bloc.dart';
import '../widget/crypto_list_tile.dart';

@RoutePage()
class CryptoCoinListScreen extends StatefulWidget {
  const CryptoCoinListScreen({super.key});

  @override
  State<CryptoCoinListScreen> createState() => _CryptoCoinListScreenState();
}

class _CryptoCoinListScreenState extends State<CryptoCoinListScreen> {
  final _cryptoListBloc = CryptoCoinListBloc(GetIt.I<AbstractCoinRepository>());
  ScrollController _scrollController = ScrollController();
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
    return Scaffold(
      body: BlocBuilder<CryptoCoinListBloc, CryptoCoinListState>(
        bloc: _cryptoListBloc,
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
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notification_add_outlined),
                    ),
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Crypto App')],
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search_outlined),
                      ),
                    ],
                  ),
                  // const SliverToBoxAdapter(
                  //   child: SizedBox(
                  //     height: 15,
                  //   ),
                  // ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      height: MediaQuery.of(context).size.height * 0.05,
                      child:
                          ListView(scrollDirection: Axis.horizontal, children: [
                        //      Padding(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal:
                        //           MediaQuery.of(context).size.width * 0.01),
                        //   child: ElevatedButton(
                        //     onPressed: () {},
                        //     child: const Text('BTC/USD'),
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.005),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Top 50'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.005),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Row(
                              children: [Text('Top 100')],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.005),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Row(
                              children: [Text('Top 250')],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.005),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Row(
                              children: [Text('Top 100')],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.005),
                          child: ElevatedButton(
                            onPressed: () => _cryptoListBloc
                                .add(CryptoCoinListSorByRankEvent()),
                            child: const Row(
                              children: [Text('Sort By Rank')],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.005),
                          child: ElevatedButton(
                            onPressed: () => _cryptoListBloc
                                .add(CryptoCoinListSorByMarketCupEvent()),
                            child: const Row(
                              children: [Text('Sort By Market Cap')],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.005),
                          child: ElevatedButton(
                            onPressed: () => _cryptoListBloc
                                .add(CryptoCoinListSorByPercentChangeEvent()),
                            child: const Row(
                              children: [Text('Sort By % Change')],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.005),
                          child: ElevatedButton(
                            onPressed: () => _cryptoListBloc
                                .add(CryptoCoinListSorByPriceEvent()),
                            child: const Row(
                              children: [Text('Sort By Price')],
                            ),
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
    );
  }

  void _sorByRank() {
    _cryptoListBloc.add(CryptoCoinListSorByRankEvent());
    // _cryptoListBloc.isSorted = !_cryptoListBloc.isSorted;
  }

  void _sorByPrice() {
    _cryptoListBloc.add(CryptoCoinListSorByPriceEvent());
    // _cryptoListBloc.isSorted = !_cryptoListBloc.isSorted;
  }

  void _sorByMarketCup() {
    _cryptoListBloc.add(CryptoCoinListSorByMarketCupEvent());
    // _cryptoListBloc.isSorted = !_cryptoListBloc.isSorted;
  }

  void _sorByChangePercent() {
    _cryptoListBloc.add(CryptoCoinListSorByPercentChangeEvent());
    // _cryptoListBloc.isSorted = !_cryptoListBloc.isSorted;
  }
}
