import 'package:flutter/material.dart';

class Authenticator extends StatefulWidget {
  const Authenticator({Key? key, required this.onAuthenticated})
      : super(key: key);
  final ValueChanged<bool> onAuthenticated;

  @override
  _AuthenticatorState createState() =>
      _AuthenticatorState(onAuthenticated: onAuthenticated);
}

class _AuthenticatorState extends State<Authenticator> {
  _AuthenticatorState({required this.onAuthenticated});

  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();
  final ValueChanged<bool> onAuthenticated;

  void _onClick() {
    if (_user.text != "user" || _pass.text != "1234") {
      onAuthenticated(false);
    } else {
      onAuthenticated(true);
    }
  }

  @override
  void initState() {
    _user = TextEditingController();
    _pass = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _user,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: _pass,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: _onClick,
                child: const Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
