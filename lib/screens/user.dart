import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_shop/providers/dark_theme_provider.dart';
import 'package:grocery_shop/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  text: 'Hi,   ',
                  style: const TextStyle(
                    color: Colors.cyan,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'MyName',
                        style: TextStyle(
                          color: color,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("My Name is onPressed");
                          }),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextWidget(
                text: 'Email@example.com',
                color: color,
                textSize: 18,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              _listTiles(
                title: 'Adress 2',
                icon: (IconlyLight.profile),
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Update"),
                          content: TextField(
                            onChanged: (value) {
                              //_addresTextController
                            },
                            controller: _addressTextController,
                            maxLines: 5,
                            decoration: const InputDecoration(
                              hintText: "Your Adress",
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {},
                              child: const Text('Update'),
                            ),
                          ],
                        );
                      });
                },
                color: color,
              ),
              _listTiles(
                title: "Orders",
                icon: (IconlyBold.bag),
                onPressed: () {},
                color: color,
              ),
              _listTiles(
                  title: "WishList",
                  icon: (IconlyLight.heart),
                  onPressed: () {},
                  color: color),
              _listTiles(
                title: "Viewed",
                icon: (IconlyLight.show),
                onPressed: () {},
                color: color,
              ),
              _listTiles(
                title: "Forget Password",
                icon: (IconlyLight.unlock),
                onPressed: () {},
                color: color,
              ),
              SwitchListTile(
                title: TextWidget(
                  text: themeState.getDarkTheme ? 'Dark Theme' : 'Light mode',
                  color: color,
                  textSize: 18,
                ),
                secondary: Icon(themeState.getDarkTheme
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined),
                onChanged: (bool value) {
                  setState(() {
                    themeState.setDarkTheme = value;
                  });
                },
                value: themeState.getDarkTheme,
              ),
              _listTiles(
                title: "Logout",
                icon: (IconlyLight.logout),
                onPressed: () {
                  _showLogoutDialog();
                },
                color: color,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/warning-sign.png',
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text("Sign Out")
              ],
            ),
            content: const Text('Do you want to sign out'),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                  text: "Cancel",
                  color: Colors.cyan,
                  textSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: TextWidget(
                  text: "Cancel",
                  color: Colors.red,
                  textSize: 18,
                ),
              ),
            ],
          );
        });
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 22,
      ),
      subtitle: TextWidget(
        text: subtitle == null ? "" : subtitle,
        color: color,
        textSize: 18,
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
