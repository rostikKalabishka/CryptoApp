import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/search_coin/bloc/search_coin_bloc.dart';
import 'package:crypto_app/futures/search_coin/widgets/widgets.dart';
import 'package:crypto_app/ui/theme/const.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../repository/crypto_coin/abstract_coin_repository.dart';

@RoutePage()
class SearchCoinScreen extends StatefulWidget {
  const SearchCoinScreen({super.key});

  @override
  State<SearchCoinScreen> createState() => _SearchCoinScreenState();
}

class _SearchCoinScreenState extends State<SearchCoinScreen> {
  final searchCoinController = TextEditingController();
  final _searchCoinBloc = SearchCoinBloc(GetIt.I<AbstractCoinRepository>());
  @override
  void initState() {
    _searchCoinBloc.add(const TrendingCoinListLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => _searchCoinBloc,
      child: Scaffold(
        body: RefreshIndicator.adaptive(
          onRefresh: () async {
            searchCoinController.clear();
            _searchCoinBloc.add(const TrendingCoinListLoadedEvent());
          },
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  pinned: true,
                  title: Text(
                    'Search',
                    style: theme.textTheme.bodyLarge,
                  ),
                  snap: true,
                  floating: true,
                  elevation: 0,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(
                        MediaQuery.of(context).size.height * 0.0865),
                    child: Container(
                      decoration: BoxDecoration(
                          color: splineColor.withAlpha(45),
                          borderRadius: BorderRadius.circular(12)),
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 8)
                          .copyWith(bottom: 12),
                      padding: const EdgeInsets.all(1),
                      child: TextFormField(
                        controller: searchCoinController,
                        onChanged: (text) {
                          if (text.isEmpty) {
                            _searchCoinBloc
                                .add(const TrendingCoinListLoadedEvent());
                          } else if (text.isNotEmpty) {
                            _searchCoinBloc.add(SearchQueryEvent(query: text));
                          }
                        },
                        style: theme.textTheme.bodySmall,
                        decoration: InputDecoration(
                            hintText: 'Search for a coin...',
                            hintStyle: TextStyle(color: theme.hintColor),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  ),
                ),
                BlocBuilder<SearchCoinBloc, SearchCoinState>(
                    builder: (context, state) {
                  if (state is SearchCoinLoadedQuery) {
                    return SliverList.separated(
                      itemCount: state.cryptocurrencySearchCoin.length,
                      itemBuilder: (context, index) {
                        final cryptocurrencySearchCoin =
                            state.cryptocurrencySearchCoin[index];
                        return SearchListTile(
                          id: cryptocurrencySearchCoin.id,
                          image: cryptocurrencySearchCoin.thumb,
                          name: cryptocurrencySearchCoin.name,
                          symbol: cryptocurrencySearchCoin.symbol,
                          marketCapRank: cryptocurrencySearchCoin.marketCapRank,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Divider(),
                        );
                      },
                    );
                  } else if (state is TrendingCryptoLoaded) {
                    return SliverList.separated(
                      itemCount: state.trendingCryptoList.length,
                      itemBuilder: (context, index) {
                        final trendingCryptoList =
                            state.trendingCryptoList[index];
                        return SearchListTile(
                          id: trendingCryptoList.id,
                          image: trendingCryptoList.thumb,
                          name: trendingCryptoList.name,
                          symbol: trendingCryptoList.symbol,
                          marketCapRank: trendingCryptoList.marketCapRank,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Divider(),
                        );
                      },
                    );
                  } else {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
