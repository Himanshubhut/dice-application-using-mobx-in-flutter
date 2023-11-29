import 'package:dices_app/dice_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final diceCounter = DiceCounter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 204, 244, 255),
          title: const Text(
            "Dicesapp With Mobx",
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                        onPressed: diceCounter.roll,
                        child: Observer(
                            builder: (_) => Image.asset(
                                'assets/images/dice${diceCounter.left}.png'))),
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed: diceCounter.roll,
                        child: Observer(
                            builder: (_) => Image.asset(
                                'assets/images/dice${diceCounter.right}.png'))),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Observer(
                    builder: (_) => Text(
                          'Total ${diceCounter.total}',
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
