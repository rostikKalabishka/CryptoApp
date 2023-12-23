import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/auth/registration/bloc/registration_bloc.dart';
import 'package:crypto_app/repository/auth/abstract_auth_repository.dart';
import 'package:crypto_app/router/router.dart';
import 'package:crypto_app/utils/utils.dart';
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
  bool obscureConfirmPassword = true;
  String? _errorMsg;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => _registrationBloc,
      child: BlocConsumer<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          _errorMessage(state, context, theme);
        },
        builder: (BuildContext context, RegistrationState state) {
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
                            validator: (val) => utils.usernameValidator(val!),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          CustomTextField(
                              textEditingController: emailController,
                              textInputType: TextInputType.emailAddress,
                              obscureText: false,
                              hintText: 'Email',
                              validator: (val) => utils.emailValidator(val!)),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          CustomTextField(
                            textEditingController: passwordController,
                            textInputType: TextInputType.text,
                            onChange: (val) => utils.passwordValidator(val!),
                            obscureText: obscurePassword,
                            suffixIcon: IconButton(
                              icon: Icon(obscurePassword == true
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined),
                              onPressed: () {
                                obscurePassword = !obscurePassword;
                                setState(() {});
                              },
                            ),
                            hintText: 'Password',
                            validator: (val) => utils.passwordValidator(val!),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          CustomTextField(
                            validator: (val) => utils.confirmPasswordValidator(
                                val!, passwordController.text),
                            textEditingController: confirmPasswordController,
                            textInputType: TextInputType.emailAddress,
                            obscureText: obscureConfirmPassword,
                            hintText: 'Confirm Password',
                            suffixIcon: IconButton(
                              icon: Icon(obscureConfirmPassword == true
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined),
                              onPressed: () {
                                obscureConfirmPassword =
                                    !obscureConfirmPassword;
                                setState(() {});
                              },
                            ),
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
                        if (_formKey.currentState!.validate()) {
                          _registrationBloc.add(RegistrationBaseEvent(
                            confirmPassword: confirmPasswordController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            username: usernameController.text,
                            context: context,
                          ));
                        }
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
                        _registrationBloc
                            .add(RegistrationWithGoogleEvent(context: context));
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

  void _errorMessage(
      RegistrationState state, BuildContext context, ThemeData theme) {
    if (state is RegistrationFailure) {
      _errorMsg = state.error.toString();
      utils.errorSnackBar(context, theme, _errorMsg);
      setState(() {});
    } else {
      _errorMsg = '';
      setState(() {});
    }
  }
}
