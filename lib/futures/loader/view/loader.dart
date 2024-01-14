import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/loader/bloc/loader_bloc.dart';
import 'package:crypto_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoaderPage extends StatefulWidget {
  const LoaderPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoaderPage> createState() => _LoaderState();
}

class _LoaderState extends State<LoaderPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoaderBloc, LoaderBlocState>(builder: (context, state) {
      context.read<LoaderBloc>().add(LoadPage(context: context));
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }, listener: (context, state) {
      navigate(context, state);
    });
  }

  void navigate(context, state) {
    final nextScreen = state == LoaderBlocState.authorize
        ? const HomeRoute()
        : const LoginRoute();

    AutoRouter.of(context)
        .pushAndPopUntil(nextScreen, predicate: (route) => false);
  }
}
