import 'package:electronicshop/models/login.dart';
import 'package:electronicshop/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {

  static final String id = "Login";

  @override
  _LoginState createState() => _LoginState();
}

LoginId _LoginId = LoginId();
bool loading = false;

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _store = FirebaseFirestore.instance;

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

void showInSnackBar(String value) {
  _scaffoldKey.currentState!
      .showSnackBar(SnackBar(content: Text(value)));
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Electronic Shop",
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 40, fontFamily: 'Pacifico', color: Colors.deepPurple),
                  ),
                ),
                Center(
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 30, color: Colors.deepPurple),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.deepPurple))),
                                child: TextField(
                                  style: TextStyle(color: Colors.deepPurple),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                        fontSize: 20,
                                        color: Colors.deepPurple,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      _LoginId.loginEmail = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.deepPurple))),
                                child: TextField(
                                  obscureText: true,
                                  style: TextStyle(color: Colors.deepPurple),
                                  onChanged: (value) {
                                    setState(() {
                                      _LoginId.loginPassword = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        fontSize: 20,
                                        color: Colors.deepPurple,
                                      )),
                                ),
                              ),
                              Container(
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {});
                                        },
                                        child: Text(
                                          "Forget Password?",
                                          style: TextStyle(
                                              fontSize: 15, color: Colors.deepPurple),
                                        ),
                                      ))),
                              SizedBox(height: 30),
                              Column(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.lightBlue,
                                      border: Border.all(color: Colors.blue),
                                    ),
                                    child: RaisedButton(
                                      color: Colors.deepPurple,
                                      onPressed: () async {
                                        try {
                                          setState(() {
                                            loading = true;
                                          });
                                          var res = await _auth
                                              .signInWithEmailAndPassword(
                                                  email: (_LoginId.loginEmail)
                                                      .toString(),
                                                  password: (_LoginId.loginPassword)
                                                      .toString());
                                          setState(() {
                                            loading = false;
                                          });
                                          Navigator.pushReplacementNamed(
                                              context, MainPage.id);
                                        } catch (e) {
                                          setState(() {
                                            loading = false;
                                          });
                                          showInSnackBar(e.toString());
                                        }
                                      },
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  ],
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
          )),
    );
  }
}
