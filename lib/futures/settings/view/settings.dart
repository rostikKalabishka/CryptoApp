import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/settings/bloc/settings_bloc.dart';
import 'package:crypto_app/futures/settings/bloc/settings_state.dart';
import 'package:crypto_app/futures/settings/widgets/card_info.dart';
import 'package:crypto_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;
  @override
  void initState() {
    context.read<SettingsBloc>().add(SettingsLoadUserInfoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final settingsBloc = context.read<SettingsBloc>();
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                    onPressed: () async {
                      await openDialog(context);
                    },
                    icon: const Icon(Icons.edit))
              ],
              title: Text(
                'Settings',
                style: theme.textTheme.bodyLarge,
              ),
            ),
            SliverToBoxAdapter(
              child: state.image.isEmpty
                  ? CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 60,
                      child: Container(
                        child: Text(
                          state.name[0].toUpperCase(),
                          style:
                              theme.textTheme.bodyLarge?.copyWith(fontSize: 62),
                        ),
                      ),
                    )
                  : CircleAvatar(
                      radius: 60,
                      child: ClipOval(
                        child: Image.network(
                          state.image,
                          fit: BoxFit.cover,
                        ),
                      ),
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
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardInfo(
                    info: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('User Name:'),
                          Text(
                            state.name,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: theme.dividerColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Email:'),
                          Flexible(
                            child: Text(
                              state.email,
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: theme.dividerColor,
                    ),
                    const Padding(
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
                                value: state.switchValue,
                                onChanged: (bool value) {
                                  value
                                      ? settingsBloc
                                          .add(SettingsSwitchOnEvent())
                                      : settingsBloc
                                          .add(SettingsSwitchOffEvent());
                                }),
                          )
                        ],
                      ),
                      Divider(
                        color: theme.dividerColor,
                      ),
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
                                value: notifications,
                                onChanged: (bool value) {
                                  notifications = value;
                                  setState(() {});
                                }),
                          )
                        ],
                      ),
                      Divider(
                        color: theme.dividerColor,
                      ),
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
                    settingsBloc.add(SettingsSignOutEvent());
                    AutoRouter.of(context).pushAndPopUntil(const LoginRoute(),
                        predicate: (route) => false);
                  },
                ),
              ),
            )
          ]),
        );
      },
    );
  }

  Future openDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        return AlertDialog(
          backgroundColor: theme.dialogBackgroundColor,
          title: Text(
            'Make a username',
            style: theme.textTheme.bodyLarge,
          ),
          content: TextFormField(
              style: theme.textTheme.bodySmall,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: theme.hintColor),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))))),
        );
      });
}
