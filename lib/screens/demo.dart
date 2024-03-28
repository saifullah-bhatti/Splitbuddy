import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Make sure to import your custom_drawer and navigation_menu if they are used.

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({Key? key}) : super(key: key);

  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  bool _isContainerVisible = false; // Define the visibility state here

  Widget buildPopupMenuContent() {
    // Your popup menu content
    return Container(); // Placeholder for your actual content
  }

  @override
  Widget build(BuildContext context) {
    // Your existing build method
    return GestureDetector(
      onTap: () {
        // You can handle outside tap here if you need to change _isContainerVisible
      },
      child: Stack(
        children: [
          // Your existing widgets and positioned elements
          if (_isContainerVisible)
            Positioned(
              // Your conditionally visible widget
              child: yourComplexContainer(),
            ),
          // Other widgets...
        ],
      ),
    );
  }

  Widget yourComplexContainer() {
    // Your complex container widget here
    return Container(
      width: 221,
      height: 252,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          'Container Content Here',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ); // Placeholder for your actual container widget
  }
}
