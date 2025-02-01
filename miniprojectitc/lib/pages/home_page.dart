import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:miniprojectitc/controller/news_controller.dart';
import 'package:miniprojectitc/routes/app_routes_named.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan controller
    var newsC = Get.put(NewsController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'ITC NEWS',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              // Memanfaatkan GetBuilder untuk update UI berdasarkan data yang diambil
              GetBuilder<NewsController>(
                init: newsC,
                builder: (_) {
                  // Jika sedang loading, tampilkan indikator loading
                  if (newsC.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // Mengambil data gambar dari news untuk carousel
                  final List<String?> carouselImages = newsC.carouselImages;

                  // Jika tidak ada gambar, tampilkan pesan
                  if (carouselImages.isEmpty) {
                    return const Center(child: Text('No images available for carousel'));
                  }

                  // Carousel Slider
                  return Column(
                    children: [
                      CarouselSlider(
                        items: carouselImages
                            .map(
                              (imageUrl) => Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(imageUrl!),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                          height: 200,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.9,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
              // Section Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest News',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // News List
              GetBuilder<NewsController>(
                init: newsC,
                builder: (_) {
                  // Jika loading, tampilkan CircularProgressIndicator
                  if (newsC.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (newsC.news.isEmpty) {
                    return const Center(
                      child: Text(
                        'Tidak ada berita',
                        style: TextStyle(fontSize: 14),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: newsC.news.length,
                    itemBuilder: (context, index) {
                      var news = newsC.news[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          leading: news.urlToImage != null
                              ? Image.network(
                                  news.urlToImage!,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(
                                  Icons.image,
                                  size: 60,
                                  color: Colors.grey,
                                ),
                          title: Text(
                            news.title ?? 'No Title',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            news.description ?? 'No Description',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                          onTap: () {
                            Get.toNamed(AppRoutesNamed.detail, arguments: news);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
