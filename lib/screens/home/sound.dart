import 'package:flutter/material.dart';

class CurrentSound extends StatefulWidget {
  @override
  _CurrentSoundState createState() => _CurrentSoundState();
}

class _CurrentSoundState extends State<CurrentSound> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '96',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 120,
                color: Colors.black54),
          ),
          Text(
            ' dB',
            style: TextStyle(fontSize: 20, color: Colors.black54),
          )
        ],
      ),
    );
  }
}
