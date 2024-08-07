import 'package:flutter/material.dart';
import '/utils/api_service.dart';
import '/screens/verify_phone.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Padding(
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
            ElevatedButton(
              onPressed: () async {
                String email = emailController.text;
                String phone = phoneController.text;
                String password = passwordController.text;
                try {
                  var response = await apiService.signup(email, phone, password);
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
    );
  }
}
