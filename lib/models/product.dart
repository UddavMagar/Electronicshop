class Product {
  int id;
  String name;
  String image;
  String price;
  int stock;
  String createDate;
  List<dynamic> category;

  Product({required this.id, required this.name,
          required this.image, required this.price,
          required this.stock, required this.createDate,
          required this.category
      });

}

