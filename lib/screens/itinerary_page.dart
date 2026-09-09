import 'package:flutter/material.dart';

class ItineraryPage extends StatelessWidget {

  final String destination;
  final String budget;
  final int days;
  final String interest;

  const ItineraryPage({
    super.key,
    required this.destination,
    required this.budget,
    required this.days,
    required this.interest,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Your Trip'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              '$destination Trip',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              '$days Days • $budget • $interest',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Your Itinerary',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Day 1',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              '📍 Explore popular places',
              style: TextStyle(fontSize: 17),
            ),

            const SizedBox(height: 10),

            const Text(
              '🌅 Enjoy the local attractions',
              style: TextStyle(fontSize: 17),
            ),

            const SizedBox(height: 30),

            const Text(
              'More itinerary will be generated here soon.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}