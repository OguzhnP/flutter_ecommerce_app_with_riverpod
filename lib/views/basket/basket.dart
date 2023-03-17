import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:riverpod_eticaret/components/product_widget_item.dart';
import 'package:riverpod_eticaret/riverpod/riverpod_management.dart';

class Basket extends ConsumerWidget {
  const Basket({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var product = ref.watch(productRiverpod);
    return Scaffold(
      body: product.basketProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sepetinizde Ürünün Bulunmamaktadır"),
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
                      model: product.basketProducts[index],
                      setBaskets: () {},
                      setFavorite: () =>
                          product.setFavorite(product.basketProducts[index]),
                    );
                  },
                  itemCount: product.basketProducts.length,
                ),
                Padding(
                  padding: 20.horizontalP,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Toplam tutar: ${product.totalPrice} tl",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      OutlinedButton(
                          onPressed: () {
                            product.clearBasket();
                          },
                          child: const Text("Sepeti Boşalt"))
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
