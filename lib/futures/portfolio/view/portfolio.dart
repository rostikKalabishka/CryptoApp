import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/portfolio/portfolio_mode/view/portfolio_mode.dart';
import 'package:crypto_app/futures/portfolio/watchlist/view/watchlist.dart';
import 'package:crypto_app/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/portfolio_bloc.dart';

@RoutePage()
class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) => PortfolioBloc(),
        child: DefaultTabController(
          length: 2,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(
                  'Portfolio',
                  style: theme.textTheme.bodyLarge,
                ),
                pinned: true,
                centerTitle: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(
                      MediaQuery.of(context).size.height * 0.05),
                  child: const TabBar(
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    indicatorColor: accentColor,
                    labelColor: accentColor,
                    unselectedLabelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                        text: 'Watchlist',
                      ),
                      Tab(
                        text: 'Portfolio',
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height -
                      kToolbarHeight -
                      MediaQuery.of(context).padding.top -
                      kBottomNavigationBarHeight -
                      kTextTabBarHeight,
                  child: const TabBarView(
                    children: [
                      WatchList(),
                      PortfolioMode(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
