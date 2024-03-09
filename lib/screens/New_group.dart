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
  State<AddMembers> createState() => _AddMembersState();
}

class _AddMembersState extends State<AddMembers> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _memberNameController = TextEditingController();
  List<TextEditingController> _memberControllers = []; // List to hold controllers for member inputs
  String? _selectedCurrency;

  final List<String> _currencies = [
    'USD', 'EUR', 'GBP', 'PKR',
    'JPY', 'CNY', 'INR', 'CAD',
    'AUD', 'CHF', 'SEK', 'NZD',
    'MXN', 'SGD', 'HKD', 'NOK',
    'KRW', 'TRY', 'RUB', 'ZAR',
  ];

  @override
  void initState() {
    super.initState();
    _addMember(); // Start with one empty field for member addition
  }

  @override
  void dispose() {
    _groupNameController.dispose();
    _memberNameController.dispose();
    for (var controller in _memberControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addMember() {
    setState(() {
      _memberControllers.add(TextEditingController());
    });
  }

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
      drawer: buildCustomDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _groupNameController,
                decoration: const InputDecoration(
                  hintText: 'Enter Group Name',
                  fillColor: Color(0xB2298CFF),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  hintStyle: TextStyle(color: Colors.white),
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

            ..._memberControllers.map((controller) => buildMemberInputField(controller)).toList(),
            TextButton(
              onPressed: _addMember,
              child: const Text('Add Member', style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
            ),
            TextButton(
              onPressed: () {
                print('Proceed');
              },
              child: const Text('Proceed', style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMemberInputField(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xB2298CFF), // Your chosen container color
          borderRadius: BorderRadius.all(Radius.circular(30)), // Rounded corners for the container
        ),
        child: Row(
          children: [
            Expanded( // TextField takes all the width it can get except for the IconButton
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Member Name',
                  fillColor: Color(0xB2298CFF),
                  filled: true,
                  border: InputBorder.none, // Remove the underline border of the TextField
                  contentPadding: EdgeInsets.only(left: 20), // Adjust padding as needed
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
              onPressed: () => _removeMember(controller), // Call _removeMember when the icon is tapped
            ),
          ],
        ),
      ),
    );
  }

  void _removeMember(TextEditingController controller) {
    setState(() {
      int controllerIndex = _memberControllers.indexOf(controller);
      if (controllerIndex != -1) {
        _memberControllers.removeAt(controllerIndex);
        controller.dispose();
      }
    });
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
