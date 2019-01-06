import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products) {
    print('[Products Widget] Constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(
              products[index]['title'],
              style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Oswald'),
            ),
            SizedBox(
              width: 8.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(6.0)),
              child: Text('\$${products[index]['price'].toString()}',
                  style: TextStyle(color: Colors.white)),
            ),
          ]),
          DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                  child: Text('Union Square, San Fransisco'))),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color:Theme.of(context).accentColor,
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/' + index.toString()),
              ),             IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () { 
                },
              )

            ],
          )
        ],
      ), 
    );
  }

  Widget _buildProductList() {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productCards = Container();
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return _buildProductList();
  }
}
