import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/futures/settings/bloc/settings_bloc.dart';
import 'package:crypto_app/futures/settings/bloc/settings_state.dart';
import 'package:crypto_app/futures/settings/widgets/card_info.dart';
import 'package:crypto_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;
  final TextEditingController updateUserNameController =
      TextEditingController();

  late TextEditingController emailController;
  late String image;
  @override
  void initState() {
    context.read<SettingsBloc>().add(SettingsLoadUserInfoEvent());
    emailController =
        TextEditingController(text: context.read<SettingsBloc>().state.email);
    super.initState();
  }

  @override
  void dispose() {
    updateUserNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final settingsBloc = context.read<SettingsBloc>();

    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        emailController = TextEditingController(text: state.email);
        image = state.image;
      },
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                    onPressed: () async {
                      await openDialog(context, state);
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
                      child: Text(
                        state.charForAvatar,
                        style: theme.textTheme.bodyLarge
                            ?.copyWith(fontSize: 62, color: Colors.white),
                      ),
                    )
                  : CircleAvatar(
                      radius: 60,
                      child: ClipOval(
                        child: Image.network(
                          state.image,
                          fit: BoxFit.fill,
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
                          Text(
                            'User Name:',
                            style: theme.textTheme.displaySmall,
                          ),
                          Text(
                            state.name,
                            style: theme.textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email:',
                            style: theme.textTheme.displaySmall,
                          ),
                          Flexible(
                            child: Text(
                              state.email,
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: theme.textTheme.displaySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Balance',
                            style: theme.textTheme.displaySmall,
                          ),
                          Text(
                            '\$500000',
                            style: theme.textTheme.displaySmall,
                          ),
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
                          Text(
                            'Dark Mode',
                            style: theme.textTheme.displaySmall,
                          ),
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
                      const Divider(
                        color: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Notification',
                                style: theme.textTheme.displaySmall,
                              )
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
                      const Divider(
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Language',
                              style: theme.textTheme.displaySmall,
                            ),
                            Text(
                              'English',
                              style: theme.textTheme.displaySmall,
                            ),
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
                    style: theme.textTheme.labelMedium,
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

  Future openDialog(BuildContext context, SettingsState state) => showDialog(
        context: context,
        builder: (context) {
          final theme = Theme.of(context);
          final image = context.read<SettingsBloc>().state.image;
          XFile? selectedImage =
              context.read<SettingsBloc>().state.selectedImage;
          return BlocListener<SettingsBloc, SettingsState>(
            listener: (context, state) {
              selectedImage = state.selectedImage;
            },
            child: AlertDialog(
              backgroundColor: theme.scaffoldBackgroundColor,
              title: Text(
                'Make a change',
                style: theme.textTheme.bodyLarge,
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[700]),
                      onPressed: () {
                        AutoRouter.of(context).pop();
                        updateUserNameController.clear();
                        context
                            .read<SettingsBloc>()
                            .add(SettingsCloseDialogEvent());
                      },
                      child: Text(
                        'Close',
                        style:
                            theme.textTheme.labelMedium?.copyWith(fontSize: 14),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<SettingsBloc>().add(
                              SettingsUpdateUserInfo(
                                  profileImage: selectedImage != null
                                      ? selectedImage!.path
                                      : '',
                                  username: updateUserNameController.text));
                          updateUserNameController.clear();
                          AutoRouter.of(context).pop();
                        },
                        child: Text(
                          'Save change',
                          style: theme.textTheme.labelMedium
                              ?.copyWith(fontSize: 14),
                        ))
                  ],
                )
              ],
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      radius: 60,
                      onTap: () {
                        context.read<SettingsBloc>().add(SettingsPickImage());
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 60,
                        child: (selectedImage != null &&
                                selectedImage.path.isNotEmpty)
                            ? ClipOval(
                                child: Image.file(
                                  File(selectedImage.path),
                                  fit: BoxFit.fill,
                                ),
                              )
                            : (image.isNotEmpty)
                                ? ClipOval(
                                    child: Image.network(
                                      image,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : Text(
                                    state.charForAvatar,
                                    style: theme.textTheme.bodyLarge
                                        ?.copyWith(fontSize: 62),
                                  ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      'Username',
                      style: theme.textTheme.labelMedium,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextFormField(
                      controller: updateUserNameController,
                      style: theme.textTheme.bodySmall,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: theme.hintColor),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      'Email',
                      style: theme.textTheme.labelMedium,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextFormField(
                      enabled: false,
                      controller: emailController,
                      style: theme.textTheme.bodySmall,
                      decoration: InputDecoration(
                        disabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        hintStyle: TextStyle(color: theme.hintColor),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
