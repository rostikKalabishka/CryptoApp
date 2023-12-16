import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/portfolio/portfolio_mode/view/portfolio_mode.dart';
import 'package:crypto_app/futures/portfolio/watchlist/view/watchlist.dart';
import 'package:crypto_app/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/portfolio_bloc.dart';

@RoutePage()
class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
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
                pinned: true,
                centerTitle: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(
                      MediaQuery.of(context).size.height * 0.05),
                  child: const TabBar(
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    indicatorWeight: 4,
                    indicatorColor: accentColor,
                    labelColor: accentColor,
                    unselectedLabelColor: Colors.white,
                    tabs: [
                      Tab(
                        text: 'Watchlist',
                      ),
                      Tab(
                        text: 'Portfolio',
                      )
                    ],
                  ),
                ),
                title: Text(
                  'Portfolio',
                  style: theme.textTheme.bodyLarge,
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
