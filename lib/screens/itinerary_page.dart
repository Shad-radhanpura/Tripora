import 'package:flutter/material.dart';

class ItineraryPage extends StatelessWidget {
  final String destination;
  final String budget;
  final int days;
  final String interest;
  final String aiItinerary;

  const ItineraryPage({
    super.key,
    required this.destination,
    required this.budget,
    required this.days,
    required this.interest,
    required this.aiItinerary,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$destination Trip'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Trip information
            Text(
              '$days Days • $budget • $interest',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Your AI Personalized Itinerary',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // AI response
            Card(
              elevation: 2,

              child: Padding(
                padding: const EdgeInsets.all(18),

                child: Text(
                  aiItinerary,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Trip summary
            const Text(
              'Trip Summary',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    _summaryRow(
                      'Destination',
                      destination,
                    ),

                    _summaryRow(
                      'Duration',
                      '$days Days',
                    ),

                    _summaryRow(
                      'Budget',
                      budget,
                    ),

                    _summaryRow(
                      'Interest',
                      interest,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(
            width: 100,

            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}