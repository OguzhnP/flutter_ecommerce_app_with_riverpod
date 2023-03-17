import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_eticaret/components/bottom_nav_bar.dart';
import 'package:riverpod_eticaret/riverpod/bottom_nav_bar_riverpod.dart';
import 'package:riverpod_eticaret/riverpod/product_riverpod.dart';

final bottomNavBarRiverpod =
    ChangeNotifierProvider((_) => BotomNavBarRiverpod());

final productRiverpod = ChangeNotifierProvider((_) => ProductRiverpod());
