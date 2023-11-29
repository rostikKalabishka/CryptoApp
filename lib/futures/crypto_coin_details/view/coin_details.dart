import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../repository/abstract_coin_repository.dart';
import '../../../repository/crypto_coin/models/crypto_coin.dart';
import '../bloc/crypto_coin_details_bloc.dart';

@RoutePage()
class CryptoCoinDetailsScreen extends StatefulWidget {
  const CryptoCoinDetailsScreen({super.key, required this.coin});
  final CryptoCoin coin;
  @override
  State<CryptoCoinDetailsScreen> createState() =>
      _CryptoCoinDetailsScreenState();
}

class _CryptoCoinDetailsScreenState extends State<CryptoCoinDetailsScreen> {
  final _blocDetails = CryptoCoinDetailsBloc(GetIt.I<AbstractCoinRepository>());
  @override
  void initState() {
    super.initState();
    _blocDetails.add(CryptoCoinDetailsLoadEvent(id: widget.coin.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
        bloc: _blocDetails,
        builder: (context, state) {
          if (state is CryptoCoinDetailsLoaded) {
            RefreshIndicator.adaptive(
              onRefresh: () async {},
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    centerTitle: true,
                    title: Row(
                      children: [Text(state.coin.name)],
                    ),
                  )
                ],
              ),
            );
          } else if (state is CryptoCoinDetailsFailure) {
            return Center(
                child: Column(
              children: [
                const Text('Error'),
                OutlinedButton(onPressed: () {}, child: const Text('Try Again'))
              ],
            ));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  // void setup(id) async {
  //   await GetIt.I<AbstractCoinRepository>().getCryptoCoinDetails(id: id);
  // }
}
