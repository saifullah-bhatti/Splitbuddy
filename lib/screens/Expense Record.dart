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
        body: MyCustomWidget(),
      ),
    );
  }
}

class MyCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    // Define sizes based on screen width or height
    final buttonWidth = screenWidth * 0.30; // Example for 30% of the screen width
    final buttonHeight = screenHeight * 0.06; // Example for 6% of the screen height

    return Container(
      width: screenWidth,
      height: screenHeight,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Color(0xFFFCFCFC),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 64,
              top: 32,
              child: Container(
                width: 231,
                height: 61,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: const Color(0xB2298CFF),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Positioned(
              left: 64,
              top: 117,
              child: Container(
                width: 109,
                height: 45,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: const Color(0xB2298CFF),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Positioned(
              left: 79,
              top: 126,
              child: Text(
                'Overview',
                style: GoogleFonts.getFont(
                  'Poppins',
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Positioned(
              left: 180,
              top: 115,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color(0xB2298CFF), // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 18.0), // Adjust based on your design
                ),
                onPressed: () {
                  // Define what happens when the button is tapped
                  print('Expenses button pressed');
                },
                child: Text(
                  'Expenses',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Positioned(
              left: 95,
              top: 43,
              child: Text(
                'Group Name',
                style: GoogleFonts.getFont(
                  'Poppins',
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 165,
              top: 279,
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FqvyFnglTIodQXxyXFUix%2F31c1b420a2747b9047ed79db95a36dc6348e8cb9img%206.png?alt=media&token=2e2d457b-17b7-4fb2-9b0b-af2656e0cf11',
                width: 30,
                height: 34,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 155,
              top: 271,
              child: Container(
                width: 50,
                height: 50,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: const Color(0x99FAFCFF),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Positioned(
              left: 155,
              top: 271,
              child: Container(
                width: 50,
                height: 50,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: const Color(0x99FAFCFF),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Positioned(
              left: 100,
              top: 342,
              child: Text(
                'No expenses ',
                style: GoogleFonts.getFont(
                  'Poppins',
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 38,
              top: 378,
              child: Text(
                'Add an expense by pressing the button ',
                style: GoogleFonts.getFont(
                  'Poppins',
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 157,
              top: 402,
              child: Text(
                'below',
                style: GoogleFonts.getFont(
                  'Poppins',
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 280,
              top: 718,
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FqvyFnglTIodQXxyXFUix%2Fb6d71d750b84d8772490434675c7484858b97a3dPlus.png?alt=media&token=60c2adb4-4b98-4342-b4bf-8b0f318e6615',
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: 310,
              top: 30,
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FqvyFnglTIodQXxyXFUix%2F5e12ebcba26476dd111c585c37f9f5a2faf26597Menu%20Vertical.png?alt=media&token=edb0ec5e-6924-4612-8fc3-a99ee3949fb1',
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: 9,
              top: 12,
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FqvyFnglTIodQXxyXFUix%2Fabef71872cbe27957569da540a4f3f138965f0adMenu.png?alt=media&token=643322b0-ec6f-4f0e-8b4c-156f65cfdb93',
                width: 30,
                height: 40,
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      ),
    );
  }
  }

