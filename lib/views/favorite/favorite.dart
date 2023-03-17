import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:riverpod_eticaret/components/product_widget_item.dart';
import 'package:riverpod_eticaret/riverpod/riverpod_management.dart';

class Favorite extends ConsumerWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var product = ref.watch(productRiverpod);
    return Scaffold(
      body: product.favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Favori Ürününüz Bulunmamaktadır"),
                  OutlinedButton(
                      onPressed: () {
                        ref.watch(bottomNavBarRiverpod).setCurrentIndex(0);
                      },
                      child: const Text("Ürünlere git"))
                ],
              ),
            )
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  child: Text(
                    "Favori Ürünler",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 16),
                  ),
                ),
                GrockList(
                  scrollEffect: const NeverScrollableScrollPhysics(),
                  padding: [0, 10].horizontalAndVerticalP,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ProductWidget(
                      model: product.favorites[index],
                      setBaskets: () {
                        product.addBasket(
                          product.favorites[index],
                        );
                      },
                      setFavorite: () =>
                          product.setFavorite(product.favorites[index]),
                    );
                  },
                  itemCount: product.favorites.length,
                ),
              ],
            ),
    );
  }
}
