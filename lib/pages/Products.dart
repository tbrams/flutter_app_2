import 'package:flutter/material.dart';

import '../product_manager.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyList'),
      ),
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          AppBar(title: Text("Choose"),
          automaticallyImplyLeading: false,),
          ListTile(
            title: Text("Manage Products"),
            onTap: () {},
          )
        ],
      )),
      body: ProductManager(),
    );
  }
}
