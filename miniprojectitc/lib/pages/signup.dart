import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniprojectitc/form/custom_text_form_field.dart';
import 'package:miniprojectitc/routes/app_routes_named.dart';
import 'package:miniprojectitc/service/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
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
                      image: AssetImage('assets/signup.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              CustomTextFormField(
                  controller: _emailController, label: "Masukkan Email"),
              CustomTextFormField(
                  controller: _passwordController, label: "Masukkan Password"),
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
                    AuthService()
                        .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                            context: context)
                        .then((user) {
                      if (user != null) {
                        Get.offNamed(AppRoutesNamed.login);
                      }
                    });
                  },
                  child: Text(
                    'Mendaftar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya akun? silahkan ',
                    style: TextStyle(color: Color(0xffC0C0C0)),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutesNamed.login);
                    },
                    child: Text(
                      'Masuk',
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
