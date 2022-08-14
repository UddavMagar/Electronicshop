import 'package:electronicshop/models/cartprovider.dart';
import 'package:electronicshop/screens/finalorder.dart';
import 'package:electronicshop/screens/loginpage.dart';
import 'package:electronicshop/screens/mainscreen.dart';
import 'package:electronicshop/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase?.initializeApp(
     // options: DefaultFirebaseOptions.currentPlatform,
    );
  //FirebaseApp app = await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (BuildContext context){
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            scaffoldBackgroundColor: Colors.green[50],
          ),
          initialRoute: SplashScreen.id,
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            Login.id: ((context) => Login()),
            MainPage.id: (context) => MainPage(),
            DetailForm.id :(context) => DetailForm(),
          },
        );
      }),
      );

  }
}
