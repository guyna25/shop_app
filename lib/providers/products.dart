import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';
import 'dart:convert';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  Future<void> fetchAndSetProducts() async {
    final url = Uri.https(
        'shop-app-146b2-default-rtdb.europe-west1.firebasedatabase.app',
        '/products.json');
    try {
      final response = await http.get(url);
      final extractData = json.decode(response.body) as Map<String, dynamic>;
      if (extractData == null) {
        return;
      }
      final List<Product> loadedProducts = [];
      extractData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          isFavorite: prodData['isFavorite'],
          imageUrl: prodData['imageUrl'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
=======
=======
>>>>>>> parent of cd0e298 (fixed edit bug and finished till 253)
=======
>>>>>>> parent of cd0e298 (fixed edit bug and finished till 253)
=======
>>>>>>> parent of cd0e298 (fixed edit bug and finished till 253)
  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }
>>>>>>> parent of cd0e298 (fixed edit bug and finished till 253)

=======

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

>>>>>>> parent of cd0e298 (fixed edit bug and finished till 253)
=======

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

>>>>>>> parent of cd0e298 (fixed edit bug and finished till 253)
=======

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

>>>>>>> parent of cd0e298 (fixed edit bug and finished till 253)
  void addProduct(Product product) {
    final url = Uri.https(
        'shop-app-146b2-default-rtdb.europe-west1.firebasedatabase.app/',
        '/products.json');
    http
        .post(
      url,
      body: json.encode({
        'title': product.title,
        'description': product.description,
        'imageUrl': product.imageUrl,
        'price': product.price,
        'isFavorite': product.isFavorite,
      }),
    )
        .then((response) {
      final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: DateTime.now().toString(),
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct);
      notifyListeners();
    });
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final _prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (_prodIndex >= 0) {
      final url = Uri.https(
          'shop-app-146b2-default-rtdb.europe-west1.firebasedatabase.app',
          '/products/$id.json');
      http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price,
          }));
      _items[_prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> deleteProduct(String id) async {
    final url = Uri.https(
        'shop-app-146b2-default-rtdb.europe-west1.firebasedatabase.app',
        '/products/$id.json');
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
    _items.removeAt(existingProductIndex);
    notifyListeners();
  }
}
