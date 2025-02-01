import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miniprojectitc/routes/app_routes_named.dart';


class HeroPage extends StatelessWidget {
  const HeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 86),
                  width: double.infinity,
                  height: 230,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/gambar.jpg'),
                    ),
                  ),
                ),
                const SizedBox(height: 37),
                Text(
                  'Yuk, Membaca Bersama ITC News',
                  style: GoogleFonts.arimo(
                      fontSize: 19, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 21),
                Text(
                  'Berita TerPercaya, Di Ujung Jari Anda',
                  style: const TextStyle(fontSize: 15),
                ),
                const Spacer(),
                SizedBox(
                  height: 42,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoutesNamed.login);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3498D8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Masuk',
                      style: GoogleFonts.arimo(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 21),
                SizedBox(
                  height: 42,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoutesNamed.register);
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Color(0xff3498D8)),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Mendaftar',
                      style: GoogleFonts.arimo(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 30), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
