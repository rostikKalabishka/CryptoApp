import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/portfolio_bloc.dart';

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
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              title: Text(
                'Portfolio',
                style: theme.textTheme.bodyLarge,
              ),
            )
            // SliverToBoxAdapter()
          ],
        ),
      ),
    );
  }
}
