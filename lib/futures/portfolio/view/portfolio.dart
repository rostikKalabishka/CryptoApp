import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/portfolio/portfolio_mode/view/portfolio_mode.dart';
import 'package:crypto_app/futures/portfolio/watchlist/view/watchlist.dart';
import 'package:flutter/material.dart';

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
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add))
              ],
              title: Text(
                'Portfolio',
                style: theme.textTheme.bodyLarge,
              ),
              pinned: true,
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.05),
                child: TabBar(
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  indicatorColor: theme.indicatorColor,
                  labelColor: theme.indicatorColor,
                  unselectedLabelColor: theme.unselectedWidgetColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
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
    );
  }
}
