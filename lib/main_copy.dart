import "package:flutter/material.dart";
import "dart:async";

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  //build a button that when clicked, will start a round progress indicator that will take 10 seconds to complete
  //when the progress indicator is complete, it will display a snackbar that says "Process Complete"

  int _seconds = 10;
  int _secondsRemaining = 10;

  void _startTimer() {
    _secondsRemaining = _seconds;
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer 10 seconds"),
      ),
      //floating button that starts the countdown

      floatingActionButton: FloatingActionButton(
        onPressed: () => _startTimer(),
        child: Icon(Icons.timer),
      ),

      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              //display the countdown
              Text("$_secondsRemaining"),
              Padding(padding: EdgeInsets.all(32.0)), // fixed typo here
              //display the progress indicator
              CircularProgressIndicator(
                value: _secondsRemaining.toDouble() / _seconds.toDouble(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
