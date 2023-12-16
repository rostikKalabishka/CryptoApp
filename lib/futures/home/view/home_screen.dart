import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/settings/view/settings.dart';

import 'package:flutter/material.dart';

import '../../crypto_coin_list/view/view.dart';
import '../../portfolio/view/portfolio.dart';
import '../../search_coin/view/search_coin_screen.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indexPage = 0;
  onPageChanged(int indexPage) {
    setState(() {
      _indexPage = indexPage;
    });
  }

  List<Widget> pages = const [
    CryptoCoinListScreen(),
    SearchCoinScreen(),
    PortfolioScreen(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      body: IndexedStack(
        index: _indexPage,
        children: pages,
      ),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      onTap: onPageChanged,
      unselectedItemColor: Colors.white,
      currentIndex: _indexPage,
      selectedItemColor: Colors.blue[800],
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Market'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(Icons.backpack_outlined), label: 'Portfolio'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined), label: 'Settings')
      ],
    );
  }
}
