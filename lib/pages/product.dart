import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double _price;
  final String _description;

  ProductPage(this.title, this.imageUrl, this._price, this._description);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Union Square, San Fransisco',
                    style: TextStyle(fontFamily: 'Oswald', color: Colors.grey)),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text('|', style: TextStyle(color: Colors.grey))),
                Text('\$' + _price.toString(),
                    style: TextStyle(fontFamily: 'Oswald', color: Colors.grey)),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                _description,
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}
