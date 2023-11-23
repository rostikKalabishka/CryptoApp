import 'package:crypto_app/repository/abstract_coin_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/crypto_coin_list_bloc.dart';
// import '../../../repository/crypto_coin/models/crypto_coin_list.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('data')],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notification_add_outlined),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          ),
        ],
      ),
      body: SafeArea(
          child: BlocBuilder<CryptoCoinListBloc, CryptoCoinListState>(
        bloc: _cryptoListBloc,
        builder: (BuildContext context, CryptoCoinListState state) {
          if (state is CryptoCoinListLoaded) {
            return Center(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.cryptoCoinList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: AspectRatio(
                            aspectRatio: 25 / 40,
                            child: Image.network(
                              state.cryptoCoinList[index].image,
                            ),
                          ),
                          title: Text('${state.cryptoCoinList[index].name} '),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      )),
    );
  }
}
