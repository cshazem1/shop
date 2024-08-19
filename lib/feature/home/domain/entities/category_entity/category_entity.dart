

import 'package:hive/hive.dart';

part 'category_entity.g.dart';

@HiveType(typeId: 0)
class CategoryEntity{
  @HiveField(1)
final String categoryName;
  @HiveField(2)
  final String categoryImage;

const CategoryEntity({required this.categoryImage,
required  this.categoryName});


}