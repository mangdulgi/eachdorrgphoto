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
    // ✅ 갤러리에 표시할 이미지 리스트
    List<String> photoPaths = List.generate(30, (index) => 'images/week${index + 1}.jpg');

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('도르륵 상품목록'),  // ✅ 제목
            const SizedBox(width: 1), // ✅ 간격 추가
            Image.network(
              'images/logo.png',  // ✅ 제목 옆 작은 이미지
              width: 100,
              height: 100,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Wrap(
              spacing: 10, // 이미지 간격
              runSpacing: 10, // 줄 간격
              alignment: WrapAlignment.center,
              children: photoPaths.map((path) {
                return SizedBox(
                  width: 300, // 각 이미지의 너비
                  height: 200, // 각 이미지의 높이
                  child: Image.network(
                    path,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const Text('이미지를 불러올 수 없습니다!'),
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
