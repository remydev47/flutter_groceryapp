import 'package:flutter/material.dart';
import 'package:grocery_shop/widgets/categories_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CategoriesWidget(),
      ),
    );
  }
}
