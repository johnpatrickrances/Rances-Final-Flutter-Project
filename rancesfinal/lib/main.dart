// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rancesfinal/functions.dart';
import 'package:rancesfinal/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HiLowCardGame(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HiLowCardGame extends StatefulWidget {
  const HiLowCardGame({Key? key}) : super(key: key);

  @override
  State<HiLowCardGame> createState() => _HiLowCardGameState();
}

class _HiLowCardGameState extends State<HiLowCardGame> {
  void gameFunction() {
    if (ans == "Greater than or Equal") {
      if (eCards[guessCard]! >= eCards[listRecentCards[0]]!) {
        correctShow();
      } else {
        gameOverShow();
      }
    } else if (ans == "Less than") {
      if (eCards[guessCard]! < eCards[listRecentCards[0]]!) {
        correctShow();
      } else {
        gameOverShow();
      }
    }
  }

  void guessIsCorrect() {
    score++;
    ans = "";
    listRecentCards.insert(0, guessCard);
    guessNumberCard = Random().nextInt(52) + 1;
    guessCard = "assets/img/$guessNumberCard.png";
  }

  void gameReset() {
    score = 0;
    ans = "";
    initCard = Random().nextInt(52) + 1;
    listRecentCards = ["assets/img/$initCard.png", back, back, back, back];
  }

  void gameOverShow() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Game Over"),
              content: Text(
                textAlign: TextAlign.center,
                "You're Wrong!",
                style: TextStyle(fontSize: 25),
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pop(false);
                      gameReset();
                      isBack = true;
                    });
                  },
                  child: Text("Play Again", style: TextStyle(fontSize: 18)),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    SystemNavigator.pop();
                  },
                  child: Text(
                    "Quit",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ));
  }

  void correctShow() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Correct"),
              content: Text(
                textAlign: TextAlign.center,
                "You guess it right! ",
                style: TextStyle(fontSize: 20),
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      guessIsCorrect();
                      Navigator.of(context).pop(false);
                      isBack = true;
                    });
                  },
                  child: Text(
                    "Proceed",
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.green[500],
          body: Column(children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        fiveRecentCards(listRecentCards[1]),
                        fiveRecentCards(listRecentCards[2]),
                        fiveRecentCards(listRecentCards[3]),
                        fiveRecentCards(listRecentCards[4]),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isBack
                            ? fiveRecentCards(back)
                            : fiveRecentCards(guessCard),
                        SizedBox(width: 30),
                        fiveRecentCards(listRecentCards[0]),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () {
                              ans = "Greater than or Equal";
                              setState(() {
                                isBack = false;
                                gameFunction();
                              });
                            },
                            child: Buttons("Greater than or Equal")),
                        GestureDetector(
                            onTap: () {
                              ans = "Less than";
                              setState(() {
                                isBack = false;
                                gameFunction();
                              });
                            },
                            child: Buttons("Less than")),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green[900],
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Score: ",
                      style: TextStyle(fontSize: 40, color: Colors.white)),
                  Text("$score",
                      style: TextStyle(fontSize: 40, color: Colors.white)),
                ]),
              ),
            )
          ])),
    );
  }
}
