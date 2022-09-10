import 'dart:math';

import 'package:bmi_bwa/height_provider.dart';
import 'package:bmi_bwa/weight_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weightProvider = Provider.of<WeightProvider>(context);
    var heightProvider = Provider.of<HeightProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Weight (kg) :',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              min: 1,
              max: 200,
              divisions: 200,
              label: weightProvider.weight.round().toString(),
              value: weightProvider.weight,
              onChanged: (newValue) {
                weightProvider.weight = newValue;
                newValue = newValue.roundToDouble();
                print('weight : $newValue');
              },
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Your Height (cm) :',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              min: 1,
              max: 200,
              divisions: 200,
              label: heightProvider.height.round().toString(),
              value: heightProvider.height,
              onChanged: (newValue) {
                heightProvider.height = newValue;
                newValue = newValue.roundToDouble();
                print('height = $newValue');
              },
              activeColor: Colors.pink,
              inactiveColor: Colors.pink.withOpacity(0.2),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Your BMI : \n ${(weightProvider.weight / (pow(heightProvider.height / 100, 2))).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
