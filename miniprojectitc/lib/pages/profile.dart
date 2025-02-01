import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:miniprojectitc/routes/app_routes_named.dart'; // Jika menggunakan Get untuk navigasi

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Mendapatkan user saat ini
  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              Text(
                'Sedang login sebagai:',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                currentUser?.email ?? 'Tidak ada email', 
                style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut(); 
                  Get.offAllNamed(AppRoutesNamed.hero); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, 
                  foregroundColor: Colors.white, 
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
