import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/home/view/home_screen.dart';
import 'package:flutter/material.dart';

import '../futures/crypto_coin_details/view/coin_details.dart';
import '../futures/crypto_coin_list/view/crypto_coin_list_screen.dart';
import '../futures/search_coin/view/search_coin_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/', children: [
          AutoRoute(
            page: CryptoCoinListRoute.page,
            path: 'crypto_coin_list',
          )
        ]),
        AutoRoute(page: CryptoCoinDetailsRoute.page)
      ];
}
