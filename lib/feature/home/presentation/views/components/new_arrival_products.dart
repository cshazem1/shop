import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/feature/home/domain/entities/product_entity/product_entity.dart';

import '../../../../../constants.dart';
import '../../../../../models/Product.dart';
import '../../../../details/presentation/details_screen.dart';
import 'product_card.dart';
import 'section_title.dart';

class NewArrivalProducts extends StatelessWidget {
  final List<ProductEntity> product;
  NewArrivalProducts(
    this.product, {
    super.key,
  });
  @override
  Random random = Random();
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding+10),
          child: SizedBox(
            height: 500,
            width: MediaQuery.sizeOf(context).width,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .9,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 15),
              scrollDirection: Axis.vertical,
              itemCount: product.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: defaultPadding),
                  child: ProductCard(
                    title: product[index].productTitle,
                    image: product[index].productImage[0],
                    price: int.parse(product[index].productPrice.toString()),
                    bgColor: Color.fromARGB(
                      200,
                      random.nextInt(256),
                      random.nextInt(256),
                      random.nextInt(256),
                    ),
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(product: demo_product[index]),
                          ));
                    },
                  ),
                );
              },
            ),
          ),
        ),
        Center(
          child: Container(
            height: 60,
            width: 170,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.99),borderRadius: BorderRadius.circular(26)),
            child:    Center(
              child: Text(
                "New Arrival",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
