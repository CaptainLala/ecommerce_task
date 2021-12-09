import './category.dart';

class Store {
  final String id;
  final String name;
  final String image;
  final List<String> coverImages;
  final List<Category> categories;
  Store({
    required this.coverImages,
    required this.image,
    required this.id,
    required this.name,
    required this.categories,
  });
}
