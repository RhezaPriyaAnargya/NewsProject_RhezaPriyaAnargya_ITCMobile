import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniprojectitc/form/custom_text_form_field.dart';
import 'package:miniprojectitc/routes/app_routes_named.dart';
import 'package:miniprojectitc/service/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ListView(
            children: [
              Center(
                child: Container(
                  width: 352,
                  height: 330,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/login.png'),
                    ),
                  ),
                ),
              ),
              CustomTextFormField(
                controller: _emailController,
                label: "Email",
              ),
              CustomTextFormField(
                controller: _passwordController,
                label: "Password",
              ),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Color(0xff3498DB),
                  ),
                  onPressed: () async {
                    final email = _emailController.text.trim();
                    final password = _passwordController.text.trim();

                    if (email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Email dan password tidak boleh kosong'),
                        ),
                      );
                      return;
                    }
                    AuthService().signInWithEmailAndPassword(
                      email: email,
                      password: password,
                      context: context,
                    ).then((user) {
                      if (user != null) {
                        // Berhasil login, pindah ke halaman home
                        Get.offNamed(AppRoutesNamed.buttomNavBar);
                      }
                    });
                  },
                  child: Text(
                    'Masuk',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum punya akun? ',
                    style: TextStyle(color: Color(0xffC0C0C0)),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutesNamed.register);
                    },
                    child: Text(
                      'Mendaftar sekarang',
                      style: TextStyle(color: Color(0xff3498DB)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
