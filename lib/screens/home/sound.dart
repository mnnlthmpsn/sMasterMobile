import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class CurrentSound extends StatefulWidget {
  @override
  _CurrentSoundState createState() => _CurrentSoundState();
}

class _CurrentSoundState extends State<CurrentSound> {
  Stream<String> soundLevel = '0' as Stream<String>;
  late IO.Socket socket;

  @override
  void initState() {
    _connect();
    super.initState();
  }

  void _connect() {
    socket = IO.io('http://10.0.2.2:3001', <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket.connect();
    socket.onConnect((data) => print("Connected"));
    socket.emit('send_data');
    socket.on('receive_data', (data) {
      setState(() => soundLevel = data);
      socket.emit('send_data');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder(
              initialData: 0,
              stream: soundLevel,
              builder: (context, snapshot) {
                return Text(
                  snapshot.data.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 120,
                      color: Colors.black54),
                );
              }),
          Text(
            ' dB',
            style: TextStyle(fontSize: 20, color: Colors.black54),
          )
        ],
      ),
    );
  }
}
