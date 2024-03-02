import 'package:flutter/material.dart';
import 'database_helper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Check if the email already exists
      final emailAlreadyExists = await DatabaseHelper.instance.emailExists(_email);
      if (emailAlreadyExists) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('This email already exists, please sign up with another email')),
        );
        // Optionally, clear the input fields here
        return; // Stop the sign-up process
      }

      // Insert the user data into the database if email does not exist
      final id = await DatabaseHelper.instance.insertUser({
        'username': _username,
        'email': _email,
        'password': _password, // Reminder: hash passwords in a real app
      });

      print('Inserted user id: $id');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User successfully signed up with id $id')),
      );

      // Clear the form fields after successful sign up
      _formKey.currentState!.reset();
    }
  }


  @override
  Widget build(BuildContext context) {
    // Determine screen size for responsive layout
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Background color
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: screenSize.height * 0.1), // Dynamic spacing
                // Placeholder for logo or header image
                Container(
                  width: double.infinity,
                  height: screenSize.height * 0.2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/Screenshot 2024-02-26 092709.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Username Field
                TextFormField(
                  decoration: _inputDecoration(Icons.person, 'Username'),
                  validator: (value) => value!.isEmpty ? 'Please enter a username' : null,
                  onSaved: (value) => _username = value!,
                ),
                const SizedBox(height: 20),
                // Email Field
                TextFormField(
                  decoration: _inputDecoration(Icons.email, 'Email'),
                  validator: (value) => value!.isEmpty || !value.contains('@') ? 'Enter a valid email' : null,
                  onSaved: (value) => _email = value!,
                ),
                const SizedBox(height: 20),
                // Password Field
                TextFormField(
                  obscureText: true,
                  decoration: _inputDecoration(Icons.lock, 'Password'),
                  validator: (value) => value!.isEmpty ? 'Please enter a password' : null,
                  onSaved: (value) => _password = value!,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA4CDFD), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded button
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  onPressed: _signUp,
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(IconData icon, String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.black),
      prefixIcon: Icon(icon, color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(30), // Match button borderRadius
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.circular(30), // Match button borderRadius
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
