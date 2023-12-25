import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/auth/login/bloc/login_bloc.dart';
import 'package:crypto_app/futures/auth/widgets/widget.dart';
import 'package:crypto_app/repository/auth/abstract_auth_repository.dart';
import 'package:crypto_app/router/router.dart';
import 'package:crypto_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginBloc = LoginBloc(GetIt.I<AbstractAuthRepository>());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final Utils utils = Utils();
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  final Utils customFieldValidator = Utils();
  String? _errorMsg;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => _loginBloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            _errorMsg = state.error.toString();
            utils.errorSnackBar(context, theme, _errorMsg);
            setState(() {});
          } else {
            _errorMsg = '';
            setState(() {});
          }
        },
        builder: (BuildContext context, LoginState state) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Crypto App', style: theme.textTheme.bodyLarge)
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(children: [
                          CustomTextField(
                            validator: (val) =>
                                customFieldValidator.emailValidator(val!),
                            textEditingController: emailController,
                            textInputType: TextInputType.emailAddress,
                            obscureText: false,
                            hintText: 'Email',
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          CustomTextField(
                            validator: (val) =>
                                customFieldValidator.passwordValidator(val!),
                            textEditingController: passwordController,
                            textInputType: TextInputType.emailAddress,
                            obscureText: obscurePassword,
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(obscurePassword == true
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined),
                              onPressed: () {
                                obscurePassword = !obscurePassword;
                                setState(() {});
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  AutoRouter.of(context)
                                      .push(const ResetPasswordRoute());
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                            ],
                          )
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
                        if (_formKey.currentState!.validate()) {
                          _loginBloc.add(LoginSignInEvent(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text,
                          ));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          'Sign In',
                          style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'OR',
                          style: theme.textTheme.labelMedium,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: CustomButtonAuth(
                      image: 'assets/svg/google.svg',
                      function: () {
                        _loginBloc
                            .add(LoginSignInWithGoogleEvent(context: context));
                      },
                      text: 'Sign in With Google',
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
                            const Text('You don`t have account?'),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                AutoRouter.of(context)
                                    .push(const RegistrationRoute());
                              },
                              child: Text(
                                'Register Now',
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
