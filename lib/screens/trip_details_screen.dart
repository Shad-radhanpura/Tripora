import 'package:flutter/material.dart';

class TripDetailsScreen extends StatefulWidget {
  const TripDetailsScreen({super.key});

  @override
  State<TripDetailsScreen> createState() {
    return _TripDetailsScreenState();
  }
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {

  String budget = 'Moderate';

  int days = 3;

  String interest = 'Nature';


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Trip Details'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              'Plan Your Trip',

              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Enter a few details about your trip.',

              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),


            // Destination

            const Text(
              'Destination',

              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(

              decoration: InputDecoration(
                hintText: 'Example: Ahmedabad',

                border: OutlineInputBorder(),
              ),
            ),


            const SizedBox(height: 25),


            // Budget

            const Text(
              'Budget',

              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            DropdownButton<String>(

              value: budget,

              items: const [

                DropdownMenuItem(
                  value: 'Budget',
                  child: Text('Budget'),
                ),

                DropdownMenuItem(
                  value: 'Moderate',
                  child: Text('Moderate'),
                ),

                DropdownMenuItem(
                  value: 'Luxury',
                  child: Text('Luxury'),
                ),
              ],

              onChanged: (value) {

                setState(() {
                  budget = value!;
                });

              },
            ),


            const SizedBox(height: 20),


            // Number of Days

            const Text(
              'Number of Days',

              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            Row(
              children: [

                IconButton(

                  onPressed: () {

                    if (days > 1) {

                      setState(() {
                        days--;
                      });

                    }

                  },

                  icon: const Icon(Icons.remove),
                ),


                Text(
                  '$days Days',

                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),


                IconButton(

                  onPressed: () {

                    setState(() {
                      days++;
                    });

                  },

                  icon: const Icon(Icons.add),
                ),
              ],
            ),


            const SizedBox(height: 20),


            // Interest

            const Text(
              'Interest',

              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            DropdownButton<String>(

              value: interest,

              items: const [

                DropdownMenuItem(
                  value: 'Nature',
                  child: Text('Nature'),
                ),

                DropdownMenuItem(
                  value: 'Adventure',
                  child: Text('Adventure'),
                ),

                DropdownMenuItem(
                  value: 'Culture',
                  child: Text('Culture'),
                ),

                DropdownMenuItem(
                  value: 'Beach',
                  child: Text('Beach'),
                ),

                DropdownMenuItem(
                  value: 'Shopping',
                  child: Text('Shopping'),
                ),
              ],

              onChanged: (value) {

                setState(() {
                  interest = value!;
                });

              },
            ),


            const Spacer(),


            // Generate Button

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(

                onPressed: () {

                  // We will add AI here later.

                },

                child: const Text(
                  'Generate My Trip',

                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}