import 'package:flutter/material.dart';
import '../helper/database_helper.dart';
import '../helper/custom_drawer.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 253, 253, 253),
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
  List<TextEditingController> _memberControllers = [];
  final int _maxMembers = 10;
  bool _isEditMode = false;


  Future<List<Map<String, dynamic>>> _fetchGroups() async {
    return await DatabaseHelper.instance.queryAllGroups();
  }

  Future<void> _saveGroup() async {
    String groupName = _groupNameController.text.trim();
    String currency = _selectedCurrency ?? 'USD';
    String members = _memberControllers.map((controller) =>
        controller.text.trim()).join(',');

    if (groupName.isEmpty || members.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Group name and members are required.'),
        duration: Duration(seconds: 2),
      ));
      return;
    }

    Map<String, dynamic> row = {
      'Gname': groupName,
      'currency': currency,
      'members': members,
    };

    try {
      final id = await DatabaseHelper.instance.insertGroup(row);
      print('Inserted group id: $id');

      _groupNameController.clear();
      _memberControllers.forEach((controller) => controller.clear());
      _selectedCurrency = null;

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Group saved successfully.'),
        duration: Duration(seconds: 2),
      ));

    } catch (e) {
      print('Error saving group: $e');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Failed to save the group.'),
        duration: Duration(seconds: 2),
      ));
    }
  }
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
    _addMember();
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

    if (_memberControllers.isNotEmpty) {
      if (_memberControllers.last.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Please enter the member name before adding another.'),
            duration: Duration(seconds: 2),
          ),
        );
        return;
      }
    }

    if (_memberControllers.length >= _maxMembers) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Member limit has been reached.'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      setState(() {
        _memberControllers.add(TextEditingController());
      });
    }
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
      drawer: CustomDrawer(),

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
                    items: _currencies.map<DropdownMenuItem<String>>((
                        String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                            value, style: const TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCurrency = newValue;
                      });
                    },
                    hint: Text("Select Currency",
                        style: TextStyle(color: Colors.white.withOpacity(0.6))),
                  ),
                ),
              ),
            ),

            ..._memberControllers.map((controller) =>
                buildMemberInputField(controller)).toList(),
            TextButton(
              onPressed: _addMember,
              child: const Text(
                  'Add Member', style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
            ),
            TextButton(
              onPressed: _saveGroup,
              child: const Text(
                  'Proceed', style: TextStyle(color: Colors.white)),
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
          color: const Color(0xB2298CFF),
          borderRadius: BorderRadius.all(
              Radius.circular(30)),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Member Name',
                  fillColor: Color(0xB2298CFF),
                  filled: true,
                  border: InputBorder.none,

                  contentPadding: EdgeInsets.only(left: 20),

                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
              onPressed: () =>
                  _removeMember(
                      controller),
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




}