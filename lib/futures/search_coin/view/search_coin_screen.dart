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
  final searchCoinBloc = SearchCoinBloc(GetIt.I<AbstractCoinRepository>());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => searchCoinBloc,
      child: Scaffold(
        body: BlocBuilder<SearchCoinBloc, SearchCoinState>(
          builder: (context, state) {
            if (state is SearchCoinLoadedQuery) {
              return RefreshIndicator.adaptive(
                onRefresh: () async {},
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      // actions: [
                      //   IconButton(
                      //     icon: Icon(Icons.abc),
                      //     onPressed: () async {
                      //       await GetIt.I<AbstractCoinRepository>()
                      //           .cryptocurrencySearch(query: 'btc');
                      //     },
                      //   )
                      // ],
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
                                style: theme.textTheme.bodySmall,
                                decoration: const InputDecoration(
                                    hintText: 'Search for a coin...',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none)),
                              ))),
                    ),
                    SliverList.separated(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return SearchListTile(
                          image:
                              'https://assets.coingecko.com/coins/images/19512/thumb/tzbtc.png',
                          name: 'Bitcoin',
                          symbol: 'BTC',
                          marketCapRank: 1,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Divider(),
                        );
                      },
                    )
                  ],
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }
}
