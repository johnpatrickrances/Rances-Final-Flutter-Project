import 'package:flutter/material.dart';

Widget fiveRecentCards(String card) {
  return ClipRRect(
    child: Container(
        height: 160,
        width: 100,
        color: Colors.white,
        child: Image.asset(card, fit: BoxFit.cover)),
    borderRadius: BorderRadius.circular(10),
  );
}

Widget Buttons(String buttonLabel) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Container(
      child: Center(
        child: Text(
          buttonLabel,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
      color: Colors.white,
      height: 100,
      width: 150,
    ),
  );
}
