import 'package:shop/feature/home/domain/entities/product_entity/product_entity.dart';

import '../categories_model/category.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  }) : super(
            productTitle: title ?? "",
            productPrice: price ?? 0,
            productDescription: description ?? '',
            productImage: images ?? []);

  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
      price: json['price'],
      title: json['title'],
      id: json['id'],
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      creationAt: json['creationAt'],
      description: json['description'] ,
      images: json['images'] != null ? json['images'].cast<String>() : [],
      updatedAt: json['updatedAt'],
    );
  }
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  Category? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = productTitle;
    map['price'] = productPrice;
    map['description'] = productDescription;
    map['images'] = images;
    map['creationAt'] = creationAt;
    map['updatedAt'] = updatedAt;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    return map;
  }
}
