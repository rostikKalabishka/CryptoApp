import 'package:crypto_app/futures/auth/login/bloc/login_bloc.dart';
import 'package:crypto_app/futures/loader/bloc/loader_bloc.dart';
import 'package:crypto_app/futures/portfolio/bloc/portfolio_bloc.dart';
import 'package:crypto_app/repository/data_storage_repository/abstract_data_storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'futures/auth/registration/bloc/registration_bloc.dart';
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
  final _settingsBloc = SettingsBloc(GetIt.I<AbstractAuthRepository>(),
      GetIt.I<AbstractDataStorageRepository>());
  final _loginBloc = LoginBloc(GetIt.I<AbstractAuthRepository>());
  final _registrationBloc = RegistrationBloc(GetIt.I<AbstractAuthRepository>());
  final _portfolioBloc =
      PortfolioBloc(GetIt.I<AbstractDataStorageRepository>());

  @override
  void initState() {
    _settingsBloc.add(SettingsLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => _settingsBloc,
        ),
        BlocProvider(
          create: (_) => _loginBloc,
          // child: const LoginScreen(),
        ),
        BlocProvider(
          create: (_) => _portfolioBloc,
        ),
        BlocProvider(
          create: (_) => _registrationBloc,
          // child: const RegistrationScreen(),
        ),
        BlocProvider(
          create: (_) => LoaderBloc(GetIt.I<AbstractAuthRepository>()),
        ),
      ],
      child:
          BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Crypto App',
          theme: state.switchValue ? darkTheme : lightTheme,
          routerConfig: _appRouter.config(),
        );
      }),
    );
  }
}
