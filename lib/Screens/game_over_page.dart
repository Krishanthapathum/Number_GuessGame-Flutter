import 'package:flutter/material.dart';

import 'home_page.dart';

class GameOverPage extends StatefulWidget {
  const GameOverPage({required this.guessedNumber, Key? key}) : super(key: key);
  @override
  State<GameOverPage> createState() => _GameOverPageState();

  final int guessedNumber;
}

class _GameOverPageState extends State<GameOverPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(187, 222, 251, 1),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Guess Game'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text('Sorry! Game Over. My secret number is'),
              const SizedBox(height: 30),
              Text(
                widget.guessedNumber.toString(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
