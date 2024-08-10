import 'package:flutter/material.dart';
import '../widgets/loading_dialog.dart';
import '/utils/api_service.dart';

class VerifyPhoneScreen extends StatelessWidget {
  final String userId;
  final TextEditingController otpController = TextEditingController();
  final ApiService apiService = ApiService();

  VerifyPhoneScreen({required this.userId});

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
              'Enter the code to verify your account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text(
              'We have sent you an email with a code',
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: otpController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter code',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String otp = otpController.text;
                showLoadingDialog(context); // Show loading dialog
                try {
                  var response = await apiService.verifyOTP(userId, otp);
                  hideLoadingDialog(context); // Hide loading dialog
                  if (response['status'] == 'VERIFIED') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response['message'])),
                    );
                    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response['message'])),
                    );
                  }
                } catch (e) {
                  hideLoadingDialog(context); // Hide loading dialog on error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Verification failed: $e')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Done'),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Add resend code functionality if needed
              },
              child: const Text(
                'Send a new code',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
