import 'package:flutter/material.dart';
import '../widgets/loading_dialog.dart';
import '/utils/api_service.dart';
import '/screens/verify_phone.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController other_namesController = TextEditingController();
  final TextEditingController macAddressController = TextEditingController(); // Controller for Harvestify ID
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView( // Added SingleChildScrollView to handle overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Phone',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: surnameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Surname',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: other_namesController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Other names',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              const SizedBox(height: 20),
              TextField( // Harvestify ID input field
                controller: macAddressController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Harvestify ID', // Displayed as Harvestify ID
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String email = emailController.text;
                  String phone = phoneController.text;
                  String password = passwordController.text;
                  String surname = surnameController.text;
                  String other_names = other_namesController.text;
                  String macAddress = macAddressController.text;

                  showLoadingDialog(context); // Show loading dialog
                  try {
                    var response = await apiService.signup(email, phone, password, surname, other_names, macAddress);
                    hideLoadingDialog(context); // Hide loading dialog

                    print('Response: ${response.toString()}'); // Print the response

                    if (response['status'] == 'PENDING') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VerifyPhoneScreen(userId: response['data']['userId'])),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(response['message'])),
                      );
                    }
                  } catch (e) {
                    hideLoadingDialog(context); // Hide loading dialog on error
                    print('Error: $e'); // Print the error
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Signup failed: $e')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.green,
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                ),
                child: const Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
