import 'dart:convert';

import 'package:http/http.dart' as http;

class AiService {
  static const String apiKey =
  String.fromEnvironment('OPENROUTER_API_KEY');

  static Future<String> generateItinerary({
    required String destination,
    required String budget,
    required int days,
    required String interest,
  }) async {
    if (apiKey.isEmpty) {
      throw Exception(
        'OpenRouter API key not found. '
            'Run the app with --dart-define=OPENROUTER_API_KEY=...',
      );
    }

    final prompt = '''
You are Tripora, an AI travel planning assistant.

Create a personalized travel itinerary for:

Destination: $destination
Budget: $budget
Number of days: $days
Main interest: $interest

Create exactly $days days.

For each day include:

Day 1
Morning:
Afternoon:
Evening:

Day 2
Morning:
Afternoon:
Evening:

Continue until all $days days are completed.

Also provide:

Estimated Total Trip Expense:
- Give an approximate total cost in Indian Rupees (INR).
- Keep the estimate suitable for the selected budget level.

Important rules:
- Do NOT include food or restaurant recommendations.
- Do NOT invent impossible activities.
- Keep the itinerary practical and realistic.
- Consider the selected interest.
- Keep each activity simple and easy to understand.
- Do not include unnecessary explanations.
- Return only the itinerary and estimated expense.
''';

    final url = Uri.parse(
      'https://openrouter.ai/api/v1/chat/completions',
    );

    final requestBody = jsonEncode({
      'model': 'openrouter/free',
      'messages': [
        {
          'role': 'user',
          'content': prompt,
        },
      ],
    });

    for (int attempt = 1; attempt <= 3; attempt++) {
      try {
        final response = await http
            .post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $apiKey',
            'HTTP-Referer': 'https://tripora.app',
            'X-Title': 'Tripora AI Travel Planner',
          },
          body: requestBody,
        )
            .timeout(
          const Duration(seconds: 60),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);

          final content =
          data['choices']?[0]?['message']?['content'];

          if (content != null &&
              content.toString().trim().isNotEmpty) {
            return content.toString();
          }

          throw Exception(
            'AI returned an empty response.',
          );
        }

        if ((response.statusCode == 429 ||
            response.statusCode >= 500) &&
            attempt < 3) {
          await Future.delayed(
            Duration(seconds: attempt * 2),
          );

          continue;
        }

        throw Exception(
          'OpenRouter request failed: '
              '${response.statusCode}\n${response.body}',
        );
      } catch (e) {
        if (attempt < 3) {
          await Future.delayed(
            Duration(seconds: attempt * 2),
          );

          continue;
        }

        throw Exception(
          'Unable to generate trip.\n$e',
        );
      }
    }

    throw Exception(
      'AI request failed after multiple attempts.',
    );
  }
}