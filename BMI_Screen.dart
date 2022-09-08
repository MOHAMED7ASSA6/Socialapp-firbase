import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  final int result;
  final bool isMale;
  final int Age;

  BMIResultScreen({
    this.result=0,
    this.Age=0,
    this.isMale=true,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0),
        child: Center(
          child: Column(
            children: [
              Text('Gender:${isMale ? 'Male' : 'Female'}'),
              Text('Result:$result'),
              Text('Age:${Age}'),
            ],
          ),
        ),
      ),
    );
  }
}