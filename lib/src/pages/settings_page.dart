import 'package:flutter/material.dart';
import 'package:user_preferences/src/shared_prefs/user_preferences.dart';

import 'package:user_preferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final prefs = UserPreferences();
  bool _secondaryColor;
  int _gender;
  String _name;

  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    prefs.lastPage = SettingsPage.routeName;
    _textController = new TextEditingController(text: prefs.name);
    _gender = prefs.gender;
    _secondaryColor = prefs.secondaryColor;
    _name = prefs.name;
  }

  _setSelectedRadio(int value) {
    setState(() {
      prefs.gender = value;
      _gender = value;
    });
  }

  _setSecondaryColor(bool value) {
    setState(() {
      prefs.secondaryColor = value;
      _secondaryColor = value;
    });
  }

  _setName(String value) {
    setState(() {
      prefs.name = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: (prefs.secondaryColor)
              ? Colors.teal[200]
              : Theme.of(context).primaryColor,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            SwitchListTile(
                value: _secondaryColor,
                title: Text('Color secundario'),
                onChanged: _setSecondaryColor),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _gender,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _gender,
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona usando el teléfono',
                ),
                onChanged: _setName,
              ),
            )
          ],
        ));
  }
}
