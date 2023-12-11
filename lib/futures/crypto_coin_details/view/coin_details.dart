import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../repository/abstract_coin_repository.dart';

import '../bloc/crypto_coin_details_bloc.dart';
import '../widget/widgets.dart';

@RoutePage()
class CryptoCoinDetailsScreen extends StatefulWidget {
  const CryptoCoinDetailsScreen({super.key, required this.id});

  final String id;
  @override
  State<CryptoCoinDetailsScreen> createState() =>
      _CryptoCoinDetailsScreenState();
}

class _CryptoCoinDetailsScreenState extends State<CryptoCoinDetailsScreen> {
  final _blocDetails = CryptoCoinDetailsBloc(GetIt.I<AbstractCoinRepository>());

  late final TextEditingController coinCountController;
  late final TextEditingController currencyController;

  @override
  void initState() {
    _blocDetails.add(CryptoCoinDetailsLoadEvent(id: widget.id));

    // coinCountController =
    //     TextEditingController(text: _blocDetails.numberCoins.toString());
    // currencyController = TextEditingController(
    //     text: (num.parse(coinCountController.text) * widget.coin!.currentPrice)
    //         .toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => _blocDetails,
      child: Scaffold(
        body: BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
          builder: (context, state) {
            if (state is CryptoCoinDetailsLoaded) {
              return RefreshIndicator.adaptive(
                onRefresh: () async {
                  _blocDetails.add(CryptoCoinDetailsLoadEvent(id: widget.id));
                },
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      centerTitle: true,
                      title: Row(
                        children: [
                          Image.network(
                            state.coin.image.small,
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(state.coin.name)
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        '\$${state.currentPriceInUsd}',
                        style: theme.textTheme.bodyLarge,
                      ),
                    )),

                    SliverToBoxAdapter(
                      child: CryptoCalculator(
                        blocDetails: _blocDetails,
                        coin: state.coin,

                        func: (text) {
                          _blocDetails.add(
                            CryptoCoinConvertCoinToCurrencyEvent(
                              text: text,
                            ),
                          );
                        },
                        // currentPrice: state.coin.marketData.currentPrice,
                        price: state.price,
                        list: state.coin.marketData.currentPrice
                            .toJson()
                            .keys
                            .toList()
                            .reversed
                            .map((e) => e.toString())
                            .toList(),
                      ),
                    ),

                    //chart
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        child: CryptoChart(),
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CardDateWidget(
                          coinDetails: state.coin,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: theme.textTheme.bodyLarge,
                            ),
                            Text(
                              state.coin.description.en,
                              maxLines: 15,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if (state is CryptoCoinDetailsFailure) {
              return Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.error.toString()),
                  ),
                  OutlinedButton(
                      onPressed: () async {
                        _blocDetails
                            .add(CryptoCoinDetailsLoadEvent(id: widget.id));
                      },
                      child: const Text('Try Again'))
                ],
              ));
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
