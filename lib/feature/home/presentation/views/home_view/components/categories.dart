import 'package:flutter/material.dart';
import 'package:shop/feature/home/domain/entities/category_entity/category_entity.dart';
import '../../../../../../constants.dart';
import 'category_card.dart';

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

