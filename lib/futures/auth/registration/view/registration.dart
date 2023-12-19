import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/auth/registration/bloc/registration_bloc.dart';
import 'package:crypto_app/futures/auth/widgets/custom_button_auth.dart';
import 'package:crypto_app/repository/abstract_auth_repository.dart';
import 'package:crypto_app/router/router.dart';
import 'package:crypto_app/utils/ustil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../widgets/widget.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final Utils utils = Utils();
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _registrationBloc = RegistrationBloc(GetIt.I<AbstractAuthRepository>());
  bool obscurePassword = true;
  String? _errorMsg;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => _registrationBloc,
      child: BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(
                    'Crypto App',
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.05,
                    // child: Center(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text('Crypto App', style: theme.textTheme.bodyLarge)
                    //     ],
                    //   ),
                    // ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Form(
                        key: _formKey,
                        child: Column(children: [
                          CustomTextField(
                            textEditingController: usernameController,
                            textInputType: TextInputType.text,
                            obscureText: false,
                            hintText: 'Username',
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          CustomTextField(
                              textEditingController: emailController,
                              textInputType: TextInputType.emailAddress,
                              obscureText: false,
                              hintText: 'Email',
                              validator: (val) => utils.emailValidator(val!)
                              // if (val!.isEmpty) {
                              //   return 'Please fill in this field';
                              // } else if (!RegExp(
                              //         r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$')
                              //     .hasMatch(val)) {
                              //   return 'Please enter a valid email';
                              // }
                              // return null;

                              // },
                              ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          CustomTextField(
                            textEditingController: passwordController,
                            textInputType: TextInputType.text,
                            obscureText: true,
                            hintText: 'Password',
                            validator: (val) => utils.passwordValidator(val!),
                            // {
                            //   if (val!.isEmpty) {
                            //     return 'Please fill in this field';
                            //   } else if (!RegExp(
                            //           r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$')
                            //       .hasMatch(val)) {
                            //     return 'Please enter a valid password';
                            //   }
                            //   return null;
                            // },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          CustomTextField(
                            textEditingController: confirmPasswordController,
                            textInputType: TextInputType.emailAddress,
                            obscureText: true,
                            hintText: 'Confirm Password',
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        _registrationBloc.add(RegistrationBaseEvent(
                          confirmPassword: confirmPasswordController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          username: usernameController.text,
                        ));
                        AutoRouter.of(context).push(const HomeRoute());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          'Registration',
                          style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButtonAuth(
                          image: 'assets/svg/google.svg',
                          function: () {},
                        ),
                        CustomButtonAuth(
                          image: 'assets/svg/apple.svg',
                          function: () {},
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Do you have an account?'),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                AutoRouter.of(context).push(const LoginRoute());
                              },
                              child: Text(
                                'Login',
                                style: theme.textTheme.bodySmall?.copyWith(
                                    color: Colors.blue[700],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ]),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
