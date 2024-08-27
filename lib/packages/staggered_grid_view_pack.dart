import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class StaggeredGridViewPack extends StatelessWidget {
  const StaggeredGridViewPack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 20.0, height: 1.2),
          titleMedium: TextStyle(fontSize: 16.0, height: 1.2),
          titleSmall: TextStyle(fontSize: 14.0, height: 1.2),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Card Example')),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: places.length,
            itemBuilder: (context, index) {
              return cardItem(places[index], context);
            },
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0, // Spacing between columns
          ),
        ),
      ),
    );
  }

  Widget cardItem(Place place, BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image at the top
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                place.image,
                height: 100,
                width: double.infinity, // Use full width
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),

            // Title
            Text(
              place.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),

            // Address
            Text(
              place.address,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),

            // Button
            ElevatedButton(
              onPressed: () {},
              child: const Text('Button'),
            ),
          ],
        ),
      ),
    );
  }
}

// Model class for Place
class Place {
  final String image;
  final String title;
  final String address;

  Place({
    required this.image,
    required this.title,
    required this.address,
  });
}

// Sample data
List<Place> places = [
  Place(
    image:
        'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    title: 'Sunset Beach',
    address:
        'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text.',
  ),
  Place(
    image:
        'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    title: 'Mountain Retreat',
    address:
        'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a the middle of text.',
  ),
  Place(
    image:
        'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    title: 'City Lights',
    address: '789 Skyline Drive, New York',
  ),
  Place(
    image:
        'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    title: 'Desert Oasis',
    address: '321 Desert Road, Arizona',
  ),
  Place(
    image:
        'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    title: 'Forest Cabin',
    address:
        'There are many variations of passages of Lorem Ipsum available, but the majority have u are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text.',
  ),
  Place(
    image:
        'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    title: 'Riverfront Lodge',
    address:
        '987 There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, to use a passage of Lorem Ipsum,  you need to be sure there isnt anything embarrassing hidden in the middle of text., Montana',
  ),
  Place(
    image:
        'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    title: 'Countryside Villa',
    address:
        '246 Meadow Lane, Texas but the majority have u are going to use a passage ',
  ),
];
