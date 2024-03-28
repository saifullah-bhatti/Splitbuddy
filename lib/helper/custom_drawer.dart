import 'package:flutter/material.dart';
import '../helper/database_helper.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isEditMode = false;

  Future<List<Map<String, dynamic>>> _fetchGroups() async {
    return await DatabaseHelper.instance.queryAllGroups();
  }

  @override
  Widget build(BuildContext context) {
    // Define the desired width of your drawer
    final drawerWidth = MediaQuery.of(context).size.width * 0.75; // 75% of screen width, for example

    return SizedBox(
      width: drawerWidth, // Use the defined width here
      child: Drawer(
        child: Column(
          children: [
            // Your existing drawer header and items...
            Container(
              height: 120,
              decoration: const BoxDecoration(color: Colors.blue),
              child: DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: Stack(
                  children: [
                    const Positioned(
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
                      child: IconButton(
                        icon: const Icon(Icons.edit, size: 38, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _isEditMode = !_isEditMode;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _fetchGroups(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return const Text('Error fetching groups');
                  } else {
                    final groups = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: groups.length,
                      itemBuilder: (context, index) {
                        final group = groups[index];
                        return ListTile(
                          leading: const Icon(Icons.group, color: Colors.black),
                          title: Text(group['Group name'] ?? 'No Name'),
                          trailing: _isEditMode
                              ? IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Add your deletion logic here
                            },
                          )
                              : null,
                          onTap: () {
                            if (!_isEditMode) {
                              Navigator.pop(context);
                              // Navigate to group detail page if needed
                            }
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
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
      ),
    );
  }
}
