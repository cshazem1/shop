import 'package:flutter/material.dart';

import '../../../../../../constants.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
    required this.bgColor,
  }) : super(key: key);
  final String image, title;
  final VoidCallback press;
  final int price;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 154,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration:  BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
        child: Column(
          children: [
            Container(
              height: 132,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(
                  image,

                ),fit: BoxFit.fill),
                color: bgColor,
                borderRadius: const BorderRadius.all(
                    Radius.circular(defaultBorderRadius),),
              ),

            ),

            const SizedBox(height: defaultPadding / 2),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(color: Colors.black),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const SizedBox(width: defaultPadding / 4),
            Text(
              "\$" + price.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ],
        ),
      ),
    );
  }
}
