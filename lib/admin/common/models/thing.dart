class Thing {
  Thing({
    this.name,
    this.stock,
    this.isHidden,
    this.categories,
    this.imageUrls,
    this.itemIds,
  });

  String? name;
  int? stock;
  bool? isHidden;
  List<String>? categories;
  List<String>? imageUrls;
  List<String>? itemIds;
}
