import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/core/widgets/CashNetworkImage.dart';
import 'package:shop/feature/home/domain/entities/product_entity/product_entity.dart';

import '../../../../../constants.dart';


class DetailsScreen extends StatefulWidget {
  DetailsScreen(
      {super.key, required this.productEntity,required this.backGroundColor});
final Color backGroundColor;
  final ProductEntity productEntity;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int indexImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backGroundColor,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(

            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: widget.backGroundColor,
              child: SvgPicture.asset(
                "assets/icons/Heart.svg",
                height: 20,
              ),
            ),
          ),
          SizedBox(
            child: IconButton(
              highlightColor: Colors.green,
              onPressed: () {
            
              },
              icon: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.shopping_cart,size: 25,)),
            ),
          )

        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 420,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CashNetworkImage(
                  image: widget.productEntity.productImage[indexImage]),
            ),
          ),
          const SizedBox(height: defaultPadding),
          SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      indexImage = 0;
                      setState(() {});
                    },
                    icon: CashNetworkImage(
                      image: widget.productEntity.productImage[0],
                    )),
                IconButton(
                    onPressed: () {
                      indexImage = 1;
                      setState(() {});
                    },
                    icon: CashNetworkImage(
                      image: widget.productEntity.productImage[1],
                    )),
                IconButton(
                    onPressed: () {
                      indexImage = 2;
                      setState(() {});
                    },
                    icon: CashNetworkImage(
                      image: widget.productEntity.productImage[2],
                    )),

              ],
            ),
          ),
                   const SizedBox(height: defaultPadding),

          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(defaultPadding,
                  defaultPadding * 2, defaultPadding, defaultPadding),
              decoration:  BoxDecoration(
                color: Colors.white.withOpacity(.4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius * 3),
                  topRight: Radius.circular(defaultBorderRadius * 3),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.productEntity.productTitle,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        Text(
                          "\$${widget.productEntity.productPrice}",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: Text(
                        widget.productEntity.productDescription,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),

                  ],
                ),
              ),
            ),

          ),
        ],
      ),
    );
  }
}

