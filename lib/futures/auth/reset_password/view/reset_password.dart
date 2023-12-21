import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/auth/reset_password/bloc/reset_password_bloc.dart';
import 'package:crypto_app/futures/auth/widgets/widget.dart';
import 'package:crypto_app/repository/auth/abstract_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final resetPasswordController = TextEditingController();
  final _resetPasswordBloc =
      ResetPasswordBloc(GetIt.I<AbstractAuthRepository>());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => _resetPasswordBloc,
      child: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                const SliverAppBar(),
                SliverToBoxAdapter(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Center(
                        child: Text(
                          'Crypto App',
                          style: theme.textTheme.bodyLarge,
                        ),
                      )),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CustomTextField(
                            textEditingController: resetPasswordController,
                            textInputType: TextInputType.text,
                            obscureText: false,
                            hintText: 'Reset password'),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      )
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        _resetPasswordBloc.add(ForgotPasswordEvent(
                            emailForResetPassword:
                                resetPasswordController.text));
                        resetPasswordController.clear();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          'Reset Password',
                          style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
