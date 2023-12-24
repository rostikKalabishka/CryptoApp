import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/settings/bloc/settings_bloc.dart';
import 'package:crypto_app/futures/settings/widgets/card_info.dart';
import 'package:crypto_app/repository/auth/abstract_auth_repository.dart';
import 'package:crypto_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool darkMode = true;
  final _settingsBloc = SettingsBloc(GetIt.I<AbstractAuthRepository>());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => _settingsBloc,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          // if (state is SettingsLoaded) {
          return Scaffold(
            body: CustomScrollView(slivers: [
              SliverAppBar(
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                ],
                title: Text(
                  'Settings',
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              const SliverToBoxAdapter(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://ichef.bbci.co.uk/news/976/cpsprodpb/16620/production/_91408619_55df76d5-2245-41c1-8031-07a4da3f313f.jpg'),
                  radius: 60,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Account',
                    style: theme.textTheme.labelMedium,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CardInfo(
                      info: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('User Name'),
                            Text('Tyler Durden'),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Email'),
                            Text('rostik310222222222@gmail.com'),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Balance'),
                            Text('\$500000'),
                          ],
                        ),
                      ),
                    ],
                  )),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Settings',
                    style: theme.textTheme.labelMedium,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: RefreshIndicator(
                  onRefresh: () async {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardInfo(
                        info: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Dark Mode'),
                            Transform.scale(
                              scale: 0.8,
                              child: Switch.adaptive(
                                  value: darkMode,
                                  //state.switchValue,
                                  onChanged: (bool value) {
                                    value
                                        ? _settingsBloc
                                            .add(SettingsSwitchOnEvent())
                                        : _settingsBloc
                                            .add(SettingsSwitchOffEvent());
                                  }),
                            )
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Notification')
                              ],
                            ),
                            Transform.scale(
                              scale: 0.8,
                              child: Switch.adaptive(
                                  value: darkMode,
                                  onChanged: (bool value) {
                                    darkMode = value;
                                    setState(() {});
                                  }),
                            )
                          ],
                        ),
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Language'),
                              Text('English'),
                            ],
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 120),
                  child: ElevatedButton(
                    child: Text(
                      'Sign Out',
                      style: theme.textTheme.bodySmall
                          ?.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    onPressed: () {
                      _settingsBloc.add(SettingsSignOutEvent());
                      AutoRouter.of(context).push(const LoginRoute());
                    },
                  ),
                ),
              )
            ]),
          );
          // }
          // // else if (state is SettingsFailure) {
          // return const Center(
          //   child: CircularProgressIndicator.adaptive(),
          // );
          // // }
        },
      ),
    );
  }
}
