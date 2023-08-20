import 'dart:math';

class CalculateBMI {
  CalculateBMI({required this.height, required this.weight});

  final int height;
  final int weight;

  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2); // Height in meters to the 2nd power
    return _bmi.toStringAsFixed(1); // 1 decimal place
  }

  String getResult() {
    if (_bmi < 18.5) {
      return 'Underweight';
    }
    else if(_bmi >= 18.5 && _bmi < 25) {
      return 'Normal';
    }
    else if(_bmi >= 25 && _bmi < 30) {
      return 'Overweight';
    }
    else if(_bmi >= 30 && _bmi < 35) {
      return 'Obese';
    }
    else if(_bmi >= 35 && _bmi < 40) {
      return 'Severely Obese';
    }
    else {
      return 'Morbidly Obese';
    }
  }

  String getAdvice(){
    if (_bmi < 18.5) {
      return 'You should eat more!';
    }
    else if(_bmi >= 18.5 && _bmi < 25) {
      return 'You are healthy!';
    }
    else if(_bmi >= 25 && _bmi < 30) {
      return 'You should eat less!';
    }
    else if(_bmi >= 30 && _bmi < 35) {
      return 'You should eat much less!';
    }
    else if(_bmi >= 35 && _bmi < 40) {
      return 'You should eat much much less!';
    }
    else {
      return 'You should eat much much much less!';
    }
  }
}