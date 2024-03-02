import 'package:flutter/material.dart';
import '/screens/New_group.dart';
class ChooseGroup extends StatelessWidget {
  const ChooseGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Center( // Center the column
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Let’s go',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Do you want to create a new group or join an existing one?',
                textAlign: TextAlign.center, // Center align text
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 30), // Add some spacing
            ElevatedButton(
              onPressed: () {
                // Navigate to the New Group page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddMembers()), // Correct class name
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA4CDFD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 20),
                child: Text(
                  'New Group',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Add some spacing
            ElevatedButton(
              onPressed: () {
                // Navigate to the Join Group page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA4CDFD), // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 20),
                child: Text(
                  'Join Group',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
