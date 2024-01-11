import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/auth/login/view/login.dart';
import 'package:crypto_app/futures/auth/registration/view/registration.dart';
import 'package:crypto_app/futures/home/view/home_screen.dart';
import 'package:crypto_app/futures/loader/view/loader.dart';
import 'package:crypto_app/futures/settings/view/settings.dart';

import 'package:flutter/material.dart';

import '../futures/auth/reset_password/view/reset_password.dart';
import '../futures/crypto_coin_details/view/coin_details.dart';
import '../futures/crypto_coin_list/view/crypto_coin_list_screen.dart';
import '../futures/portfolio/view/portfolio.dart';
import '../futures/search_coin/view/search_coin_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(page: LoaderRoute.page, path: '/', initial: true),
        AutoRoute(
          page: LoginRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: ResetPasswordRoute.page,
          path: '/reset_password',
        ),
        AutoRoute(
          page: RegistrationRoute.page,
          path: '/registration',
        ),
        AutoRoute(page: HomeRoute.page, path: '/home', children: [
          AutoRoute(
            page: CryptoCoinListRoute.page,
            path: 'crypto_coin_list',
          ),
          AutoRoute(
            page: SearchCoinRoute.page,
            path: 'search_coin',
          ),
          AutoRoute(
            page: PortfolioRoute.page,
            path: 'portfolio',
          ),
          AutoRoute(
            page: SettingsRoute.page,
            path: 'settings',
          )
        ]),
        AutoRoute(page: CryptoCoinDetailsRoute.page),
      ];
}
