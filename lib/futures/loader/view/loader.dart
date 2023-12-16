// import 'package:auto_route/auto_route.dart';
// import 'package:crypto_app/futures/auth/login/view/login.dart';
// import 'package:crypto_app/futures/home/view/home_screen.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// // example (no bloc)
// @RoutePage()
// class Loader extends StatefulWidget {
//   const Loader({
//     Key? key,
//     required this.firebaseAuth,
//   }) : super(key: key);
//   final FirebaseAuth firebaseAuth;

//   @override
//   State<Loader> createState() => _LoaderState();
// }

// class _LoaderState extends State<Loader> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: widget.firebaseAuth.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator.adaptive(),
//             );
//           } else if (snapshot.hasData) {
//             // AutoRouter.of(context).push(const HomeRoute());
//             return const HomeScreen();
//           } else {
//             // AutoRouter.of(context).push(const LoginRoute());
//             return const LoginScreen();
//           }
//         });
//   }
// }
