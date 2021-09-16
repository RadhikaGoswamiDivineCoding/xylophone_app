import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(Xylophone());
}

class Xylophone extends StatefulWidget {
  const Xylophone({Key? key}) : super(key: key);

  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  void playSound(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  Expanded buildKey({
    required Color color,
    required int noteNumber,
    required String textName,
  }) {
    return Expanded(
      child: TextButton(
        style:
            TextButton.styleFrom(backgroundColor: color, primary: Colors.white),
        onPressed: () {
          playSound(noteNumber);
        },
        child: Text(
          '$textName',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.red, noteNumber: 1, textName: 'DO'),
              buildKey(color: Colors.orange, noteNumber: 2, textName: 'RE'),
              buildKey(color: Colors.yellow, noteNumber: 3, textName: 'MI'),
              buildKey(color: Colors.green, noteNumber: 4, textName: 'FA'),
              buildKey(color: Colors.teal, noteNumber: 5, textName: 'SOL'),
              buildKey(color: Colors.blue, noteNumber: 6, textName: 'LA'),
              buildKey(color: Colors.purple, noteNumber: 7, textName: 'TI'),
            ],
          ),
        ),
      ),
    );
  }
}
