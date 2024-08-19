import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../constants.dart';

class NewArrivalProductShimmer extends StatelessWidget {
  const NewArrivalProductShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(.3),
        highlightColor: Colors.white,
        child:         Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding + 10),
          child: SizedBox(
            height: 500,
            width: MediaQuery.sizeOf(context).width,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .75,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 15),
              scrollDirection: Axis.vertical,
              itemCount:10,
              itemBuilder: (context, index) {

                return Padding(
                  padding: const EdgeInsets.only(right: defaultPadding),
                  child:Container(
                    width: 154,

                    color: Colors.blueGrey,
                  ),
                );
              },
            ),
          ),
        ),

      ),
    );
  }
}
