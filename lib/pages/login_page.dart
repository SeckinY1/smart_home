import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_system/pages/home_screen.dart';
import 'package:smart_home_system/services/auth_service.dart';
import 'package:smart_home_system/widgets/custom_button.dart';
import 'package:smart_home_system/widgets/custom_textfield.dart';
import 'package:smart_home_system/widgets/snackbar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 50),
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  controller: emailController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                CustomButton(
                  onTap: () async {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    if (email.isEmpty || !isValidEmail(email)) {
                      snackBar(
                          context, 'Lütfen geçerli bir e-posta adresi girin.');
                    } else {
                      // E-posta alanı geçerliyse giriş yapmaya devam et
                      try {
                        await authService.signInWithEmailAndPassword(
                          email,
                          password,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } on FirebaseAuthException {
                        // Giriş başarısız, hata göster

                        snackBar(context,
                            'Giriş yapılamadı, lütfen e-posta ve şifrenizi kontrol edin.');
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    return (email.contains('@gmail') || email.contains("@deneme")) &&
        email.contains('.');
  }
}
