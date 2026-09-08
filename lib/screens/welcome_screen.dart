import 'package:flutter/material.dart';
import 'trip_details_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),

          child: Column(
            children: [

              const Spacer(),

              // Logo
              Container(
                width: 110,
                height: 110,

                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  shape: BoxShape.circle,
                ),

                child: Icon(
                  Icons.flight_takeoff_rounded,
                  size: 55,
                  color: Colors.blue.shade700,
                ),
              ),

              const SizedBox(height: 28),

              // App Name
              const Text(
                'TRIPORA',

                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),

              const SizedBox(height: 12),

              // Tagline
              Text(
                'Your AI-Powered Travel Planner',

                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
                ),
              ),

              const SizedBox(height: 16),

              // Description
              Text(
                'Plan smarter, discover amazing places, '
                    'and create personalized trips with AI.',

                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: Colors.grey.shade600,
                ),
              ),

              const Spacer(),

              // Start Planning Button
              SizedBox(
                width: double.infinity,
                height: 56,

                child: ElevatedButton.icon(

                  onPressed: () {

                    // Open Trip Details page
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) {
                          return const TripDetailsScreen();
                        },
                      ),
                    );

                  },

                  icon: const Icon(
                    Icons.explore_rounded,
                  ),

                  label: const Text(
                    'Start Planning',

                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Bottom Text
              Text(
                'Plan your journey. Make memories.',

                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}