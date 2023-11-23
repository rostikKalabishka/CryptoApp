// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  @override
  void initState() {
    _cryptoListBloc.add(CryptoCoinListLoadEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CryptoCoinListBloc, CryptoCoinListState>(
        bloc: _cryptoListBloc,
        builder: (BuildContext context, CryptoCoinListState state) {
          if (state is CryptoCoinListLoaded) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notification_add_outlined),
                  ),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('data')],
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search_outlined),
                    ),
                  ],
                ),
                SliverList.separated(
                    itemCount: state.cryptoCoinList.length,
                    itemBuilder: (context, index) {
                      final coin = state.cryptoCoinList[index];
                      return CryptoListTile(
                        coin: coin,
                      );
                    },
                    separatorBuilder: (context, i) => const Divider())
              ],
            );
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
