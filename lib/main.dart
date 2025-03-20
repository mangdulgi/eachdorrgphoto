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
        List.generate(120, (index) => 'images/week${index + 1}.jpg');

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('도르륵 상품목록'),
            const SizedBox(width: 10),
            Image.asset(
              'images/logo.png',
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
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FullScreenImage(imagePath: path),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: Image.asset(
                        path,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(child: Text('이미지를 불러올 수 없습니다!')),
                      ),
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

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child: Image.asset(imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Center(child: Text('이미지를 불러올 수 없습니다!', style: TextStyle(color: Colors.white)))),
        ),
      ),
    );
  }
}
