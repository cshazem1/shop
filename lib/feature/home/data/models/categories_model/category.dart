import 'package:shop/feature/home/domain/entities/category_entity/category_entity.dart';

class Category extends CategoryEntity {
  Category({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  }) : super(categoryImage: image ?? '', categoryName: name ?? '');

  factory Category.fromJson(dynamic json) {
    return Category(
        id: json['id'],
        image: json['image'],
        updatedAt: json['updatedAt'],
        creationAt: json['creationAt'],
        name: json['name']);
  }
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['creationAt'] = creationAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
