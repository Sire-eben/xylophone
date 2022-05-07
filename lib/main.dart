import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Flutter Xylophone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: SizedBox(
                width: screenSize.width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        buildKey(Colors.red, 1, 'Note 1'),
                        const SizedBox(
                          width: 25,
                        ),
                        buildKey(Colors.green, 2, 'Note 2'),
                      ],
                    ),
                    Row(
                      children: [
                        buildKey(Colors.orange, 3, 'Note 3'),
                        const SizedBox(
                          width: 25,
                        ),
                        buildKey(Colors.blueAccent, 4, 'Note 4'),
                      ],
                    ),
                    Row(
                      children: [
                        buildKey(Colors.purple, 5, 'Note 5'),
                        const SizedBox(
                          width: 25,
                        ),
                        buildKey(Colors.cyanAccent, 6, 'Note 6'),
                      ],
                    ),

                    Container(
                      height: 140,
                      width: screenSize.width,
                      child: buildKey(Colors.yellow, 7, 'Note 7'),
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildKey(Color color, int note, String text) {
    return Expanded(
        child: GestureDetector(
          onTap: () => playSound(note),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            height: 120,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 5,
                  color: Colors.grey.shade200,
                  offset: Offset(6, 4))
            ], color: color, borderRadius: BorderRadius.circular(22)),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
        ));
  }

  playSound(int noteNum) {
    final player = AudioCache();
    player.play('note$noteNum.wav');
  }

}
