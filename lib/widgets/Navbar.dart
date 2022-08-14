import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Filter",style: TextStyle(color: Colors.deepPurple,
                                fontSize: 30.0, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(color: Colors.deepPurple),
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
                labelText: 'Date',
  ),
            ),
          ),
          Text('Price Range',style: TextStyle(color: Colors.deepPurple,
                                fontSize: 15.0, fontWeight: FontWeight.bold)),
Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              style: TextStyle(color: Colors.deepPurple),
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
                labelText: 'Min',
  ),
            ),
          ),          
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              style: TextStyle(color: Colors.deepPurple),
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
                labelText: 'Max',
  ),
            ),
          ),

        ],
      )
    );
  }
}
