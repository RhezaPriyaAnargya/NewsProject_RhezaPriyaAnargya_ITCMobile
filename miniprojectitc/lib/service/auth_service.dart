import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Membuat user baru di Firebase
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Memeriksa apakah userCredential.user tidak null
      if (userCredential.user != null) {
        // Menampilkan pesan berhasil
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
            content: Text('Berhasil Daftar Silahkan Login'),
          ),
        );
        return userCredential.user; // Mengembalikan user
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Terjadi kesalahan. Silakan coba lagi.'),
        ),
      );
        return null;
      }
    } on FirebaseAuthException catch (err) {
      // Menangani error dan menampilkan pesan kesalahan
      if (err.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Format email salah. Pastikan email memiliki "@"'),
        ),
      );
      } else if (err.code == 'email-already-in-use') {  
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Email sudah terdaftar '),
        ),
      );
      } else if(err.code == 'weak-password'){
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Password is to weak'),
        ),
      );
      }
      return null;
    }
  }


 //LOGIN
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Memeriksa apakah userCredential.user tidak null
      if (userCredential.user != null) {
        // Menampilkan pesan berhasil
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
            content: Text('Berhasil Login'),
          ),
        );
        return userCredential.user; // Mengembalikan user
      } else {
        return null;
      }
    } on FirebaseAuthException catch (err) {
      // Menangani error dan menampilkan pesan kesalahan

    if (err.code == 'user-not-found') {  
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('User tidak ditemukan'),
        ),
      );
      } else if(err.code == 'invalid-email'){
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Email Salah'),
        ),
      );
      }else if(err.code == 'wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Password Salah'),
        ),
      );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Password salah'),
        ),
      );
      }
      return null;
    }
  }



}
