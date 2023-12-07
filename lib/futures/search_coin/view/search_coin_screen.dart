import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/search_coin/bloc/search_coin_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchCoinBloc(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                  icon: Icon(Icons.abc),
                  onPressed: () async {
                    await GetIt.I<AbstractCoinRepository>()
                        .cryptocurrencySearch(query: 'btc');
                  },
                )
              ],
              centerTitle: true,
              pinned: true,
              snap: true,
              floating: true,
              elevation: 0,
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(
                      MediaQuery.of(context).size.height * 0.08),
                  child: Container(
                    decoration: BoxDecoration(
                        color: scaffoldBackground,
                        borderRadius: BorderRadius.circular(16)),
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 8)
                        .copyWith(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Search for a coin...')
                      ],
                    ),
                    // child: TextFormField()
                    //  TextFormField(
                    //   decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10))),
                    // ),
                    // padding: const EdgeInsets.all(5),
                  )),
              title: Text(
                'Crypto App',
                style: theme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            // SliverToBoxAdapter()
          ],
        ),
      ),
    );
  }
}
