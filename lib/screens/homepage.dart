import 'package:badges/badges.dart';
import 'package:electronicshop/database/cartdb.dart';
import 'package:electronicshop/models/cart.dart';
import 'package:electronicshop/models/cartprovider.dart';
import 'package:electronicshop/models/product.dart';
import 'package:electronicshop/network/end_points.dart';
import 'package:electronicshop/network/network_handler.dart';
import 'package:electronicshop/widgets/categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CartDB? dbHelper = CartDB();
  List<Product> productRequest = [];

  @override
  void initState() {
    serverRequest();
    dbHelper?.db;
    super.initState();
  }

  Future<List<Product>> serverRequest() async {
    NetworkHandler networkHandler = NetworkHandler();
    productRequest = await networkHandler.requestToServer(PRODUCT_ENDPOINT);
    return productRequest;
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Text(
            "Categories",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Categories(),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: serverRequest,
            child: FutureBuilder(
              future: serverRequest(),
              builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                if (snapshot.hasData) {
                  cart.getCounter();
                  return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemBuilder: (BuildContext context, int position) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Center(
                                  child: Image(
                                      height: 100.0,
                                      image: NetworkImage(HOST_URL +
                                          snapshot.data![position].image)),
                                ),
                                Positioned(
                                  right: 0.0,
                                  bottom: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            new Radius.circular(10.0)),
                                        color: Colors.blueAccent),
                                    child: Text(
                                      snapshot.data![position].createDate,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                snapshot.data![position].name,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Rs " + snapshot.data![position].price,
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.deepPurple),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Badge(
                                    badgeContent: Text(
                                        (snapshot.data![position].stock)
                                            .toString()),
                                    
                                    child: (snapshot.data![position].stock>0)?
                                    InkWell(
                                      onTap: () {
                                        CartDB()
                                            .insert(Cart(
                                          cartId: position,
                                          productId: position.toString(),
                                          productImage:
                                              snapshot.data![position].image,
                                          productName:
                                              snapshot.data![position].name,
                                          initialPrice: int.parse(
                                              snapshot.data![position].price),
                                          productPrice: int.parse(
                                              snapshot.data![position].price),
                                          productStock:
                                              snapshot.data![position].stock,
                                          quantity: 1,
                                        ))
                                            .then((value) {
                                          print('Product is Added');
                                          cart.addTotalPrice(double.parse(
                                              snapshot.data![position].price));
                                          cart.addCounter();
                                        }).onError((error, stackTrace) {
                                          print(error.toString());
                                        });
                                      },
                                      child: Icon(
                                        Icons.add_shopping_cart,
                                        size: 30,
                                        color: Colors.deepPurple,
                                      ),
                                    ):Icon(
                                        Icons.remove_shopping_cart_outlined,
                                        size: 30,
                                        color: Colors.deepPurple,
                                      ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('There was an error, Please try again'),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
