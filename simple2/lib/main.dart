import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universitas Prasetiya Mulya',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  // Helper untuk styling TextField agar lebih simple
  InputDecoration _inputStyle(String hint) => InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[600]),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(16),
        border: _outlineBorder(),
        enabledBorder: _outlineBorder(),
        focusedBorder: _outlineBorder(color: Colors.blue),
      );

  OutlineInputBorder _outlineBorder({Color color = const Color(0xFFE0E0E0)}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://lms.prasetiyamulya.ac.id/pluginfile.php/1/theme_moove/loginbgimg/1770083072/bg_login_mdl.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20, offset: const Offset(0, 10))],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network('https://lms.prasetiyamulya.ac.id/pluginfile.php/1/theme_moove/logo/1770083072/logo_upm_biru.png', height: 80),
                  const SizedBox(height: 40),
                  TextField(controller: _userController, decoration: _inputStyle('Username or email')),
                  const SizedBox(height: 16),
                  TextField(controller: _passController, obscureText: true, decoration: _inputStyle('Password')),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[600],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Log in', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Lost password?', style: TextStyle(color: Colors.grey[600])),
                  ),
                  const SizedBox(height: 24),
                  _footerText('This site best viewed in Google Chrome.'),
                  const SizedBox(height: 16),
                  _footerText('Cookies notice', icon: Icons.help_outline, alignRight: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _footerText(String text, {IconData? icon, bool alignRight = false}) {
    return Padding(
      padding: EdgeInsets.only(left: alignRight ? 0 : 0, right: alignRight ? 0 : 0),
      child: Row(
        mainAxisAlignment: alignRight ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (icon != null && alignRight) ...[Icon(icon, size: 18, color: Colors.grey[600]), const SizedBox(width: 6), Text(text, style: TextStyle(fontSize: 13, color: Colors.grey[600]), textAlign: TextAlign.right)],
          if (icon == null || !alignRight) ...[
            if (icon != null) ...[Icon(icon, size: 18, color: Colors.grey[600]), const SizedBox(width: 6)],
            Text(text, style: TextStyle(fontSize: 13, color: icon == null ? Colors.black87 : Colors.grey[600]), textAlign: alignRight ? TextAlign.right : TextAlign.left),
          ],
        ],
      ),
    );
  }
}