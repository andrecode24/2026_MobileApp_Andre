import 'package:flutter/material.dart';

// DATA_MODEL
class Painting {
  final String title;
  final String artist;
  final String imageUrl;

  const Painting({
    required this.title,
    required this.artist,
    required this.imageUrl,
  });
}

// Initial UI data, initialized when constructing the data model.
final List<Painting> famousPaintings = const [
  Painting(
    title: 'The Starry Night',
    artist: 'Vincent van Gogh',
    imageUrl: 'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
  ),
  Painting(
    title: 'Mona Lisa',
    artist: 'Leonardo da Vinci',
    imageUrl: 'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
  ),
  Painting(
    title: 'The Last Supper',
    artist: 'Leonardo da Vinci',
    imageUrl: 'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
  ),
  Painting(
    title: 'Girl with a Pearl Earring',
    artist: 'Johannes Vermeer',
    imageUrl: 'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
  ),
  Painting(
    title: 'The Persistence of Memory',
    artist: 'Salvador Dalí',
    imageUrl: 'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
  ),
  Painting(
    title: 'Guernica',
    artist: 'Pablo Picasso',
    imageUrl: 'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
  ),
  Painting(
    title: 'The Scream',
    artist: 'Edvard Munch',
    imageUrl: 'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
  ),
  Painting(
    title: 'The Great Wave off Kanagawa',
    artist: 'Katsushika Hokusai',
    imageUrl: 'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
  ),
  Painting(
    title: 'Whistler\'s Mother',
    artist: 'James McNeill Whistler',
    imageUrl: 'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
  ),
];

void main() {
  runApp(const PaintingsApp());
}

class PaintingsApp extends StatelessWidget {
  const PaintingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Famous Historic Paintings',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PaintingsHomePage(),
    );
  }
}

class PaintingsHomePage extends StatelessWidget {
  const PaintingsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Famous Historic Paintings'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: famousPaintings.length,
        itemBuilder: (BuildContext context, int index) {
          final Painting painting = famousPaintings[index];
          return PaintingCard(painting: painting);
        },
      ),
    );
  }
}

class PaintingCard extends StatelessWidget {
  final Painting painting;

  const PaintingCard({
    required this.painting,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                painting.imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: Center(
                      child: Icon(Icons.broken_image, color: Colors.grey[600], size: 50),
                    ),
                  );
                },
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              painting.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8.0),
            Text(
              painting.artist,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}