import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController _usernameController = TextEditingController();
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

              _buildTextInput(
                "Username",
                Icons.person,
                _usernameController,
              ),

              SizedBox(height: 20),

              _buildTextInput(
                "Email",
                Icons.email,
                _emailController,
              ),

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

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    print(
        "Username : $username - Email : $email - Password : $password"
    );
  }

  /// Dispose Controllers
  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildTextInput(
      String hint,
      IconData icon,
      TextEditingController controller,
      {bool isPassword = false}
      ) {
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
      child: Text(
        "Register",
        style: TextStyle(color: Colors.white),
      ),
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
                text: "Click here to login",
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