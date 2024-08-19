import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/feature/home/domain/entities/category_entity/category_entity.dart';

import '../../../../../../constants.dart';


class Categories extends StatelessWidget {
  final List<CategoryEntity> category;
  const Categories(
    this.category, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) => CategoryCard(
          image: category[index].categoryImage,
          title: category[index].categoryName,
          press: () {},
        ),
        separatorBuilder: (context, index) =>
            const SizedBox(width: defaultPadding),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.press,
  });

  final String image, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: defaultPadding / 2, horizontal: defaultPadding / 4),
        child: Column(
          children: [
            SizedBox(
                width: 45,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),

                  child: CachedNetworkImage(

                    fit: BoxFit.cover,
                    imageUrl: image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),),
            const SizedBox(height: defaultPadding / 2),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
