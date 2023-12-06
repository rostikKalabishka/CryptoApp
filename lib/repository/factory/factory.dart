// import 'package:crypto_app/futures/crypto_coin_list/crypto_coin_list_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';

// import '../../futures/crypto_coin_details/crypto_coin_details.dart';
// import '../../futures/crypto_coin_list/bloc/crypto_coin_list_bloc.dart';
// import '../abstract_coin_repository.dart';
// import '../crypto_coin/models/model.dart';

// class ScreenFactory {
//   final _cryptoCoinListBloc =
//       CryptoCoinListBloc(GetIt.I<AbstractCoinRepository>());
//   late CryptoCoin coin;
//   Widget makeCryptoCoinList() {
//     return BlocProvider(
//       create: (_) => _cryptoCoinListBloc,
//       child: const CryptoCoinListScreen(),
//     );
//   }

//   Widget makeCryptoCoinDetails() {
//     return BlocProvider(
//       create: (_) => _cryptoCoinListBloc,
//       child: const CryptoCoinDetailsScreen(
//         coin: coin,
//       ),
//     );
//   }
// }
