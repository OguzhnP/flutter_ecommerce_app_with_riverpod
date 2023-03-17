import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:riverpod_eticaret/models/product_model.dart';

class ProductRiverpod extends ChangeNotifier {
  List<ProductModel> products = [];
  List<ProductModel> favorites = [];
  List<ProductModel> basketProducts = [];
  double totalPrice = 0;

  void setTotalPrice(ProductModel model) {
    totalPrice += model.price;
  }
  // void setFavorite(ProductModel model) {
  //   model.isFavorite = !model.isFavorite;
  //   notifyListeners();
  // }

  void setFavorite(ProductModel model) {
    if (model.isFavorite) {
      model.isFavorite = false;
      favorites.remove(model);
      notifyListeners();
    } else {
      model.isFavorite = true;
      favorites.add(model);
      notifyListeners();
    }
  }

  void addBasket(ProductModel model) {
    basketProducts.add(model);
    setTotalPrice(model);
    Grock.snackBar(
        title: "Başarılı.",
        description: "${model.title} eklendi",
        leading: const Icon(CupertinoIcons.checkmark_alt),
        position: SnackbarPosition.bottom);
  }

  void clearBasket() {
    basketProducts.removeRange(0, basketProducts.length);
    totalPrice = 0;
    notifyListeners();
  }

  void init() {
    for (var i = 0; i < 15; i++) {
      products.add(ProductModel(
        isFavorite: false,
        title: "Xiaomi ${i + 1}",
        description: "${8 + (i * 2)}  mp kameralı, 5500 mah batarya",
        price: 6000.0,
        imagePath: i.randomImage(),
      ));
    }
  }
}
