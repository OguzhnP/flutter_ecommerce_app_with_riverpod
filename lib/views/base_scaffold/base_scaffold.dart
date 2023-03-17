import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_eticaret/components/bottom_nav_bar.dart';
import 'package:riverpod_eticaret/riverpod/bottom_nav_bar_riverpod.dart';
import 'package:riverpod_eticaret/riverpod/riverpod_management.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  const BaseScaffold({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold> {
  @override
  void initState() {
    super.initState();
    ref.read(productRiverpod).init();
  }

  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(bottomNavBarRiverpod);

    return Scaffold(
      appBar: appbarBuild(watch),
      bottomNavigationBar: const BottomNavBar(),
      body: watch.body(),
    );
  }

  CupertinoNavigationBar appbarBuild(BotomNavBarRiverpod watch) {
    return CupertinoNavigationBar(
      middle: Text(watch.appbarTitle()),
    );
  }
}
