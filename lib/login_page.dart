import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [


              SizedBox(height: 20),

              _buildTextInput("Email", Icons.email, _emailController),

              SizedBox(height: 20),

              _buildTextInput(
                "Password",
                Icons.lock,
                _passwordController,
                isPassword: true,
              ),

              SizedBox(height: 20),

              _buildRegisterButton(),

              SizedBox(height: 20),

              _buildLoginPrompt(),
            ],
          ),
        ),
      ),
    );
  }

  /// Show Input Values
  void _showInputValues() {

    String email = _emailController.text;
    String password = _passwordController.text;

    print("Email : $email - Password : $password");
  }

  /// Dispose Controllers
  @override
  void dispose() {

    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildTextInput(
    String hint,
    IconData icon,
    TextEditingController controller, {
    bool isPassword = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),

          SizedBox(width: 10),

          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword ? _isPassword : false,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),

          if (isPassword)
            IconButton(
              icon: Icon(
                _isPassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isPassword = !_isPassword;
                });
              },
            ),
        ],
      ),
    );
  }

  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: _showInputValues,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
      child: Text("Login", style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildLoginPrompt() {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: RichText(
          text: TextSpan(
            text: "Already have an account? ",
            style: TextStyle(color: Colors.grey),
            children: [
              TextSpan(
                text: "Click here to register",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
