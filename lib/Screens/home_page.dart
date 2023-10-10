import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guessgame_flutter/Screens/correct_guess_page.dart';
import 'package:guessgame_flutter/Screens/game_over_page.dart';
import 'package:guessgame_flutter/Screens/wrong_guess_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  int _secretNumber = 0; // Initialize the secret number to 0
  int _guessesRemaining = 3;
  int _chancesTaken = 0; // Variable to keep track of chances taken

  void _generateSecreatnumber() {
    final random = Random();
    _secretNumber = random.nextInt(10) + 1;
    print(_secretNumber);
  }

  void _checkGuess() {
    int? guessedNumber = int.tryParse(_controller.text);
    if (guessedNumber != null) {
      if (guessedNumber == _secretNumber) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CorrectGuessPage(
              guessedNumber: _secretNumber,
            ),
          ),
        );
      } else {
        setState(() {
          _guessesRemaining--;
          _chancesTaken++; // Increment the chances taken
        });
        if (_guessesRemaining == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameOverPage(
                guessedNumber: _secretNumber,
              ),
            ),
          );

          print(_secretNumber);
        } else {
          _controller.clear();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WrongGuessPage(),
            ),
          );
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _generateSecreatnumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guess Game')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/guess.png',
                  width: 200, fit: BoxFit.cover),
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: Text(
                    'I have secret number in my mind(1-10).You have $_guessesRemaining chances to guess it. Can you guess it?',
                    textAlign: TextAlign.center),
              ),
              const SizedBox(height: 30),
              Text('$_chancesTaken of 3 chances are taken'),
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your guess',
                  ),
                  maxLength: 2,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: _checkGuess,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
