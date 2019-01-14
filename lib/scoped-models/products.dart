import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';


class ProductsModel extends Model {
    List<Product> _products = [];
    int _selectedProductIndex;

    List<Product> get products {
      return List.from(_products);  // Return a copy of the list, not the reference
    }

    int get selectedProductIndex {
      return _selectedProductIndex;
    }

    Product get selectedProduct {
      return _selectedProductIndex==null? null : _products[_selectedProductIndex];
    }

  void addProduct(Product product) {   
      _products.add(product);
      _selectedProductIndex=null;

    print(_products);
  }

  void updateProduct(Product product) { 
          _products[_selectedProductIndex] = product;
          _selectedProductIndex=null;

  }

  void deleteProduct() {   
      _products.removeAt(_selectedProductIndex);
      _selectedProductIndex=null;
  }

  void selectProduct(int index) {
    _selectedProductIndex=index;
      }
}