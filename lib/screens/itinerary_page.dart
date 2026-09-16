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
      body: SingleChildScrollView(
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

            const SizedBox(height: 8),

            Text(
              '$days Days • $budget • $interest',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Your Personalized Itinerary',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            for (int day = 1; day <= days; day++)
              _buildDayCard(day),

            const Divider(),

            const SizedBox(height: 20),

            const Text(
              'Expense Breakdown',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            _buildExpenseRow(
              '🚗 Travel',
              '₹${_getTravelExpense()}',
            ),

            _buildExpenseRow(
              '🏨 Stay',
              '₹${_getStayExpense()}',
            ),

            _buildExpenseRow(
              '🎟️ Activities',
              '₹${_getActivityExpense()}',
            ),

            const Divider(),

            const SizedBox(height: 10),

            Text(
              '💰 Estimated Total: ₹${_getTotalExpense()}',
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Trip Summary',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              '📍 Destination: $destination',
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),

            Text(
              '📅 Duration: $days Days',
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),

            Text(
              '💰 Budget: $budget',
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),

            Text(
              '🎯 Interest: $interest',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayCard(int day) {
    String morning;
    String afternoon;
    String evening;

    String place = destination.trim().toLowerCase();
    String selectedInterest = interest.trim().toLowerCase();

    // DELHI
    if (place == 'delhi') {
      if (selectedInterest == 'culture') {
        if (day == 1) {
          morning = 'Explore the Red Fort and learn about Mughal history.';
          afternoon = 'Visit Humayun’s Tomb and explore the heritage complex.';
          evening = 'Walk around Connaught Place and experience Delhi culture.';
        } else if (day == 2) {
          morning = 'Visit Qutub Minar and explore the historical monuments.';
          afternoon = 'Explore India Gate and nearby historical areas.';
          evening = 'Visit Lodhi Garden and enjoy the historic surroundings.';
        } else {
          morning = 'Visit Lotus Temple and explore its unique architecture.';
          afternoon = 'Explore Akshardham and its cultural attractions.';
          evening = 'Explore Old Delhi and experience local culture.';
        }
      } else if (selectedInterest == 'nature') {
        if (day == 1) {
          morning = 'Visit Lodhi Garden and enjoy the greenery.';
          afternoon = 'Relax around India Gate and its open surroundings.';
          evening = 'Enjoy an evening walk through Delhi gardens.';
        } else if (day == 2) {
          morning = 'Explore Lodhi Garden and its green spaces.';
          afternoon = 'Spend relaxing time around nearby parks.';
          evening = 'Enjoy a peaceful evening outdoors.';
        } else {
          morning = 'Visit a local garden and enjoy nature.';
          afternoon = 'Relax in a green public area.';
          evening = 'Take an evening nature walk.';
        }
      } else if (selectedInterest == 'shopping') {
        if (day == 1) {
          morning = 'Explore Chandni Chowk and its famous markets.';
          afternoon = 'Shop around Old Delhi markets.';
          evening = 'Explore Connaught Place for shopping and local brands.';
        } else if (day == 2) {
          morning = 'Visit Sarojini Nagar Market.';
          afternoon = 'Explore Janpath Market and nearby shops.';
          evening = 'Enjoy shopping around Connaught Place.';
        } else {
          morning = 'Explore Dilli Haat for handicrafts and local products.';
          afternoon = 'Shop for souvenirs and traditional items.';
          evening = 'Enjoy an evening shopping experience.';
        }
      } else if (selectedInterest == 'adventure') {
        if (day == 1) {
          morning = 'Explore Delhi by walking through Old Delhi streets.';
          afternoon = 'Try an exciting city exploration around Red Fort.';
          evening = 'Take an evening city walk around Connaught Place.';
        } else if (day == 2) {
          morning = 'Explore Qutub Minar and its surrounding area.';
          afternoon = 'Take a walking tour around historical Delhi.';
          evening = 'Explore Delhi streets and local attractions.';
        } else {
          morning = 'Explore a new area of Delhi on foot.';
          afternoon = 'Try local sightseeing activities.';
          evening = 'Enjoy an evening city exploration.';
        }
      } else {
        if (day == 1) {
          morning = 'Visit India Gate and explore the surrounding area.';
          afternoon = 'Explore the Red Fort and learn about Delhi history.';
          evening = 'Enjoy an evening walk at Connaught Place.';
        } else if (day == 2) {
          morning = 'Visit Qutub Minar and explore the historical complex.';
          afternoon = 'Explore Humayun’s Tomb and nearby attractions.';
          evening = 'Relax at Lodhi Garden.';
        } else {
          morning = 'Visit Lotus Temple and explore the nearby area.';
          afternoon = 'Explore Akshardham and its surroundings.';
          evening = 'Enjoy shopping around Delhi.';
        }
      }
    }

    // JAIPUR
    else if (place == 'jaipur') {
      if (selectedInterest == 'culture') {
        if (day == 1) {
          morning = 'Explore Amber Fort and learn about Jaipur history.';
          afternoon = 'Visit City Palace and explore royal architecture.';
          evening = 'Visit Hawa Mahal and explore the old city.';
        } else if (day == 2) {
          morning = 'Explore Jantar Mantar and its historical instruments.';
          afternoon = 'Visit Albert Hall Museum.';
          evening = 'Explore Jaipur’s traditional markets.';
        } else {
          morning = 'Visit Nahargarh Fort and enjoy its historical setting.';
          afternoon = 'Explore Jaipur heritage areas.';
          evening = 'Experience local Rajasthani culture.';
        }
      } else if (selectedInterest == 'nature') {
        if (day == 1) {
          morning = 'Visit Jal Mahal and enjoy the lake surroundings.';
          afternoon = 'Explore the gardens near Amber Fort.';
          evening = 'Enjoy the sunset around Jal Mahal.';
        } else if (day == 2) {
          morning = 'Visit Ram Niwas Garden.';
          afternoon = 'Relax in Jaipur’s green spaces.';
          evening = 'Enjoy a peaceful evening outdoors.';
        } else {
          morning = 'Visit Nahargarh hills and enjoy the natural views.';
          afternoon = 'Explore scenic areas around Jaipur.';
          evening = 'Enjoy sunset views over the city.';
        }
      } else if (selectedInterest == 'shopping') {
        if (day == 1) {
          morning = 'Explore Johari Bazaar for traditional jewellery.';
          afternoon = 'Shop around Bapu Bazaar.';
          evening = 'Explore the old city markets.';
        } else if (day == 2) {
          morning = 'Visit local handicraft markets.';
          afternoon = 'Shop for traditional Rajasthani products.';
          evening = 'Explore Jaipur night shopping areas.';
        } else {
          morning = 'Explore local textile and handicraft shops.';
          afternoon = 'Buy souvenirs from Jaipur markets.';
          evening = 'Enjoy an evening market walk.';
        }
      } else if (selectedInterest == 'adventure') {
        if (day == 1) {
          morning = 'Explore Amber Fort and its surrounding hills.';
          afternoon = 'Take an active walking tour around the fort.';
          evening = 'Enjoy the city views from Jaipur.';
        } else if (day == 2) {
          morning = 'Explore Nahargarh Fort area.';
          afternoon = 'Walk through Jaipur’s historic streets.';
          evening = 'Enjoy an evening city exploration.';
        } else {
          morning = 'Explore the hills around Jaipur.';
          afternoon = 'Try outdoor sightseeing activities.';
          evening = 'Enjoy sunset views from the city hills.';
        }
      } else {
        if (day == 1) {
          morning = 'Visit Amber Fort and explore the palace.';
          afternoon = 'Visit Jal Mahal and enjoy the surroundings.';
          evening = 'Visit Hawa Mahal and explore the old city.';
        } else if (day == 2) {
          morning = 'Explore City Palace.';
          afternoon = 'Visit Jantar Mantar.';
          evening = 'Explore local markets.';
        } else {
          morning = 'Visit Nahargarh Fort.';
          afternoon = 'Explore Albert Hall Museum.';
          evening = 'Enjoy the local atmosphere.';
        }
      }
    }

    // UDAIPUR
    else if (place == 'udaipur') {
      if (selectedInterest == 'nature') {
        if (day == 1) {
          morning = 'Enjoy the views around Lake Pichola.';
          afternoon = 'Take a peaceful boat ride on Lake Pichola.';
          evening = 'Watch the sunset near the lake.';
        } else if (day == 2) {
          morning = 'Visit Fateh Sagar Lake.';
          afternoon = 'Explore the green surroundings of Udaipur.';
          evening = 'Enjoy the lakeside atmosphere.';
        } else {
          morning = 'Visit Saheliyon-ki-Bari gardens.';
          afternoon = 'Relax around the city lakes.';
          evening = 'Enjoy a peaceful evening by the water.';
        }
      } else if (selectedInterest == 'culture') {
        if (day == 1) {
          morning = 'Explore City Palace and its royal history.';
          afternoon = 'Visit Jagdish Temple and nearby heritage areas.';
          evening = 'Enjoy a cultural evening around Lake Pichola.';
        } else if (day == 2) {
          morning = 'Visit Sajjangarh Monsoon Palace.';
          afternoon = 'Explore traditional architecture.';
          evening = 'Experience local Rajasthani culture.';
        } else {
          morning = 'Visit Bagore Ki Haveli.';
          afternoon = 'Explore old Udaipur streets.';
          evening = 'Enjoy traditional cultural activities.';
        }
      } else if (selectedInterest == 'shopping') {
        if (day == 1) {
          morning = 'Explore markets near City Palace.';
          afternoon = 'Shop for traditional Rajasthani products.';
          evening = 'Explore local handicraft shops.';
        } else if (day == 2) {
          morning = 'Visit Hathi Pol Market.';
          afternoon = 'Shop for handicrafts and souvenirs.';
          evening = 'Explore local markets.';
        } else {
          morning = 'Explore Udaipur street markets.';
          afternoon = 'Shop for traditional items.';
          evening = 'Enjoy an evening market walk.';
        }
      } else {
        if (day == 1) {
          morning = 'Visit City Palace and explore the royal complex.';
          afternoon = 'Visit Jagdish Temple and nearby attractions.';
          evening = 'Enjoy a boat ride on Lake Pichola.';
        } else if (day == 2) {
          morning = 'Visit Sajjangarh Monsoon Palace.';
          afternoon = 'Relax around Fateh Sagar Lake.';
          evening = 'Enjoy the lakeside atmosphere.';
        } else {
          morning = 'Visit Saheliyon-ki-Bari.';
          afternoon = 'Explore Bagore Ki Haveli.';
          evening = 'Enjoy beautiful lake views.';
        }
      }
    }

    // AHMEDABAD
    else if (place == 'ahmedabad') {
      if (selectedInterest == 'culture') {
        if (day == 1) {
          morning = 'Visit Sabarmati Ashram and learn about its history.';
          afternoon = 'Explore Ahmedabad heritage areas.';
          evening = 'Walk through the old city.';
        } else if (day == 2) {
          morning = 'Visit Adalaj Stepwell.';
          afternoon = 'Explore historic architecture.';
          evening = 'Visit traditional markets.';
        } else {
          morning = 'Explore Ahmedabad heritage streets.';
          afternoon = 'Visit historical landmarks.';
          evening = 'Experience local city culture.';
        }
      } else if (selectedInterest == 'nature') {
        if (day == 1) {
          morning = 'Enjoy a peaceful walk along Sabarmati Riverfront.';
          afternoon = 'Relax in the Riverfront gardens.';
          evening = 'Enjoy the sunset near the river.';
        } else if (day == 2) {
          morning = 'Visit Kankaria Lake.';
          afternoon = 'Enjoy the lake surroundings.';
          evening = 'Take an evening walk around Kankaria.';
        } else {
          morning = 'Visit a city garden.';
          afternoon = 'Relax in green public spaces.';
          evening = 'Enjoy an outdoor evening.';
        }
      } else if (selectedInterest == 'shopping') {
        if (day == 1) {
          morning = 'Explore Law Garden Market.';
          afternoon = 'Shop for traditional Gujarati items.';
          evening = 'Explore local street markets.';
        } else if (day == 2) {
          morning = 'Visit Manek Chowk area.';
          afternoon = 'Explore local shopping streets.';
          evening = 'Shop for souvenirs and handicrafts.';
        } else {
          morning = 'Explore major shopping areas of Ahmedabad.';
          afternoon = 'Visit local markets.';
          evening = 'Enjoy an evening shopping walk.';
        }
      } else {
        if (day == 1) {
          morning = 'Visit Sabarmati Ashram.';
          afternoon = 'Visit Adalaj Stepwell.';
          evening = 'Enjoy Sabarmati Riverfront.';
        } else if (day == 2) {
          morning = 'Visit Kankaria Lake.';
          afternoon = 'Explore Auto World Vintage Car Museum.';
          evening = 'Explore local markets.';
        } else {
          morning = 'Visit Atal Bridge.';
          afternoon = 'Explore the old city heritage area.';
          evening = 'Enjoy Ahmedabad city life.';
        }
      }
    }

    // GOA
    else if (place == 'goa') {
      if (selectedInterest == 'beach') {
        if (day == 1) {
          morning = 'Relax at Baga Beach.';
          afternoon = 'Enjoy water activities around Baga.';
          evening = 'Watch the sunset at the beach.';
        } else if (day == 2) {
          morning = 'Visit Calangute Beach.';
          afternoon = 'Enjoy beach activities and relaxation.';
          evening = 'Spend the evening near the sea.';
        } else {
          morning = 'Visit Candolim Beach.';
          afternoon = 'Relax by the Arabian Sea.';
          evening = 'Enjoy a peaceful beach sunset.';
        }
      } else if (selectedInterest == 'nature') {
        if (day == 1) {
          morning = 'Explore the natural surroundings of Goa.';
          afternoon = 'Relax near Baga Beach.';
          evening = 'Enjoy the beach sunset.';
        } else if (day == 2) {
          morning = 'Explore the coastal scenery near Calangute.';
          afternoon = 'Enjoy the natural surroundings.';
          evening = 'Walk along the beach.';
        } else {
          morning = 'Visit Candolim Beach.';
          afternoon = 'Explore Goa’s coastal scenery.';
          evening = 'Enjoy the sunset near the sea.';
        }
      } else if (selectedInterest == 'culture') {
        if (day == 1) {
          morning = 'Explore Old Goa and its historic churches.';
          afternoon = 'Visit Basilica of Bom Jesus.';
          evening = 'Explore Panjim’s heritage areas.';
        } else if (day == 2) {
          morning = 'Explore Panjim and Portuguese-influenced architecture.';
          afternoon = 'Visit historic areas of Goa.';
          evening = 'Experience local Goan culture.';
        } else {
          morning = 'Visit Fort Aguada.';
          afternoon = 'Explore nearby historic locations.';
          evening = 'Enjoy the cultural atmosphere of Goa.';
        }
      } else if (selectedInterest == 'shopping') {
        if (day == 1) {
          morning = 'Explore local markets in North Goa.';
          afternoon = 'Shop for souvenirs and handicrafts.';
          evening = 'Visit nearby shopping areas.';
        } else if (day == 2) {
          morning = 'Explore Panjim markets.';
          afternoon = 'Shop for local products.';
          evening = 'Enjoy an evening market walk.';
        } else {
          morning = 'Explore Goa shopping streets.';
          afternoon = 'Buy local souvenirs.';
          evening = 'Enjoy evening shopping.';
        }
      } else if (selectedInterest == 'adventure') {
        if (day == 1) {
          morning = 'Try water activities at Baga Beach.';
          afternoon = 'Explore the coastline.';
          evening = 'Enjoy a beach evening.';
        } else if (day == 2) {
          morning = 'Explore Goa’s coastal areas.';
          afternoon = 'Try outdoor activities.';
          evening = 'Enjoy an active beach evening.';
        } else {
          morning = 'Explore Fort Aguada and the surrounding area.';
          afternoon = 'Explore the Goa coastline.';
          evening = 'Enjoy an outdoor evening near the beach.';
        }
      } else {
        if (day == 1) {
          morning = 'Visit Baga Beach.';
          afternoon = 'Explore Calangute Beach.';
          evening = 'Enjoy a beach sunset.';
        } else if (day == 2) {
          morning = 'Visit Basilica of Bom Jesus.';
          afternoon = 'Explore Panjim.';
          evening = 'Enjoy the Mandovi River area.';
        } else {
          morning = 'Visit Fort Aguada.';
          afternoon = 'Relax at Candolim Beach.';
          evening = 'Enjoy a beach evening.';
        }
      }
    }

    // OTHER DESTINATIONS
    else {
      if (selectedInterest == 'nature') {
        morning = 'Explore natural attractions in $destination.';
        afternoon = 'Enjoy outdoor and scenic places.';
        evening = 'Relax and enjoy the natural surroundings.';
      } else if (selectedInterest == 'adventure') {
        morning = 'Try adventure activities in $destination.';
        afternoon = 'Explore outdoor attractions.';
        evening = 'Enjoy an exciting evening activity.';
      } else if (selectedInterest == 'culture') {
        morning = 'Explore cultural and historical places in $destination.';
        afternoon = 'Visit local heritage attractions.';
        evening = 'Experience the local culture.';
      } else if (selectedInterest == 'beach') {
        morning = 'Visit popular beaches or waterfront areas.';
        afternoon = 'Enjoy water and beach activities.';
        evening = 'Watch the sunset near the water.';
      } else {
        morning = 'Explore popular shopping areas in $destination.';
        afternoon = 'Visit local markets and shops.';
        evening = 'Enjoy an evening shopping walk.';
      }
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Day $day',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 18),

            _buildActivity(
              '🌅',
              'Morning',
              morning,
            ),

            const SizedBox(height: 18),

            _buildActivity(
              '☀️',
              'Afternoon',
              afternoon,
            ),

            const SizedBox(height: 18),

            _buildActivity(
              '🌆',
              'Evening',
              evening,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivity(
      String emoji,
      String title,
      String description,
      ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          emoji,
          style: const TextStyle(fontSize: 25),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                description,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExpenseRow(
      String title,
      String amount,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),

          Text(
            amount,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  int _getTravelExpense() {
    if (budget == 'Budget') {
      return 1000 + (days * 300);
    } else if (budget == 'Moderate') {
      return 2000 + (days * 500);
    } else {
      return 5000 + (days * 1000);
    }
  }

  int _getStayExpense() {
    if (budget == 'Budget') {
      return days * 800;
    } else if (budget == 'Moderate') {
      return days * 1500;
    } else {
      return days * 3500;
    }
  }

  int _getActivityExpense() {
    if (budget == 'Budget') {
      return days * 300;
    } else if (budget == 'Moderate') {
      return days * 700;
    } else {
      return days * 1500;
    }
  }

  int _getTotalExpense() {
    return _getTravelExpense() +
        _getStayExpense() +
        _getActivityExpense();
  }
}