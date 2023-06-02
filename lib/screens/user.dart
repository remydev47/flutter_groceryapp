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
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(text: 'Hi   '),
              ),
              SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 20,
              ),
              _listTiles(
                title: 'Adress 2',
                icon: (IconlyLight.profile),
                onPressed: () {},
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
                title: Text('Themes'),
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
                onPressed: () {},
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
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
