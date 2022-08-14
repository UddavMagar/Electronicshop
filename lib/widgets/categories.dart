import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool isPressed0=true, isPressed1 = true, isPressed2 = true, isPressed3 = true, isPressed4 = true, isPressed5 = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isPressed0 ? Colors.white : Colors.deepPurple,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (isPressed0 == true) {
                    isPressed0 = false;
                  } else {
                    isPressed0 = true;
                  }
                });
              },
              child: Text(
                'electronic',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isPressed1 ? Colors.white : Colors.deepPurple,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (isPressed1 == true) {
                    isPressed1 = false;
                  } else {
                    isPressed1 = true;
                  }
                });
              },
              child: Text(
                'watch',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isPressed2 ? Colors.white : Colors.deepPurple,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (isPressed2 == true) {
                    isPressed2 = false;
                  } else {
                    isPressed2 = true;
                  }
                });
              },
              child: Text(
                'laptop',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isPressed3 ? Colors.white : Colors.deepPurple,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (isPressed3 == true) {
                    isPressed3 = false;
                  } else {
                    isPressed3 = true;
                  }
                });
              },
              child: Text(
                'keyboard',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isPressed4 ? Colors.white : Colors.deepPurple,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (isPressed4 == true) {
                    isPressed4 = false;
                  } else {
                    isPressed4 = true;
                  }
                });
              },
              child: Text(
                'mobile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isPressed5 ? Colors.white : Colors.deepPurple,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (isPressed5 == true) {
                    isPressed5 = false;
                  } else {
                    isPressed5 = true;
                  }
                });
              },
              child: Text(
                'headset',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
