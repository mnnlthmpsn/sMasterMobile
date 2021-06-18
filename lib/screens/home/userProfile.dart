import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: ListView(
            children: ListTile.divideTiles(context: context, tiles: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: ListTile(
              title: Text('User Details'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: ListTile(
              title: Text('Change Password'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: ListTile(
              title: Text('Logout'),
            ),
          )
        ]).toList()));
  }
}
