import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/auth/widgets/custom_button_auth.dart';
import 'package:crypto_app/futures/auth/widgets/widget.dart';
import 'package:crypto_app/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(children: [
                  CustomTextField(
                    textEditingController: emailController,
                    textInputType: TextInputType.emailAddress,
                    obscureText: false,
                    hintText: 'Email',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  CustomTextField(
                    textEditingController: passwordController,
                    textInputType: TextInputType.emailAddress,
                    obscureText: true,
                    hintText: 'Password',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(const HomeRoute());
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Sign In',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
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
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('You don`t have account?'),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).push(const RegistrationRoute());
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
  }
}
