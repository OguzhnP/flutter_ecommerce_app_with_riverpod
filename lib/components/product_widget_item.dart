// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

import 'package:riverpod_eticaret/models/product_model.dart';
import 'package:riverpod_eticaret/riverpod/product_riverpod.dart';
import 'package:riverpod_eticaret/riverpod/riverpod_management.dart';

class ProductWidget extends ConsumerWidget {
  Function setFavorite;
  Function setBaskets;
  ProductModel model;
  ProductWidget({
    Key? key,
    required this.setFavorite,
    required this.setBaskets,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var read = ref.read(bottomNavBarRiverpod);
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: 10.allBR),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ClipRRect(
                    borderRadius: 10.allBR,
                    child: Image.network(
                      model.imagePath,
                    ),
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        model.description,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Center(
                        child: Text(
                          "${model.price} tl",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      read.currentIndex == 2
                          ? const SizedBox()
                          : GrockContainer(
                              onTap: () => setBaskets(),
                              padding: 3.verticalP,
                              decoration: BoxDecoration(
                                borderRadius: 10.allBR,
                                border: Border.all(color: Colors.blue),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(CupertinoIcons.bag_badge_plus),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "Ekle",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: GrockContainer(
              onTap: () {
                setFavorite();
              },
              padding: 3.allP,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  boxShadow: const [BoxShadow(color: Colors.white)]),
              child: Icon(
                model.isFavorite
                    ? CupertinoIcons.heart_fill
                    : CupertinoIcons.heart,
                color: model.isFavorite ? Colors.red : Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
