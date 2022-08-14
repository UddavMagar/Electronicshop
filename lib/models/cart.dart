class Cart {
  late final int cartId;
  final String productId;
  final String productName;
  final int initialPrice;
  final int productPrice;
  final int quantity;
  final String productImage;
  final int productStock;

  Cart({
    required this.cartId,
    required this.productId,
    required this.productName,
    required this.initialPrice,
    required this.productPrice,
    required this.quantity,
    required this.productImage,
    required this.productStock,
  });

  Cart.fromMap(Map<dynamic, dynamic> res)
      : cartId = res["cartId"],
        productId = res["productId"],
        productName = res["productName"],
        initialPrice = res["initialPrice"],
        productPrice = res["productPrice"],
        quantity = res["quantity"],
        productImage = res["productImage"],
        productStock = res["productStock"];

  Map<String, Object?> toMap() {
    return {
      'cartId': cartId,
      'productId': productId,
      'productName': productName,
      'initialPrice': initialPrice,
      'productPrice': productPrice,
      'quantity': quantity,
      'productImage': productImage,
      'productStock': productStock,
    };
  }
}
