import 'package:badges/badges.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:electronicshop/database/cartdb.dart';
import 'package:electronicshop/models/cartprovider.dart';
import 'package:electronicshop/screens/cartpage.dart';
import 'package:electronicshop/screens/homepage.dart';
import 'package:electronicshop/widgets/Navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static final String id = "MainPage";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<Widget> _pages;
  late Widget _page1;
  late Widget _page2;
  late int _currentIndex;
  late Widget _currentPage;

  CartDB? dbHelper = CartDB();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _page1 = HomePage();
    _page2 = CartPage();
    _pages = [_page1, _page2];
    _currentIndex = 0;
    _currentPage = _page1;
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    
    return SafeArea(
      child: Scaffold(drawer: NavBar(),
        appBar: AppBar(
          title: Text("Electronic"),
        ),
        body: _currentPage,
        bottomNavigationBar: CurvedNavigationBar(
          height: 50.0,
          color: Colors.deepPurple,
          backgroundColor: Colors.transparent,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Badge(
              badgeContent:
                  Consumer<CartProvider>(builder: (context, value, child) {
                return Text(
                  value.counter.toString(),
                  style: TextStyle(color: Colors.white),
                );
              }),
              child: Icon(
                Icons.shopping_cart,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
          onTap: (index) {
            _changeTab(index);
          },
        ),
      ),
    );
  }
}
