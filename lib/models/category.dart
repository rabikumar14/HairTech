
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategory {
  String categoryName;
  String categoryDescription;
  String categoryImage;
  String categoryDocumentId;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  ProductCategory({
    this.categoryName,
    this.categoryDescription,
    this.categoryImage,
    this.categoryDocumentId,
  });

  @override
  String toString() {
    return 'Category{categoryName: $categoryName, categoryDescription: $categoryDescription, categoryImage: $categoryImage, categoryDocumentId: $categoryDocumentId}';
  }

  factory ProductCategory.fromMap(Map<String, dynamic> map) {
    return new ProductCategory(
      categoryName: map['categoryName'] as String,
      categoryDescription: map['categoryDescription'] as String,
      categoryImage: map['categoryImage'] as String,
      categoryDocumentId: map['categoryDocumentId'] as String,
    );
  }

  factory ProductCategory.fromDocument(DocumentSnapshot document) {
    return new ProductCategory(
      categoryName: document.data()['categoryName'] as String,
      categoryDescription: document.data()['categoryDescription'] as String,
      categoryImage: document.data()['categoryImage'] as String,
      categoryDocumentId: document.id,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'categoryName': this.categoryName,
      'categoryDescription': this.categoryDescription,
      'categoryImage': this.categoryImage,
      'categoryDocumentId': this.categoryDocumentId,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}