import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../constants.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(.3),
        highlightColor: Colors.white,
        child:  SizedBox(
          height: 84,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => SizedBox(
              width: 70,
              child: Container(color: Colors.green,

              ),
            ),
            separatorBuilder: (context, index) =>
            const SizedBox(width: defaultPadding),
          ),
        )
    );
  }
}
