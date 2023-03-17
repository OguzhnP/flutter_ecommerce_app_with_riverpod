import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:riverpod_eticaret/components/product_widget_item.dart';
import 'package:riverpod_eticaret/riverpod/product_riverpod.dart';
import 'package:riverpod_eticaret/riverpod/riverpod_management.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var read = ref.read(productRiverpod);
    var watch = ref.watch(productRiverpod);
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: Text(
              "Ürünler",
              style:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
            ),
          ),
          GrockList(
            scrollEffect: const NeverScrollableScrollPhysics(),
            padding: [0, 10].horizontalAndVerticalP,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductWidget(
                model: watch.products[index],
                setBaskets: () {
                  read.addBasket(
                    watch.products[index],
                  );
                },
                setFavorite: () {
                  read.setFavorite(
                    watch.products[index],
                  );
                },
              );
            },
            itemCount: read.products.length,
          ),
        ],
      ),
    );
  }
}
