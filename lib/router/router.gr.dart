// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CryptoCoinDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CryptoCoinDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CryptoCoinDetailsScreen(
          key: args.key,
          coin: args.coin,
          id: args.id,
        ),
      );
    },
    CryptoCoinListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CryptoCoinListScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    PortfolioRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PortfolioPage(),
      );
    },
    SearchCoinRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchCoinScreen(),
      );
    },
  };
}

/// generated route for
/// [CryptoCoinDetailsScreen]
class CryptoCoinDetailsRoute extends PageRouteInfo<CryptoCoinDetailsRouteArgs> {
  CryptoCoinDetailsRoute({
    Key? key,
    CryptoCoin? coin,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          CryptoCoinDetailsRoute.name,
          args: CryptoCoinDetailsRouteArgs(
            key: key,
            coin: coin,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'CryptoCoinDetailsRoute';

  static const PageInfo<CryptoCoinDetailsRouteArgs> page =
      PageInfo<CryptoCoinDetailsRouteArgs>(name);
}

class CryptoCoinDetailsRouteArgs {
  const CryptoCoinDetailsRouteArgs({
    this.key,
    this.coin,
    required this.id,
  });

  final Key? key;

  final CryptoCoin? coin;

  final String id;

  @override
  String toString() {
    return 'CryptoCoinDetailsRouteArgs{key: $key, coin: $coin, id: $id}';
  }
}

/// generated route for
/// [CryptoCoinListScreen]
class CryptoCoinListRoute extends PageRouteInfo<void> {
  const CryptoCoinListRoute({List<PageRouteInfo>? children})
      : super(
          CryptoCoinListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CryptoCoinListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PortfolioPage]
class PortfolioRoute extends PageRouteInfo<void> {
  const PortfolioRoute({List<PageRouteInfo>? children})
      : super(
          PortfolioRoute.name,
          initialChildren: children,
        );

  static const String name = 'PortfolioRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchCoinScreen]
class SearchCoinRoute extends PageRouteInfo<void> {
  const SearchCoinRoute({List<PageRouteInfo>? children})
      : super(
          SearchCoinRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchCoinRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
