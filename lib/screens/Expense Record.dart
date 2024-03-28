import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helper/custom_drawer.dart';
import '../helper/navigation_menu.dart';
void main() {
  runApp(const MyApp());
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        drawer: const CustomDrawer(),
        body: const MyCustomWidget(),
      ),
    );
  }
}

class MyCustomWidget extends StatelessWidget {
  const MyCustomWidget({Key? key}) : super(key: key);
  Widget buildMoreVertContent() {
    return Container(
      width: 221,
      height: 252,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,


      ),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 221,
                height: 252,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 24,
                      top: 20,
                      child: Container(
                        width: 173,
                        height: 45,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: const Color(0x7F298CFF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 24,
                      top: 74,
                      child: Container(
                        width: 173,
                        height: 45,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: const Color(0x7F298CFF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 51,
                      top: 83,
                      child: Text(
                        'Change name',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none, // Explicitly set no text decoration
                        ),
                      ),

                    ),
                    Positioned(
                      left: 24,
                      top: 182,
                      child: Container(
                        width: 173,
                        height: 45,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: const Color(0x7F298CFF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 24,
                      top: 128,
                      child: Container(
                        width: 173,
                        height: 45,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: const Color(0x7F298CFF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 36,
                      top: 138,
                      child: Text(
                        'Change Currency',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none, // Explicitly set no text decoration
                        ),
                      ),

                    ),
                    Positioned(
                      left: 37,
                      top: 29,
                      child: Text(
                        'Total expenditures',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none, // Explicitly set no text decoration
                        ),
                      ),

                    ),
                    Positioned(
                      left: 57,
                      top: 191,
                      child: Text(
                        'Leave Group',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none, // Explicitly set no text decoration
                        ),
                      ),

                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget buildPopupMenuContent() {
    return Container(
      width: 280,
      height: 181,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 276,
                height: 179,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Positioned(
                      left: 222,
                      top: 119,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                    Positioned(
                      left: 131,
                      top: 123,
                      child: Text(
                        'New person',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 41,
                      top: 141,
                      child: Text(
                        'Somebody to split costs with',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 223,
                      top: 70,
                      child: Icon(
                        Icons.add_circle,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                    const Positioned(
                      left: 227,
                      top: 20,
                      child: Icon(
                        Icons.monetization_on,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),

                    Positioned(
                      left: 121,
                      top: 24,
                      child: Text(
                        'New expense',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 118,
                      top: 73,
                      child: Text(
                        'New payment',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 28,
                      top: 39,
                      child: Text(
                        'A purchase made for the group',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 54,
                      top: 88,
                      child: Text(
                        'A payment within the group',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    return Container(
      width: 360,
      height: 800,
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
              top: 40,
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
              left: 186,
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
              left: 200,
              top: 126,
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
            Positioned(
              left: 100,
              top: 50,
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
            const Positioned(
              left: 165,
              top: 279,
              child: Icon(
                Icons.add_shopping_cart,
                size: 35,
                color: Colors.black,
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
              left: 315,
              top: 30,
              child: GestureDetector(
                onTap: () {
                  showGeneralDialog(
                    context: context,
                    barrierDismissible: true,  // Allows dismissing the dialog by tapping the barrier.
                    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                    barrierColor: Colors.black45,  // Semi-transparent barrier color.
                    transitionDuration: const Duration(milliseconds: 0),  // Removes animation duration.
                    pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                      return Align(
                        alignment: Alignment.topRight,  // Aligns the dialog to the top right.
                        child: Container(
                          width: 221,  // Your specified width.
                          height: 252,  // Your content.
                          decoration: BoxDecoration(
                            color: Colors.white,  // Example color.
                            borderRadius: BorderRadius.circular(15.0),  // Rounded corners.
                          ),
                          margin: const EdgeInsets.only(top: 56, right: 20),  // Your specified height.
                          child: buildMoreVertContent(),  // Adjusts the position from the top right corner.
                        ),
                      );
                    },
                    transitionBuilder: (context, animation, secondaryAnimation, child) {
                      // Returns the child directly without any transition effects.
                      return child;
                    },
                  );
                },
                child: const Icon(
                  Icons.more_vert_outlined,
                  size: 40,
                  color: Color(0xFF5F6368),
                ),
              ),
            ),






            Positioned(
              left: 0,
              top: 30,
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.black, size: 30),

                onPressed: () => _scaffoldKey.currentState?.openDrawer(),

              ),
            ),


            Positioned(
              left: 290,
              top: 718,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return buildPopupMenuContent(

                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  );
                },
                child: const Icon(
                  Icons.add_circle,
                  size: 60,
                    color: Color(0xB2298CFF)
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}