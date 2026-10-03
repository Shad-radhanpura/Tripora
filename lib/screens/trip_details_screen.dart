import 'package:flutter/material.dart';

import '../services/ai_service.dart';
import 'itinerary_page.dart';

class TripDetailsScreen extends StatefulWidget {
  const TripDetailsScreen({super.key});

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  static const Color primary = Color(0xFF2563EB);
  static const Color secondary = Color(0xFF4F46E5);
  static const Color dark = Color(0xFF172033);
  static const Color muted = Color(0xFF667085);
  static const Color background = Color(0xFFF6F8FC);

  final TextEditingController destinationController =
  TextEditingController();

  String selectedBudget = 'Moderate';
  int selectedDays = 3;
  String selectedInterest = 'Nature';

  bool isGenerating = false;

  @override
  void dispose() {
    destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Stack(
          children: [
            _buildBackground(),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  _buildHero(),
                  _buildDestinationCard(),
                  _buildBudgetSection(),
                  _buildDaysSection(),
                  _buildInterestSection(),
                  _buildTripPreview(),
                  _buildGenerateButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // BACKGROUND
  // ============================================================

  Widget _buildBackground() {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFBFDBFE).withValues(alpha: 0.50),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 350,
            left: -120,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFE9D5FF).withValues(alpha: 0.38),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 4),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 43,
              height: 43,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color(0xFFE7EBF2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: dark,
                size: 21,
              ),
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Plan your journey',
                  style: TextStyle(
                    color: dark,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Tell Tripora what you have in mind.',
                  style: TextStyle(
                    color: muted,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 11,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF4FF),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              children: [
                Text(
                  '✨',
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(width: 4),
                Text(
                  'AI',
                  style: TextStyle(
                    color: primary,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // HERO
  // ============================================================

  Widget _buildHero() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),
          boxShadow: [
            BoxShadow(
              color: primary.withValues(alpha: 0.16),
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(27),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1469474968028-56623f02e42e',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          primary,
                          secondary,
                        ],
                      ),
                    ),
                  );
                },
              ),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      primary.withValues(alpha: 0.90),
                      secondary.withValues(alpha: 0.35),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              const Positioned(
                left: 20,
                top: 20,
                child: Text(
                  'CREATE YOUR\nPERFECT ESCAPE ✈️',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    height: 1.08,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              Positioned(
                left: 21,
                bottom: 17,
                child: Text(
                  'A personalized itinerary, made by AI.',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.88),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Positioned(
                right: 20,
                bottom: 18,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.35),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '🌍',
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // DESTINATION
  // ============================================================

  Widget _buildDestinationCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 27, 18, 0),
      child: _sectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(
              icon: '📍',
              title: 'Where are you going?',
              subtitle: 'Enter a destination you want to explore.',
            ),

            const SizedBox(height: 15),

            TextField(
              controller: destinationController,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: 'e.g. Manali, Goa, Dubai...',
                prefixIcon: Container(
                  margin: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF4FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.location_on_rounded,
                    color: primary,
                    size: 20,
                  ),
                ),
                suffixIcon: const Icon(
                  Icons.search_rounded,
                  color: muted,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // BUDGET
  // ============================================================

  Widget _buildBudgetSection() {
    final budgets = [
      (
      'Budget',
      '💰',
      'Save smart',
      const Color(0xFFE8F8EF),
      const Color(0xFF16803A),
      ),
      (
      'Moderate',
      '💳',
      'Balanced',
      const Color(0xFFEAF0FF),
      primary,
      ),
      (
      'Luxury',
      '💎',
      'Premium',
      const Color(0xFFF1EAFE),
      const Color(0xFF7E22CE),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: _sectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(
              icon: '💰',
              title: 'Choose your budget',
              subtitle: 'We will shape the trip around it.',
            ),

            const SizedBox(height: 15),

            Row(
              children: budgets.map(
                    (budget) {
                  final selected = selectedBudget == budget.$1;

                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: budget.$1 == 'Luxury' ? 0 : 9,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedBudget = budget.$1;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 103,
                          padding: const EdgeInsets.all(11),
                          decoration: BoxDecoration(
                            color: budget.$4,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: selected
                                  ? budget.$5
                                  : Colors.transparent,
                              width: 1.6,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    budget.$2,
                                    style: const TextStyle(
                                      fontSize: 23,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    budget.$1,
                                    style: TextStyle(
                                      color: budget.$5,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    budget.$3,
                                    style: const TextStyle(
                                      color: muted,
                                      fontSize: 9,
                                    ),
                                  ),
                                ],
                              ),
                              if (selected)
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: budget.$5,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // DAYS
  // ============================================================

  Widget _buildDaysSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: _sectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(
              icon: '🗓️',
              title: 'How long is your trip?',
              subtitle: 'Choose the number of days.',
            ),

            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF1E5),
                borderRadius: BorderRadius.circular(19),
              ),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.calendar_month_rounded,
                      color: Color(0xFFE05A00),
                    ),
                  ),

                  const SizedBox(width: 11),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$selectedDays ${selectedDays == 1 ? 'Day' : 'Days'}',
                          style: const TextStyle(
                            color: dark,
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Trip duration',
                          style: TextStyle(
                            color: muted,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),

                  _roundButton(
                    icon: Icons.remove_rounded,
                    onTap: () {
                      if (selectedDays > 1) {
                        setState(() {
                          selectedDays--;
                        });
                      }
                    },
                  ),

                  const SizedBox(width: 7),

                  _roundButton(
                    icon: Icons.add_rounded,
                    onTap: () {
                      if (selectedDays < 30) {
                        setState(() {
                          selectedDays++;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: const Color(0xFFE05A00),
                inactiveTrackColor:
                const Color(0xFFE05A00).withValues(alpha: 0.13),
                thumbColor: const Color(0xFFE05A00),
                overlayColor:
                const Color(0xFFE05A00).withValues(alpha: 0.10),
                trackHeight: 5,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 8,
                ),
              ),
              child: Slider(
                min: 1,
                max: 30,
                divisions: 29,
                value: selectedDays.toDouble(),
                onChanged: (value) {
                  setState(() {
                    selectedDays = value.round();
                  });
                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '1 day',
                    style: TextStyle(
                      color: muted,
                      fontSize: 9,
                    ),
                  ),
                  Text(
                    '30 days',
                    style: TextStyle(
                      color: muted,
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _roundButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 39,
        height: 39,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: dark,
          size: 19,
        ),
      ),
    );
  }

  // ============================================================
  // INTEREST
  // ============================================================

  Widget _buildInterestSection() {
    final interests = [
      (
      'Nature',
      '🏔️',
      'Mountains & greenery',
      const Color(0xFFE8F7EC),
      const Color(0xFF16803A),
      ),
      (
      'Adventure',
      '🧗',
      'Thrills & activities',
      const Color(0xFFFFF0E5),
      const Color(0xFFE05A00),
      ),
      (
      'Culture',
      '🏛️',
      'History & heritage',
      const Color(0xFFF1EAFE),
      const Color(0xFF7E22CE),
      ),
      (
      'Beach',
      '🏖️',
      'Sea & relaxation',
      const Color(0xFFE4F8FC),
      const Color(0xFF087F91),
      ),
      (
      'Shopping',
      '🛍️',
      'Markets & lifestyle',
      const Color(0xFFFFEAF3),
      const Color(0xFFC2185B),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: _sectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(
              icon: '✨',
              title: 'What are you interested in?',
              subtitle: 'Pick the experience you enjoy most.',
            ),

            const SizedBox(height: 15),

            Wrap(
              spacing: 9,
              runSpacing: 9,
              children: interests.map(
                    (interest) {
                  final selected =
                      selectedInterest == interest.$1;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedInterest = interest.$1;
                      });
                    },
                    child: AnimatedContainer(
                      duration:
                      const Duration(milliseconds: 180),
                      width: 145,
                      height: 68,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: interest.$4,
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(
                          color: selected
                              ? interest.$5
                              : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            interest.$2,
                            style: const TextStyle(
                              fontSize: 23,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Text(
                                  interest.$1,
                                  style: TextStyle(
                                    color: interest.$5,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  interest.$3,
                                  maxLines: 1,
                                  overflow:
                                  TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: muted,
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (selected)
                            Icon(
                              Icons.check_circle_rounded,
                              color: interest.$5,
                              size: 17,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // TRIP PREVIEW
  // ============================================================

  Widget _buildTripPreview() {
    final destination =
    destinationController.text.trim().isEmpty
        ? 'Your destination'
        : destinationController.text.trim();

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
      child: Container(
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFEFF4FF),
              Color(0xFFF5F1FF),
            ],
          ),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: const Color(0xFFDDE6FF),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  '✨',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 7),
                Text(
                  'YOUR TRIP PREVIEW',
                  style: TextStyle(
                    color: primary,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _previewItem(
                    Icons.location_on_rounded,
                    destination,
                  ),
                ),
                Expanded(
                  child: _previewItem(
                    Icons.calendar_today_rounded,
                    '$selectedDays days',
                  ),
                ),
                Expanded(
                  child: _previewItem(
                    Icons.favorite_rounded,
                    selectedInterest,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 9,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.70),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Row(
                children: [
                  const Text(
                    '💳',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    '$selectedBudget budget',
                    style: const TextStyle(
                      color: dark,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'AI ready',
                    style: TextStyle(
                      color: primary,
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _previewItem(
      IconData icon,
      String text,
      ) {
    return Row(
      children: [
        Icon(
          icon,
          color: primary,
          size: 16,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: dark,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // GENERATE BUTTON
  // ============================================================

  Widget _buildGenerateButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: SizedBox(
        width: double.infinity,
        height: 59,
        child: ElevatedButton(
          onPressed: isGenerating ? null : _generateTrip,
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            disabledBackgroundColor:
            primary.withValues(alpha: 0.65),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            shadowColor: primary.withValues(alpha: 0.30),
          ),
          child: isGenerating
              ? const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 21,
                height: 21,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 11),
              Text(
                'Creating your journey...',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          )
              : const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Generate My Trip',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(width: 9),
              Text(
                '✨',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.arrow_forward_rounded,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // COMMON CARD
  // ============================================================

  Widget _sectionCard({
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.94),
        borderRadius: BorderRadius.circular(23),
        border: Border.all(
          color: const Color(0xFFE8ECF3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.035),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _sectionTitle({
    required String icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 39,
          height: 39,
          decoration: BoxDecoration(
            color: const Color(0xFFEFF4FF),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Center(
            child: Text(
              icon,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: dark,
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(
                  color: muted,
                  fontSize: 10,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // GENERATE
  // ============================================================

  Future<void> _generateTrip() async {
    final destination =
    destinationController.text.trim();

    if (destination.isEmpty) {
      _showMessage(
        'Please enter your destination.',
      );
      return;
    }

    FocusScope.of(context).unfocus();

    setState(() {
      isGenerating = true;
    });

    try {
      final itinerary = await AiService.generateItinerary(
        destination: destination,
        budget: selectedBudget,
        days: selectedDays,
        interest: selectedInterest,
      );

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ItineraryPage(
            itinerary: itinerary,
            destination: destination,
            days: selectedDays,
            budget: selectedBudget,
            interest: selectedInterest,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      _showMessage(
        'Unable to generate your trip right now. Please try again.',
      );
    } finally {
      if (mounted) {
        setState(() {
          isGenerating = false;
        });
      }
    }
  }

  // ============================================================
  // MESSAGE
  // ============================================================

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      );
  }
}