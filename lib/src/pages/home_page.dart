import 'package:flutter/material.dart';
import 'package:user_preferences/src/shared_prefs/user_preferences.dart';

import 'package:user_preferences/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: (prefs.secondaryColor)
            ? Colors.teal[200]
            : Theme.of(context).primaryColor,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario ${prefs.secondaryColor}'),
          Divider(),
          Text('Género ${prefs.gender}'),
          Divider(),
          Text('Nombre de usuario ${prefs.name}'),
          Divider(),
        ],
      ),
    );
  }
}
