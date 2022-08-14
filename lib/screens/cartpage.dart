import 'package:electronicshop/database/cartdb.dart';
import 'package:electronicshop/models/cart.dart';
import 'package:electronicshop/models/cartprovider.dart';
import 'package:electronicshop/network/end_points.dart';
import 'package:electronicshop/screens/finalorder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartDB? dbHelper = CartDB();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: cart.getData(),
              builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int position) {
                          return Card(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image(
                                          height: 100.0,
                                          width: 100.0,
                                          image: NetworkImage(HOST_URL +
                                              snapshot.data![position]
                                                  .productImage)),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      (snapshot.data![position]
                                                              .productName)
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Rs " +
                                                          (snapshot
                                                                  .data![
                                                                      position]
                                                                  .productPrice)
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          color: Colors.deepPurple),
                                                    ),
                                                  ],
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      dbHelper?.delete(snapshot
                                                          .data![position]
                                                          .cartId);
                                                      cart.removeCounter();
                                                      cart.removeTotalPrice(
                                                          double.parse(snapshot
                                                              .data![position]
                                                              .productPrice
                                                              .toString()));
                                                    },
                                                    child: Icon(Icons.delete,color: Colors.deepPurple,)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                    color: Colors.deepPurple,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                        onTap: () {
                                                          if (snapshot
                                                                  .data![
                                                                      position]
                                                                  .quantity >
                                                              1) {
                                                            int quantity =
                                                                snapshot
                                                                    .data![
                                                                        position]
                                                                    .quantity;
                                                            int price = snapshot
                                                                .data![position]
                                                                .initialPrice;
                                                            quantity--;
                                                            int? newPrice =
                                                                price *
                                                                    quantity;
                                                            dbHelper!
                                                                .updateQuantity(
                                                                    Cart(
                                                              cartId: snapshot
                                                                  .data![
                                                                      position]
                                                                  .cartId,
                                                              productId: (snapshot
                                                                      .data![
                                                                          position]
                                                                      .cartId)
                                                                  .toString(),
                                                              productImage: snapshot
                                                                  .data![
                                                                      position]
                                                                  .productImage,
                                                              productName: snapshot
                                                                  .data![
                                                                      position]
                                                                  .productName,
                                                              initialPrice: int
                                                                  .parse((snapshot
                                                                          .data![
                                                                              position]
                                                                          .initialPrice)
                                                                      .toString()),
                                                              productPrice:
                                                                  newPrice,
                                                              productStock: snapshot
                                                                  .data![
                                                                      position]
                                                                  .productStock,
                                                              quantity:
                                                                  quantity,
                                                            ))
                                                                .then((value) {
                                                              newPrice = 0;
                                                              quantity = 0;
                                                              cart.removeTotalPrice(
                                                                  double.parse((snapshot
                                                                          .data![
                                                                              position]
                                                                          .initialPrice)
                                                                      .toString()));
                                                            }).onError((error,
                                                                    stackTrace) {
                                                              print(error
                                                                  .toString());
                                                            });
                                                          }
                                                        },
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: Colors.white,
                                                        )),
                                                    Text((snapshot
                                                            .data![position]
                                                            .quantity)
                                                        .toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                                    InkWell(
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                      ),
                                                      onTap: () {
                                                        if (snapshot
                                                                .data![position]
                                                                .quantity <
                                                            snapshot
                                                                .data![position]
                                                                .productStock) {
                                                          int quantity =
                                                              snapshot
                                                                  .data![
                                                                      position]
                                                                  .quantity;
                                                          int price = snapshot
                                                              .data![position]
                                                              .initialPrice;
                                                          quantity++;
                                                          int? newPrice =
                                                              price * quantity;
                                                          dbHelper!
                                                              .updateQuantity(
                                                                  Cart(
                                                            cartId: snapshot
                                                                .data![position]
                                                                .cartId,
                                                            productId: (snapshot
                                                                    .data![
                                                                        position]
                                                                    .cartId)
                                                                .toString(),
                                                            productImage: snapshot
                                                                .data![position]
                                                                .productImage,
                                                            productName: snapshot
                                                                .data![position]
                                                                .productName,
                                                            initialPrice: int
                                                                .parse((snapshot
                                                                        .data![
                                                                            position]
                                                                        .initialPrice)
                                                                    .toString()),
                                                            productPrice:
                                                                newPrice,
                                                            productStock: snapshot
                                                                .data![position]
                                                                .productStock,
                                                            quantity: quantity,
                                                          ))
                                                              .then((value) {
                                                            newPrice = 0;
                                                            quantity = 0;
                                                            cart.addTotalPrice(double
                                                                .parse((snapshot
                                                                        .data![
                                                                            position]
                                                                        .initialPrice)
                                                                    .toString()));
                                                          }).onError((error,
                                                                  stackTrace) {
                                                            print(error
                                                                .toString());
                                                          });
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
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
              }),
          Consumer<CartProvider>(builder: ((context, value, child) {
            return Visibility(
              visible: value.getTotalPrice().toStringAsFixed(2) == "0.00"
                  ? false
                  : true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableWidget(
                    title: "Sub Total",
                    value: value.getTotalPrice().toStringAsFixed(2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, right: 10),
                    child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, DetailForm.id);
                        },
                        child: Container(
                          height: 40.0,
                          width: 110.0,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            'Check Out',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                        )),
                  ),
                ],
              ),
            );
          }))
        ],
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
            ),
            Text(
              ' : Rs ' + value,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
