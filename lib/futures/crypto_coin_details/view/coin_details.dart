import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../repository/crypto_coin/abstract_coin_repository.dart';

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

  late String selectedItem;
  late String price;
  late String numberCoins;

  late TextEditingController coinCountController;

  late TextEditingController currencyController;
  @override
  void initState() {
    _blocDetails.add(CryptoCoinDetailsLoadEvent(id: widget.id));
    super.initState();
    coinCountController = TextEditingController();
    currencyController = TextEditingController();
    _blocDetails.stream.listen((state) {
      if (state is CryptoCoinDetailsLoaded) {
        setState(() {
          price = state.price;
          numberCoins = state.counterCoin;
          currencyController.text = price;
          coinCountController.text = numberCoins;
        });
      }
    });
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
                          Text(
                            state.coin.name,
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        '\$${state.coinDetailsPrice}',
                        style: theme.textTheme.bodyLarge,
                      ),
                    )),

                    SliverToBoxAdapter(
                      child: CryptoCalculator(
                        blocDetails: _blocDetails,
                        coin: state.coin,
                        price: price,
                        dropDownList: state.dropDownList,
                        coinCountController: coinCountController,
                        currencyController: currencyController,
                      ),
                    ),

                    //chart
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 0,
                        ),
                        child: CryptoChart(
                          data: state.sparkLine,
                          max: state.max,
                          min: state.min,
                        ),
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
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text(
                      'Crypto App',
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Expanded(
                      child: Center(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(state.error.toString()),
                          ),
                          OutlinedButton(
                              onPressed: () async {
                                _blocDetails.add(
                                    CryptoCoinDetailsLoadEvent(id: widget.id));
                              },
                              child: Text(
                                'Try Again',
                                style: theme.textTheme.bodyMedium,
                              ))
                        ],
                      )),
                    ),
                  )
                ],
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
