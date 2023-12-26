import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'futures/settings/bloc/settings_bloc.dart';
import 'futures/settings/bloc/settings_state.dart';
import 'repository/auth/abstract_auth_repository.dart';
import 'router/router.dart';
import 'ui/theme/theme.dart';

class CryptoApp extends StatefulWidget {
  const CryptoApp({super.key});

  @override
  State<CryptoApp> createState() => _CryptoAppState();
}

class _CryptoAppState extends State<CryptoApp> {
  final _appRouter = AppRouter();
  final _settingsBloc = SettingsBloc(GetIt.I<AbstractAuthRepository>());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _settingsBloc,
      child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
        log('SettingsBloc state changed: $state');
        // if (state is SettingsLoaded) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Crypto App',
          theme: state.switchValue ? darkTheme : lightTheme,
          routerConfig: _appRouter.config(),
        );
      }
          //    else if (state is SettingsFailure) {
          //     return Center(
          //       child: Text('${state.error}'),
          //     );
          //   }
          //   return const Center(child: CircularProgressIndicator.adaptive());
          // },
          ),
    );
  }
}
