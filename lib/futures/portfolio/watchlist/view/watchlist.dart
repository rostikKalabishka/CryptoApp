import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/router/router.dart';
import 'package:flutter/material.dart';

class WatchList extends StatelessWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        SliverList.separated(
          itemBuilder: (context, index) {
            return SizedBox(
              height: 60,
              child: ListTile(
                onTap: () {
                  AutoRouter.of(context)
                      .push(CryptoCoinDetailsRoute(id: 'bitcoin'));
                },
                leading: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: AspectRatio(
                    aspectRatio: 0.45,
                    child: Image.network(
                      'https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1696501400',
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'BTC',
                        style:
                            theme.textTheme.bodySmall?.copyWith(fontSize: 12),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '\$42312.0',
                        textAlign: TextAlign.end,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    // const Spacer(
                    //   flex: 1,
                    // ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '12 %',
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '\$44444444444',
                        textAlign: TextAlign.end,
                        style: theme.textTheme.bodyMedium,
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
          itemCount: 20,
        )
      ],
    );
  }
}
