import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/providers/navigation_controller_provider.dart';
import 'package:wizarding_world_explorer/providers/theme_provider.dart';
import 'package:wizarding_world_explorer/services/shared_preferences_service.dart';

class SetupPage extends ConsumerStatefulWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends ConsumerState<SetupPage> {
  String userName = '';
  String userEmail = '';
  bool themePreferenceBool = false;
  ThemeMode preferredThemeMode = ThemeMode.system;

  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController userEmailTextEditingController =
      TextEditingController();

  bool isUserNameValid = true;
  bool isUserEmailValid = true;

  @override
  void initState() {
    super.initState();
    SharedPreferencesService.instance.init();
  }

  @override
  Widget build(BuildContext context) {
    final navigationController = ref.read(navigationControllerProvider);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text(
                  'Initial Setup',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Proxima-Nova',
                    fontSize: 28,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text('Username'),
            ),
            TextFormField(
              controller: userNameTextEditingController,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                errorText: isUserNameValid ? null : 'Username cannot be empty',
              ),
              onChanged: (value) {
                setState(() {
                  userName = value;
                  isUserNameValid = value.isNotEmpty;
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text('Email Address'),
            ),
            TextFormField(
              controller: userEmailTextEditingController,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                errorText: isUserEmailValid ? null : 'Email cannot be empty',
              ),
              onChanged: (value) {
                setState(() {
                  userEmail = value;
                  isUserEmailValid = value.isNotEmpty;
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text('Preferred Theme'),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Light Theme'),
                    Switch(
                      value: themePreferenceBool,
                      onChanged: (bool newValue) {
                        setState(() {
                          themePreferenceBool = newValue;
                          preferredThemeMode =
                              newValue ? ThemeMode.dark : ThemeMode.light;
                        });
                      },
                    ),
                    const Text('Dark Theme')
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async {
                    if (userName.isNotEmpty && userEmail.isNotEmpty) {
                      bool userDetailsSet = await SharedPreferencesService
                          .instance
                          .saveUserDetails(userName, userEmail);
                      bool themeModeSet = await SharedPreferencesService
                          .instance
                          .saveThemeMode(preferredThemeMode);

                      if (userDetailsSet && themeModeSet) {
                        await SharedPreferencesService.instance
                            .setSetupCompleted(true);

                        // Update the themeModeProvider with the new theme mode
                        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                        ref.read(themeModeProvider.notifier).state = preferredThemeMode;

                        // Use the NavigationController to navigate
                        if (mounted) {
                          // ignore: use_build_context_synchronously
                          navigationController.navigateToMainPage(context);
                        }
                      }
                    } else {
                      setState(() {
                        isUserNameValid = userName.isNotEmpty;
                        isUserEmailValid = userEmail.isNotEmpty;
                      });
                    }
                  },
                  child: const Text('Save'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
