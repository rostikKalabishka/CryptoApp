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
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 15,
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
}
