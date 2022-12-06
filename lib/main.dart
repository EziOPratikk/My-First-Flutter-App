import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // _ symbol is for private access modifiers.
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // Objects in JavaScripts are known as Maps in Dart as done below
  // Map syntax is like this {String Keys: Object Values}
  // and Arrays are called as Lists.
  // const is during compile time constant and final is during runtime
  // const also can be applied to values as shown below
  // For example: var num = const [];
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 10},
        {'text': 'Green', 'score': 8},
        {'text': 'White', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 5},
        {'text': 'Tiger', 'score': 3},
        {'text': 'Lion', 'score': 3},
      ],
    },
    {
      'questionText': 'Who\'s your favourite singer?',
      'answers': [
        {'text': 'Sonu Nigam', 'score': 10},
        {'text': 'KK', 'score': 10},
        {'text': 'Armaan Malik', 'score': 7},
        {'text': 'Arijit Singh', 'score': 7},
      ],
    }
  ];

  void _answerQuestion(int score) {
    // setState tells flutter to run this part.
    // () {} or () => {} are known as annonymous functions.
    setState(() {
      _questionIndex = _questionIndex + 1;
      _totalScore = _totalScore + score;
    });
    // print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        // Ternary Expressions: (condition ? Expression 1 : Expression 2)
        // which is alternative to If else statements.
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
