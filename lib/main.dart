import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Roll the Dice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  // Výchozia hodnota kocky pri spustení
  int diceNumber = 1;

  // Funkcia pre vygenerovanie náhodného čísla (1-6) a aktualizáciu stavu
  void rollDice() {
    setState(() {
      // Random().nextInt(6) vráti číslo od 0 do 5, preto pripočítame 1
      diceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roll the Dice'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,  
          children: [
            // Zobrazenie obrázka podľa aktuálnej hodnoty diceNumber
            Image.asset(
              'assets/images/dice-$diceNumber.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 40),
            // Tlačidlo na hod kockou
            ElevatedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Hodiť kockou'),
            ),
          ],
        ),
      ),
    );
  }
}