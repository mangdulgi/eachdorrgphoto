import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhotoGallery(),
    );
  }
}

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> photoPaths =
        List.generate(120, (index) => 'image/week${index + 1}.jpg');

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('도르륵 상품 목록'),
            const SizedBox(width: 10),
            Image.network(
              'image/logo.png',
              width: 50,
              height: 50,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image_not_supported),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: photoPaths.map((path) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 300,
                    height: 300,
                    color: Colors.grey[200],
                    child: Image.network(
                      path,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Text('이미지를 불러올 수 없습니다!')),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
