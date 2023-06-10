import "package:flutter/material.dart";
import "customWidgets/authenticator.dart";

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
  bool isAuthenticated = false;

  void _onAuthenticated(bool value) {
    setState(() {
      isAuthenticated = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Authentication")),
      body: Column(
        children: [
          Center(
            child: Authenticator(
              onAuthenticated: _onAuthenticated,
            ),
          ),
          Text("Authenticated: $isAuthenticated")
        ],
      ),
    );
  }
}
