import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Popup Menu Example'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late OverlayEntry _overlayEntry;

  void showPopupMenu() {
    OverlayState overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        right: 20, // Adjust based on your FloatingActionButton's position
        top: 100, // Adjust based on your FloatingActionButton's position
        child: Material(
          elevation: 2.0,
          child: NavigationMenu(onClose: closePopupMenu),
        ),
      ),
    );

    overlayState.insert(_overlayEntry);
  }

  void closePopupMenu() {
    _overlayEntry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        onPressed: () {
          showPopupMenu();
        },
        child: Icon(Icons.menu),
      ),
    );
  }
}

class NavigationMenu extends StatelessWidget {
  final VoidCallback onClose;

  NavigationMenu({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 221,
      height: 252,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          // Your menu items or buttons go here
          ListTile(
            leading: Icon(Icons.change_history),
            title: Text('Change name', style: GoogleFonts.poppins()),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Change Currency', style: GoogleFonts.poppins()),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Leave Group', style: GoogleFonts.poppins()),
            onTap: () {},
          ),
          ElevatedButton(
            onPressed: onClose,
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}
