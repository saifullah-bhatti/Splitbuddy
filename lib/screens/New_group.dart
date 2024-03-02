import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const Scaffold(
        body: AddMembers(),
      ),
    );
  }
}

class AddMembers extends StatefulWidget {
  const AddMembers({Key? key}) : super(key: key);

  @override
  _AddMembersState createState() => _AddMembersState();
}


class _AddMembersState extends State<AddMembers> {
  final TextEditingController _groupNameController = TextEditingController();
  String? _selectedCurrency;
  final List<String> _currencies =
   ['USD', 'EUR', 'GBP', 'PKR',
    'JPY', 'CNY', 'INR', 'CAD', // Additional example currencies
    'AUD', 'CHF', 'SEK', 'NZD',
    'MXN', 'SGD', 'HKD', 'NOK',
    'KRW', 'TRY', 'RUB', 'ZAR', ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Split Buddy'),

        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      drawer: buildCustomDrawer(context), // Updated to use the custom drawer
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const BoxDecoration(
                  color: Color(0xB2298CFF),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: TextField(
                  controller: _groupNameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Group Name',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  color: Color(0xB2298CFF),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedCurrency,
                    icon: const Icon(Icons.arrow_downward, color: Colors.white),
                    dropdownColor: const Color(0xB2789DCB),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    isExpanded: true,
                    items: _currencies.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: const TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCurrency = newValue;
                      });
                    },
                    hint: Text("Select Currency", style: TextStyle(color: Colors.white.withOpacity(0.6))),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Positioned(
              left: 15,
              top: 200,
              child: Container(
                width: 294,
                height: 354,
                decoration: const BoxDecoration(
                  color: Color(0xB2298CFF),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0), // Adjust the value to your preference
                      child: Container(
                        width: 219,
                        height: 61,
                        decoration: ShapeDecoration(
                          color: const Color(0xCC298CFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Add Members',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )




                  ],
                ),

              ),
            ),


            const SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xB2298CFF), // Button background color
                minimumSize: const Size(83, 46), // Button size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Button shape
                ),
              ),
              onPressed: () {
                // Your navigation or functionality here
                print('Proceed button pressed');
              },
              child: const Text(
                'Proceed',
                style: TextStyle(
                  color: Colors.white, // Text color inside the button
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }


  Drawer buildCustomDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 180,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: const DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 20,
                    child: Text(
                      'Groups',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Icon(Icons.edit, size: 38, color: Colors.white),
                  ),

                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.group, color: Colors.black),
            title: const Text('Group 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.group, color: Colors.black),
            title: const Text('Group 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: const Color(0xFF8E8D8D),
            child: const Center(
              child: Text(
                'About SplitBuddy',
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
    );

  }
}
