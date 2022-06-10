import 'dart:math';

int initCard = Random().nextInt(52) + 1;
String back = "assets/img/back.png";
List listRecentCards = ["assets/img/$initCard.png", back, back, back, back];
int score = 0;
String ans = "";
int guessNumberCard = Random().nextInt(52) + 1;
String guessCard = "assets/img/$guessNumberCard.png";
bool isBack = true;
var eCards = {
  "assets/img/1.png": 1,
  "assets/img/2.png": 1,
  "assets/img/3.png": 1,
  "assets/img/4.png": 1,
  "assets/img/5.png": 2,
  "assets/img/6.png": 2,
  "assets/img/7.png": 2,
  "assets/img/8.png": 2,
  "assets/img/9.png": 3,
  "assets/img/10.png": 3,
  "assets/img/11.png": 3,
  "assets/img/12.png": 3,
  "assets/img/13.png": 4,
  "assets/img/14.png": 4,
  "assets/img/15.png": 4,
  "assets/img/16.png": 4,
  "assets/img/17.png": 5,
  "assets/img/18.png": 5,
  "assets/img/19.png": 5,
  "assets/img/20.png": 5,
  "assets/img/21.png": 6,
  "assets/img/22.png": 6,
  "assets/img/23.png": 6,
  "assets/img/24.png": 6,
  "assets/img/25.png": 7,
  "assets/img/26.png": 7,
  "assets/img/27.png": 7,
  "assets/img/28.png": 7,
  "assets/img/29.png": 8,
  "assets/img/30.png": 8,
  "assets/img/31.png": 8,
  "assets/img/32.png": 8,
  "assets/img/33.png": 9,
  "assets/img/34.png": 9,
  "assets/img/35.png": 9,
  "assets/img/36.png": 9,
  "assets/img/37.png": 10,
  "assets/img/38.png": 10,
  "assets/img/39.png": 10,
  "assets/img/40.png": 10,
  "assets/img/41.png": 11,
  "assets/img/42.png": 11,
  "assets/img/43.png": 11,
  "assets/img/44.png": 11,
  "assets/img/49.png": 12,
  "assets/img/50.png": 12,
  "assets/img/51.png": 12,
  "assets/img/52.png": 12,
  "assets/img/45.png": 13,
  "assets/img/46.png": 13,
  "assets/img/47.png": 13,
  "assets/img/48.png": 13,
};
