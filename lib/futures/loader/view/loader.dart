import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/loader/bloc/loader_bloc.dart';
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
    return BlocConsumer(builder: (context, state) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }, listener: (context, state) {
      context.read<LoaderBloc>().add(LoadPage(context: context));
    });
  }
}
