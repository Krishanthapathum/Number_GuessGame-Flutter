import 'package:flutter/material.dart';

class WrongGuessPage extends StatefulWidget {
  const WrongGuessPage({super.key});

  @override
  State<WrongGuessPage> createState() => _WrongGuessPageState();
}

class _WrongGuessPageState extends State<WrongGuessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 205, 210, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Guess Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text('Sorry! wrong guess. Please try again...'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
