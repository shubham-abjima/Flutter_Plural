import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(Colors.white70).make(),
        "Trending products"
            .text
            .xl
            .color(Color.fromARGB(255, 251, 83, 71))
            .make(),
      ],
    );
  }
}
