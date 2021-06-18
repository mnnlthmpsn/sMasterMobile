import 'package:flutter/material.dart';

class Settings extends StatefulWidget {

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: ListView(
            children:
            ListTile.divideTiles(
                context: context,
                tiles: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: ListTile(
                      title: Text('FAQ'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: ListTile(
                      title: Text('About Us'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                ]
            ).toList()));
  }
}
