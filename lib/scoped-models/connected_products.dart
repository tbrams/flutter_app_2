import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;


import '../models/product.dart';
import '../models/user.dart';

mixin ConnectedProductsModel on Model {
  List<Product> _products = [];
  User _authenticatedUser;
  int _selProductIndex;

  void addProduct(String t, String d, String i, double p) {
    final String url='https://flutter-app-117.firebaseio.com/products.json';
    final Map<String, dynamic> productData = {
      'id' : i,
      'title' : t,
      'description' : d,
      'image' : 'https://upload.wikimedia.org/wikipedia/commons/7/70/Chocolate_%28blue_background%29.jpg',
      'price' : p
    };
    
    http.post(url, body:json.encode(productData));

    final Product newProduct = Product(
        title: t,
        description: d,
        image: i,
        price: p,
        userEmail: _authenticatedUser.email,
        userId: _authenticatedUser.id);
    _products.add(newProduct);
    notifyListeners();
  }
}

mixin ProductsModel on ConnectedProductsModel {
  bool _showFavorites = false;

  List<Product> get allProducts {
    return List.from(_products); // Return a copy of the list, not the reference
  }

  List<Product> get displayedProducts {
    if (_showFavorites) {
      return _products.where((Product p) => p.isFavorite).toList();
    }
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selProductIndex;
  }

  Product get selectedProduct {
    return _selProductIndex == null ? null : _products[_selProductIndex];
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  void updateProduct(String t, String d, String i, double p) {
    final Product updatedProduct = Product(
        title: t,
        description: d,
        image: i,
        price: p,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId);
    _products[_selProductIndex] = updatedProduct;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(_selProductIndex);
    notifyListeners();
  }

  void selectProduct(int productId) {
    _selProductIndex = productId;
    if (productId != null) {
      notifyListeners();
    }
  }

  void toggleFavoriteStatus() {
    final bool newStatus = !_products[_selProductIndex].isFavorite;
    final Product newUpdatedProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId,
        isFavorite: newStatus);
    _products[_selProductIndex] = newUpdatedProduct;
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}

mixin UserModel on ConnectedProductsModel {
  void login(String email, String password) {
    _authenticatedUser =
        User(id: 'hardcodedfornow', email: email, password: password);
  }
}
