import 'dart:developer';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop/feature/home/domain/entities/product_entity/product_entity.dart';

import '../../../../../constants.dart';
import '../../../../../models/Product.dart';
import '../../../../details/presentation/details_screen.dart';
import 'product_card.dart';
import 'section_title.dart';

class NewArrivalProducts extends StatefulWidget {
  final List<ProductEntity> product;
  NewArrivalProducts(
    this.product, {
    super.key,
  });

  @override
  State<NewArrivalProducts> createState() => _NewArrivalProductsState();
}

class _NewArrivalProductsState extends State<NewArrivalProducts> {
  @override
  Random random = Random();

  final ScrollController _scrollController = ScrollController();
  Color? color;
  @override
  void initState() {
    super.initState();

    // Add a listener to the scroll controller
    _scrollController.addListener(() {
      double maxScrollExtent = _scrollController.position.maxScrollExtent;
      double currentScrollPosition = _scrollController.position.pixels;

      // Calculate the scroll percentage
      double scrollPercentage = (currentScrollPosition / maxScrollExtent) * 100;

      // Check if the scroll has reached 70%


        if(scrollPercentage<=4||scrollPercentage>=96) {
          setState(() {

        });
        }


    });
  }

  @override
  void dispose() {
    // Dispose the controller when no longer needed
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding + 10),
          child: SizedBox(
            height: 500,
            width: MediaQuery.sizeOf(context).width,
            child: GridView.builder(
              controller: _scrollController,

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .9,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 15),
              scrollDirection: Axis.vertical,
              itemCount: widget.product.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: defaultPadding),
                  child: ProductCard(
                    title: widget.product[index].productTitle,
                    image: widget.product[index].productImage[0],
                    price: int.parse(widget.product[index].productPrice.toString()),
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
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Container(
              height: 40,
              width: 180,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: Center(
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
        ),
      ],
    );
  }
}
