import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:robbinlaw/controllers/appController.dart';
import 'package:robbinlaw/widgets/numbersCarousel.dart';
import 'package:robbinlaw/widgets/numbersList.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App 3'),
      ),
      body: Column(
        children: <Widget>[
          NumbersCarousel(
            color: Colors.blue,
          ),
          NumbersList(),
        ],
      ),
    );
  }
}
