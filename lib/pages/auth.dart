import 'package:flutter/material.dart';

import './products.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

  _createDecorationImage() {
    return DecorationImage(
      image: AssetImage('assets/background.jpg'),
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(.5), BlendMode.dstATop),
    );
  }

  Widget _createEmailTextfield() {
    return TextField(
        decoration: InputDecoration(
            labelText: 'E-mail', filled: true, fillColor: Colors.white),
        keyboardType: TextInputType.emailAddress,
        onChanged: (String value) {
          setState(() {
            _emailValue = value;
          });
        });
  }

  Widget _createPasswordTextField() {
    return TextField(
        decoration: InputDecoration(
            labelText: 'Password', filled: true, fillColor: Colors.white),
        obscureText: true,
        onChanged: (String value) {
          setState(() {
            _passwordValue = value;
          });
        });
  }

  Widget _createAcceptSwitch() {
    return SwitchListTile(
        value: _acceptTerms,
        onChanged: (bool value) {
          setState(() {
            _acceptTerms = value;
          });
        },
        title: Text('Accept Terms'));
  }

  void _submitForm() {
    print(_emailValue);
    print(_passwordValue);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: _createDecorationImage(),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _createEmailTextfield(),
                SizedBox(
                  height: 10.0,
                ),
                _createPasswordTextField(),
                _createAcceptSwitch(),
                SizedBox(height: 10.0),
                RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text('LOGIN'),
                    onPressed: _submitForm),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
