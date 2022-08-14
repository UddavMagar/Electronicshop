import 'package:electronicshop/screens/loginpage.dart';
import 'package:electronicshop/screens/mainscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static final String id = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 7), () async {
      User? firebaseUser = FirebaseAuth.instance.currentUser;
      print('$firebaseUser');
      if (firebaseUser != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => MainPage()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Login()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Shimmer.fromColors(
                baseColor: Color(0xff7f00ff),
                highlightColor: Color(0xffe100ff),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      "ELECTRONIC",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontFamily: 'Pacifico',
                        shadows: <Shadow>[
                          Shadow(
                              blurRadius: 18.0,
                              color: Colors.black87,
                              offset: Offset.fromDirection(120, 12)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Stack(alignment: Alignment.center,
            children: [
              Icon(Icons.shopping_bag_outlined,size: 50,color: Colors.deepPurple,),
              SizedBox(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurpleAccent,),
                ),
              ),
            ],
            ),
          )
        ],
      ),
      
    );
  }
}
