import 'package:flutter/material.dart';

class Players {
  final String name;

  final String profilePic;
  final String position;
  final String age;
  final String cm;
  final String kg;
  final String joined;
  bool isMyFav;
  final String nationality;
  final String fifa24;

  Players(this.name, this.profilePic, this.position, this.age, this.cm, this.kg, this.joined, this.isMyFav, this.nationality, this.fifa24);

  factory Players.fromJson(Map<String, dynamic> json) {
    return new Players(
      json['name'], 
      json['profilePic'],
      json['position'],
      json['age'], 
      json['cm'], 
      json['kg'],
      json['joined'],
      json['isMyFav'],
      json['nationality'],
      json['fifa24']
    );
  }

Color get positionColor {
    switch (position) {
      case 'Forward':
              return Colors.blue.shade900;
      case 'Midfielder':
        return Colors.brown.shade900;
      case 'Defender':
        return Colors.red.shade900;
      case 'Goalkeeper':
        return Colors.green.shade900;
      default:
        return Colors.black87;
    }
  }
}

