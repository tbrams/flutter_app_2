import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  @override
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue;

  Widget _buildTitleTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Title'),
      onChanged: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextfield() {
    return TextField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Product Description'),
      onChanged: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildPriceTextfield() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Product Price'),
      onChanged: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _priceValue,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double maxWidth = deviceWidth > 650.0? 500.0 : deviceWidth*.95;
    final double maxPadding = deviceWidth-maxWidth;

    return Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          padding:EdgeInsets.symmetric(horizontal:maxPadding/2),
          children: <Widget>[
          _buildTitleTextfield(),
          _buildDescriptionTextfield(),
          _buildPriceTextfield(),
          SizedBox(height: 10.0),
          RaisedButton(
            child: Text('Save'),
            textColor: Colors.white,
            onPressed: _submitForm,
          )
        ]));
  }
}
