import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Homepage());
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Express',
      theme: ThemeData(
        primaryColor: Colors.teal,
        brightness: Brightness.light,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        ),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController =
      TextEditingController(text: "+91 ");

  void _sendOtp() {
    // Navigate to OTP page and send OTP logic here
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtpPage(phoneController.text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome to Health Express',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[800]),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      // prefixText: "+91 ",
                      hintText: 'Enter 10-digit phone number',
                      prefixIcon: Icon(Icons.phone, color: Colors.teal),
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(
                          10), // Limit to "+91 " + 10 digits
                    ],
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _sendOtp,
                    child: Text('Login', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OtpPage extends StatelessWidget {
  final String phoneNumber;

  OtpPage(this.phoneNumber);

  final TextEditingController otpController = TextEditingController();

  void _verifyOtp() {
    // Verify OTP logic here
    print('OTP Entered: ${otpController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify OTP'),
      ),
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Enter OTP',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[800]),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'OTP sent to $phoneNumber',
                    style: TextStyle(fontSize: 16, color: Colors.teal[600]),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: otpController,
                    decoration: InputDecoration(
                      hintText: 'Enter OTP',
                      prefixIcon: Icon(Icons.lock, color: Colors.teal),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _verifyOtp,
                    child: Text('Verify', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
