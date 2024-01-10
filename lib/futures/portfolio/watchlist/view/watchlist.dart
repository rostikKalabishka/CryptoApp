import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/portfolio/bloc/portfolio_bloc.dart';
import 'package:crypto_app/router/router.dart';
import 'package:crypto_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchList extends StatefulWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  final coinController = TextEditingController();
  final Utils utils = Utils();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    context.read<PortfolioBloc>().add(const PortfolioInfoLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final portfolioBloc = context.read<PortfolioBloc>();

    return BlocBuilder<PortfolioBloc, PortfolioState>(
        builder: (context, state) {
      if (state is PortfolioLoaded) {
        final portfolioList = state.portfolioList;
        return RefreshIndicator.adaptive(
          onRefresh: () async {
            portfolioBloc.add(const PortfolioListUpdateEvent());
          },
          child: CustomScrollView(
            slivers: [
              portfolioList.isNotEmpty
                  ? SliverList.separated(
                      itemCount: portfolioList.length,
                      itemBuilder: (context, index) {
                        final currentCryptoCoin = portfolioList[index];
                        return SizedBox(
                          height: 60,
                          child: ListTile(
                            onTap: () {
                              AutoRouter.of(context).push(
                                  CryptoCoinDetailsRoute(
                                      id: currentCryptoCoin.id));
                            },
                            leading: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: AspectRatio(
                                aspectRatio: 0.45,
                                child: Image.network(
                                  currentCryptoCoin.image,
                                ),
                              ),
                            ),
                            title: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    currentCryptoCoin.symbol.toUpperCase(),
                                    style: theme.textTheme.bodySmall
                                        ?.copyWith(fontSize: 12),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '\$${currentCryptoCoin.priceCurrent}',
                                    textAlign: TextAlign.end,
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '\$${currentCryptoCoin.priceWhichBought}',
                                    style: theme.textTheme.bodyMedium,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '${currentCryptoCoin.emountCoins}',
                                    style: theme.textTheme.bodyMedium,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.08),
                                    child: IconButton(
                                      onPressed: () {
                                        openDialog(context);
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    )
                  : SliverToBoxAdapter(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Center(
                          child: Text(
                            'Add coin to your portfolio',
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                      ),
                    )
            ],
          ),
        );
      } else if (state is PortfolioFailure) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Column(
              children: [
                Text(state.error.toString()),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                TextButton(
                    onPressed: () {
                      portfolioBloc.add(const PortfolioInfoLoadedEvent());
                    },
                    child: Text(
                      'Try Again',
                      style: theme.textTheme.bodySmall,
                    ))
              ],
            ))
          ],
        );
      }
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    });
  }

  Future openDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        return AlertDialog(
          backgroundColor: theme.scaffoldBackgroundColor,
          title: Text(
            'Add coins',
            style: theme.textTheme.bodyLarge,
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<PortfolioBloc>().add(PortfolioAddedCoinEvent(
                        emountCoins: coinController.text));
                    coinController.clear();

                    AutoRouter.of(context).pop();
                  }
                },
                child: const Text('Add'))
          ],
          content: Form(
            key: _formKey,
            child: TextFormField(
                validator: (val) => utils.addCoinValidator(val!),
                keyboardType: TextInputType.number,
                controller: coinController,
                style: theme.textTheme.bodySmall,
                decoration: InputDecoration(
                    hintText: 'Add coins',
                    hintStyle: TextStyle(color: theme.hintColor),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))))),
          ),
        );
      });
}
