import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miniprojectitc/model/news_model.dart';
import 'package:get/get.dart';

class DetailNewsPage extends StatelessWidget {
  const DetailNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil objek berita dari Get.arguments
    final news = Get.arguments as NewsModel; 

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Gambar besar berita
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: news.urlToImage != null
                    ? NetworkImage(news.urlToImage!) // Gambar dari URL
                    : const AssetImage('assets/DetailNews.png')
                        as ImageProvider, // Gambar default jika URL tidak tersedia
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: <Widget>[
                // Icon panah di atas gambar
                Positioned(
                  top: 20,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors
                          .white, // Warna putih agar terlihat pada gambar gelap
                    ),
                    onPressed: () {
                      Get.back(); // Kembali ke halaman sebelumnya
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20), // Memberi jarak antara gambar dan teks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Avatar.png'),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    news.author ?? 'Unknown Author', // Nama penulis
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 20),
          // Konten berita di bawah gambar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                    height: 10), // Memberikan ruang antara kategori dan judul
                // Judul berita
                Text(
                  news.title ?? 'No Title', // Judul berita
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 5), // Memberikan ruang antara judul dan tanggal

                // Tanggal berita
                Text(
                  news.publishedAt ?? 'Unknown Date', // Tanggal berita
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                  ),
                ),

                const SizedBox(
                    height: 10), // Memberikan ruang antara tanggal dan deskripsi

                // Konten berita
                Text(
                  news.content ??
                      news.description ??
                      'No Content Available', // Deskripsi atau konten berita
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
