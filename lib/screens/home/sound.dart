import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class CurrentSound extends StatefulWidget {
  @override
  _CurrentSoundState createState() => _CurrentSoundState();
}

class _CurrentSoundState extends State<CurrentSound> {
  String soundLevel = '0';
  late IO.Socket socket;

  @override
  void initState() {
    _connect();
    super.initState();
  }

  void _connect() {
    socket = IO.io('http://192.168.8.103:3001', <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket.connect();
    socket.onConnect((data) => print("Connected"));
    socket.on('receive_data', (data) {
      setState(() => soundLevel = data.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    socket.emit('send_data');
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            soundLevel,
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
