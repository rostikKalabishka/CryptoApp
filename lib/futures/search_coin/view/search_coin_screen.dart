import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/search_coin/bloc/search_coin_bloc.dart';
import 'package:crypto_app/futures/search_coin/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:crypto_app/ui/theme/const.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../repository/abstract_coin_repository.dart';

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
          onRefresh: () async {},
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                pinned: true,
                title: Text(
                  'Crypto App',
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
                snap: true,
                floating: true,
                elevation: 0,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(
                      MediaQuery.of(context).size.height * 0.09),
                  child: Container(
                    decoration: BoxDecoration(
                        color: scaffoldBackground,
                        borderRadius: BorderRadius.circular(12)),
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 8)
                        .copyWith(bottom: 12),
                    padding: const EdgeInsets.all(1),
                    child: TextFormField(
                      controller: searchCoinController,
                      onChanged: (text) {
                        final completer = Completer<void>();
                        if (text.isEmpty) {
                          _searchCoinBloc
                              .add(const TrendingCoinListLoadedEvent());
                          completer.future;
                        } else if (text.isNotEmpty) {
                          _searchCoinBloc.add(SearchQueryEvent(query: text));
                          completer.complete();
                        }
                      },
                      style: theme.textTheme.bodySmall,
                      decoration: const InputDecoration(
                          hintText: 'Search for a coin...',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none)),
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
    );
  }
}
