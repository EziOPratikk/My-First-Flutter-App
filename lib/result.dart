import 'dart:ffi';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  // getter is mixture of property and method.
  String get resultPhrase {
    String resultText;
    if (resultScore == 30) {
      resultText = 'You have an awesome taste!';
    } else if (resultScore >= 25) {
      resultText = 'You have a good taste!';
    } else if (resultScore >= 15) {
      resultText = 'You have an interesting taste!';
    } else {
      resultText = 'You have a bad taste!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetHandler,
            child: Text(
              "Restart Quiz",
              style: TextStyle(fontSize: 20),
            ),
            style: ButtonStyle(
              // foreground color means text color inside button
              foregroundColor: MaterialStatePropertyAll(Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}
