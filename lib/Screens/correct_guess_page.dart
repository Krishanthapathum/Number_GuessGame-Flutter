import 'package:flutter/material.dart';

import 'home_page.dart';

class CorrectGuessPage extends StatefulWidget {
  const CorrectGuessPage({super.key, required this.guessedNumber});

  @override
  State<CorrectGuessPage> createState() => _CorrectGuessPageState();
  final int guessedNumber;
}

class _CorrectGuessPageState extends State<CorrectGuessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(200, 230, 201, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Guess Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text('Yes! You guessed it right. My secret number is'),
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
              child: const Text('Start the Game Again'),
            ),
          ],
        ),
      ),
    );
  }
}
