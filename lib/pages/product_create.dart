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
  final Map<String, dynamic> _formData = {
    'title':null,
    'description':null,
    'price':null,
     'image': 'assets/food.jpg'
  }; 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget _buildTitleTextfield() {
    return TextFormField(
      validator: (String value) {
        // return null if no problems, otherwise error message string
        if (value.isEmpty || value.length < 5) {
          return 'Title is required and should be 5+ characters long';
        }
      },
      onSaved: (String value) {
          _formData['title'] = value;
      },
      decoration: InputDecoration(labelText: 'Product Title'),
    );
  }

  Widget _buildDescriptionTextfield() {
    return TextFormField(
      validator: (String value) {
        // return null if no problems, otherwise error message string
        if (value.isEmpty || value.length < 10) {
          return 'Description is required and should be 10+ characters long';
        }
      },
      onSaved: (String value) {
          _formData['description'] = value;
      },
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Product Description'),
    );
  }

  Widget _buildPriceTextfield() {
    return TextFormField(
      validator: (String value) {
        // return null if no problems, otherwise error message string
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Price is required and should be a valid number';
        }
      },
      onSaved: (String value) {
          _formData['price'] = double.parse(value);
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Product Price'),
    );
  }

  void _submitForm() {
    _formKey.currentState.save(); // Will trigger onSaved() in FormTextFields
    if (!_formKey.currentState.validate()) return;

    widget.addProduct(_formData);
    Navigator.pushReplacementNamed(context, '/products');
  }

  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double maxWidth = deviceWidth > 650.0 ? 500.0 : deviceWidth * .95;
    final double maxPadding = deviceWidth - maxWidth;

    return GestureDetector(
      onTap: (){
        // Removing focus from something is the same as passing an
        // empty focusnode 
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: maxPadding / 2),
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
            ],
          ),
        ),
      ),
    );
  }
}
