import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //// TODO: Add text editing controllers (101)
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  //// TODO: Add Initially password is obsecure (101)
  bool _obsecureText = true;

  //// TODO: Add Toggles the password show status (101)
  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 80.0),
          Column(
            children: <Widget>[
              Image.asset('assets/diamond.png'),
              SizedBox(height: 16.0),
              Text('DIAMOND'),
            ],
          ),
          SizedBox(height: 120.0),
          //// TODO: Wrap Username with AccentColorOverride (103)

          //// TODO: Remove filled: true values (103)

          //// TODO: Wrap Password with AccentColorOverride (103)

          //// TODO: Add TextField widgets (101)
          //// [Name]
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Username',
            ),
          ),

          //// SPACER
          SizedBox(
            height: 12.0,
          ),

          //// [Password]
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
                suffixIcon: GestureDetector(
                  onTap: _toggle,
                  child: Icon(_obsecureText
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye),
                )),
            obscureText: _obsecureText,
          ),

          //// TODO: Add button bar (101)
          ButtonBar(
            //// TODO: Add a beveled rectangular border to CANCEL (103)
            children: <Widget>[
              //// TODO: Add buttons (101)
              TextButton(
                onPressed: () {
                  //// TODO: Clear the text fields (101)
                  _usernameController.clear();
                  _passwordController.clear();
                },
                child: Text('CANCEL'),
              ),
              //// TODO: Add an elevation to NEXT (103)
              //// TODO: Add a beveled rectangular border to NEXT (103)
              ElevatedButton(
                onPressed: () {
                  //// TODO: Show the next page (101)
                  Navigator.pop(context);
                },
                child: Text('NEXT'),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
