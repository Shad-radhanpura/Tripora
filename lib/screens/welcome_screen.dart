
import 'package:flutter/material.dart';

import 'trip_details_screen.dart';

class WelcomeScreen extends StatelessWidget {
const WelcomeScreen({super.key});

static const Color primary = Color(0xFF2563EB);
static const Color secondary = Color(0xFF7C3AED);
static const Color dark = Color(0xFF172033);
static const Color muted = Color(0xFF667085);

@override
Widget build(BuildContext context) {
return Scaffold(
body: Stack(
children: [
// ========================================================
// FULL SCREEN BACKGROUND IMAGE
// ========================================================

Positioned.fill(
child: Image.network(
'https://images.unsplash.com/photo-1500534623283-312aade485b7',
fit: BoxFit.cover,
errorBuilder: (_, __, ___) {
return Container(
decoration: const BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [
Color(0xFF172554),
Color(0xFF312E81),
Color(0xFF581C87),
],
),
),
);
},
),
),

// ========================================================
// BLUE / PURPLE IMAGE OVERLAY
// ========================================================

Positioned.fill(
child: Container(
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [
const Color(0xFF0F3D91).withValues(alpha: 0.82),
const Color(0xFF4338CA).withValues(alpha: 0.68),
const Color(0xFF7E22CE).withValues(alpha: 0.60),
const Color(0xFF0F172A).withValues(alpha: 0.88),
],
stops: const [
0.0,
0.38,
0.68,
1.0,
],
),
),
),
),

// ========================================================
// SOFT GLOW EFFECTS
// ========================================================

Positioned(
top: -100,
left: -80,
child: _backgroundGlow(
size: 280,
color: const Color(0xFF60A5FA),
),
),

Positioned(
top: 260,
right: -110,
child: _backgroundGlow(
size: 300,
color: const Color(0xFFA78BFA),
),
),

Positioned(
bottom: -120,
left: -90,
child: _backgroundGlow(
size: 330,
color: const Color(0xFF38BDF8),
),
),

// ========================================================
// CONTENT
// ========================================================

SafeArea(
child: SingleChildScrollView(
physics: const BouncingScrollPhysics(),
child: Column(
children: [
_buildTopBar(context),

const SizedBox(height: 8),

_buildHero(context),

_buildQuickStats(),

_buildVibeSection(context),

_buildPopularDestinations(context),

_buildHowItWorks(),

_buildWhyTripora(),

_buildFinalCta(context),

const SizedBox(height: 35),
],
),
),
),
],
),
);
}

// ============================================================
// BACKGROUND GLOW
// ============================================================

Widget _backgroundGlow({
required double size,
required Color color,
}) {
return IgnorePointer(
child: Container(
width: size,
height: size,
decoration: BoxDecoration(
shape: BoxShape.circle,
boxShadow: [
BoxShadow(
color: color.withValues(alpha: 0.32),
blurRadius: 100,
spreadRadius: 40,
),
],
),
),
);
}

// ============================================================
// TOP BAR
// ============================================================

Widget _buildTopBar(BuildContext context) {
return Padding(
padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
child: Row(
children: [
Container(
width: 46,
height: 46,
decoration: BoxDecoration(
gradient: const LinearGradient(
colors: [
Color(0xFF60A5FA),
Color(0xFF8B5CF6),
],
),
borderRadius: BorderRadius.circular(16),
boxShadow: [
BoxShadow(
color: Colors.black.withValues(alpha: 0.20),
blurRadius: 20,
offset: const Offset(0, 8),
),
],
),
child: const Icon(
Icons.flight_takeoff_rounded,
color: Colors.white,
size: 25,
),
),

const SizedBox(width: 11),

const Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'TRIPORA',
style: TextStyle(
color: Colors.white,
fontSize: 19,
fontWeight: FontWeight.w900,
letterSpacing: 1.2,
),
),
Text(
'AI Travel Planner',
style: TextStyle(
color: Colors.white70,
fontSize: 10,
fontWeight: FontWeight.w500,
),
),
],
),

const Spacer(),

Container(
padding: const EdgeInsets.symmetric(
horizontal: 13,
vertical: 9,
),
decoration: BoxDecoration(
color: Colors.white.withValues(alpha: 0.16),
borderRadius: BorderRadius.circular(30),
border: Border.all(
color: Colors.white.withValues(alpha: 0.22),
),
),
child: const Row(
children: [
Text(
'✨',
style: TextStyle(fontSize: 13),
),
SizedBox(width: 5),
Text(
'AI',
style: TextStyle(
color: Colors.white,
fontSize: 12,
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

Widget _buildHero(BuildContext context) {
return Padding(
padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
child: Container(
height: 475,
decoration: BoxDecoration(
color: Colors.black.withValues(alpha: 0.16),
borderRadius: BorderRadius.circular(32),
border: Border.all(
color: Colors.white.withValues(alpha: 0.20),
),
boxShadow: [
BoxShadow(
color: Colors.black.withValues(alpha: 0.22),
blurRadius: 30,
offset: const Offset(0, 16),
),
],
),
child: ClipRRect(
borderRadius: BorderRadius.circular(32),
child: Stack(
children: [
// Glass-like hero background
Positioned.fill(
child: Container(
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [
Colors.white.withValues(alpha: 0.15),
Colors.white.withValues(alpha: 0.05),
Colors.black.withValues(alpha: 0.28),
],
),
),
),
),

Positioned(
top: 18,
left: 18,
child: Container(
padding: const EdgeInsets.symmetric(
horizontal: 13,
vertical: 9,
),
decoration: BoxDecoration(
color: Colors.white.withValues(alpha: 0.18),
borderRadius: BorderRadius.circular(30),
border: Border.all(
color: Colors.white.withValues(alpha: 0.25),
),
),
child: const Row(
children: [
Text(
'🌍',
style: TextStyle(fontSize: 14),
),
SizedBox(width: 6),
Text(
'Your journey starts here',
style: TextStyle(
color: Colors.white,
fontSize: 11,
fontWeight: FontWeight.w800,
),
),
],
),
),
),

Positioned(
top: 18,
right: 18,
child: Container(
width: 44,
height: 44,
decoration: BoxDecoration(
color: Colors.white.withValues(alpha: 0.18),
shape: BoxShape.circle,
border: Border.all(
color: Colors.white.withValues(alpha: 0.25),
),
),
child: const Center(
child: Text(
'✈️',
style: TextStyle(fontSize: 19),
),
),
),
),

Positioned(
left: 22,
right: 22,
bottom: 24,
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text(
'Travel more.\nWorry less. ✨',
style: TextStyle(
color: Colors.white,
fontSize: 37,
height: 1.03,
fontWeight: FontWeight.w900,
letterSpacing: -0.8,
),
),

const SizedBox(height: 12),

Text(
'Tell Tripora where you want to go,\nand let AI shape your perfect journey.',
style: TextStyle(
color: Colors.white.withValues(alpha: 0.90),
fontSize: 14,
height: 1.45,
),
),

const SizedBox(height: 19),

SizedBox(
width: double.infinity,
height: 56,
child: ElevatedButton(
onPressed: () {
_openPlanner(context);
},
style: ElevatedButton.styleFrom(
backgroundColor: Colors.white,
foregroundColor: primary,
elevation: 8,
shadowColor: Colors.black.withValues(alpha: 0.25),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(18),
),
),
child: const Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
'Plan My Trip',
style: TextStyle(
fontSize: 15,
fontWeight: FontWeight.w900,
),
),
SizedBox(width: 9),
Icon(
Icons.arrow_forward_rounded,
size: 21,
),
],
),
),
),

const SizedBox(height: 12),

Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
_trustItem('✨', 'AI powered'),
const SizedBox(width: 15),
_trustItem('🎯', 'Personalized'),
const SizedBox(width: 15),
_trustItem('💰', 'Budget smart'),
],
),
],
),
),
],
),
),
),
);
}

Widget _trustItem(String emoji, String title) {
return Row(
children: [
Text(
emoji,
style: const TextStyle(fontSize: 12),
),
const SizedBox(width: 4),
Text(
title,
style: TextStyle(
color: Colors.white.withValues(alpha: 0.88),
fontSize: 9,
fontWeight: FontWeight.w600,
),
),
],
);
}

// ============================================================
// QUICK STATS
// ============================================================

Widget _buildQuickStats() {
return Padding(
padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
child: _glassCard(
child: const Row(
children: [
Expanded(
child: _StatItem(
icon: '✨',
title: 'AI Planning',
subtitle: 'Smart trips',
),
),
_VerticalDivider(),
Expanded(
child: _StatItem(
icon: '🎯',
title: 'Personal',
subtitle: 'Your style',
),
),
_VerticalDivider(),
Expanded(
child: _StatItem(
icon: '💰',
title: 'Budget',
subtitle: 'Plan smarter',
),
),
],
),
),
);
}

// ============================================================
// GLASS CARD
// ============================================================

Widget _glassCard({
required Widget child,
}) {
return Container(
padding: const EdgeInsets.symmetric(
horizontal: 10,
vertical: 14,
),
decoration: BoxDecoration(
color: Colors.white.withValues(alpha: 0.94),
borderRadius: BorderRadius.circular(22),
border: Border.all(
color: Colors.white.withValues(alpha: 0.85),
),
boxShadow: [
BoxShadow(
color: Colors.black.withValues(alpha: 0.10),
blurRadius: 22,
offset: const Offset(0, 8),
),
],
),
child: child,
);
}

// ============================================================
// VIBES
// ============================================================

Widget _buildVibeSection(BuildContext context) {
final vibes = [
{
'emoji': '🏔️',
'title': 'Nature',
'subtitle': 'Mountains',
'color': const Color(0xFFE8F7EC),
'text': const Color(0xFF16803A),
},
{
'emoji': '🧗',
'title': 'Adventure',
'subtitle': 'Thrills',
'color': const Color(0xFFFFF0E5),
'text': const Color(0xFFE05A00),
},
{
'emoji': '🏛️',
'title': 'Culture',
'subtitle': 'Heritage',
'color': const Color(0xFFF1EAFE),
'text': const Color(0xFF7E22CE),
},
{
'emoji': '🏖️',
'title': 'Beach',
'subtitle': 'Relax',
'color': const Color(0xFFE4F8FC),
'text': const Color(0xFF087F91),
},
{
'emoji': '🛍️',
'title': 'Shopping',
'subtitle': 'Explore',
'color': const Color(0xFFFFEAF3),
'text': const Color(0xFFC2185B),
},
];

return Padding(
padding: const EdgeInsets.only(top: 32),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
_sectionHeading(
title: 'What is your vibe?',
subtitle: 'Choose what sounds like you.',
),
const SizedBox(height: 17),
SizedBox(
height: 138,
child: ListView.separated(
padding: const EdgeInsets.symmetric(horizontal: 18),
scrollDirection: Axis.horizontal,
physics: const BouncingScrollPhysics(),
itemCount: vibes.length,
separatorBuilder: (_, __) => const SizedBox(width: 12),
itemBuilder: (_, index) {
final vibe = vibes[index];

return GestureDetector(
onTap: () => _openPlanner(context),
child: Container(
width: 112,
padding: const EdgeInsets.all(13),
decoration: BoxDecoration(
color: vibe['color'] as Color,
borderRadius: BorderRadius.circular(23),
boxShadow: [
BoxShadow(
color: Colors.black.withValues(alpha: 0.08),
blurRadius: 15,
offset: const Offset(0, 7),
),
],
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Container(
width: 46,
height: 46,
decoration: BoxDecoration(
color: Colors.white.withValues(alpha: 0.72),
shape: BoxShape.circle,
),
child: Center(
child: Text(
vibe['emoji'] as String,
style: const TextStyle(fontSize: 24),
),
),
),
const Spacer(),
Text(
vibe['title'] as String,
style: TextStyle(
color: vibe['text'] as Color,
fontSize: 13,
fontWeight: FontWeight.w900,
),
),
const SizedBox(height: 2),
Text(
vibe['subtitle'] as String,
style: TextStyle(
color: vibe['text'] as Color,
fontSize: 10,
),
),
],
),
),
);
},
),
),
],
),
);
}

// ============================================================
// DESTINATIONS
// ============================================================

Widget _buildPopularDestinations(BuildContext context) {
final destinations = [
(
'Manali',
'Himachal Pradesh',
'🏔️',
'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
),
(
'Goa',
'India',
'🌴',
'https://images.unsplash.com/photo-1510414842594-a61c69b5ae57',
),
(
'Dubai',
'United Arab Emirates',
'🏙️',
'https://images.unsplash.com/photo-1512453979798-5ea266f8880c',
),
(
'Bali',
'Indonesia',
'🌊',
'https://images.unsplash.com/photo-1537996194471-e657df975ab4',
),
(
'Paris',
'France',
'🗼',
'https://images.unsplash.com/photo-1502602898657-3e91760cbb34',
),
(
'Tokyo',
'Japan',
'🗾',
'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf',
),
];

return Padding(
padding: const EdgeInsets.only(top: 38),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
_sectionHeading(
title: 'Get inspired',
subtitle: 'Places worth putting on your list.',
trailing: '✨',
),
const SizedBox(height: 17),
SizedBox(
height: 245,
child: ListView.separated(
padding: const EdgeInsets.symmetric(horizontal: 18),
scrollDirection: Axis.horizontal,
physics: const BouncingScrollPhysics(),
itemCount: destinations.length,
separatorBuilder: (_, __) => const SizedBox(width: 14),
itemBuilder: (context, index) {
final destination = destinations[index];

return GestureDetector(
onTap: () => _openPlanner(context),
child: Container(
width: 205,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(25),
boxShadow: [
BoxShadow(
color: Colors.black.withValues(alpha: 0.16),
blurRadius: 20,
offset: const Offset(0, 10),
),
],
),
child: ClipRRect(
borderRadius: BorderRadius.circular(25),
child: Stack(
fit: StackFit.expand,
children: [
Image.network(
destination.$4,
fit: BoxFit.cover,
errorBuilder: (_, __, ___) {
return Container(
color: const Color(0xFFDDE5F2),
child: const Icon(
Icons.landscape_rounded,
size: 48,
color: Colors.white,
),
);
},
),
Container(
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topCenter,
end: Alignment.bottomCenter,
colors: [
Colors.transparent,
Colors.black.withValues(alpha: 0.84),
],
),
),
),
Positioned(
top: 13,
right: 13,
child: Container(
width: 40,
height: 40,
decoration: BoxDecoration(
color: Colors.white.withValues(alpha: 0.91),
shape: BoxShape.circle,
),
child: Center(
child: Text(
destination.$3,
style: const TextStyle(fontSize: 19),
),
),
),
),
Positioned(
left: 15,
right: 15,
bottom: 15,
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
destination.$1,
style: const TextStyle(
color: Colors.white,
fontSize: 21,
fontWeight: FontWeight.w900,
),
),
const SizedBox(height: 3),
Text(
destination.$2,
style: TextStyle(
color: Colors.white.withValues(alpha: 0.82),
fontSize: 11,
),
),
],
),
),
],
),
),
),
);
},
),
),
],
),
);
}

// ============================================================
// HOW IT WORKS
// ============================================================

Widget _buildHowItWorks() {
final steps = [
(
'01',
'📍',
'Choose your destination',
'Tell Tripora where your adventure begins.',
),
(
'02',
'🎯',
'Set your travel vibe',
'Choose your days, budget and interests.',
),
(
'03',
'✨',
'Get your journey',
'Tripora creates your personalized plan.',
),
];

return Padding(
padding: const EdgeInsets.fromLTRB(18, 38, 18, 0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
_sectionHeading(
title: 'How Tripora works',
subtitle: 'Your trip, simplified.',
),
const SizedBox(height: 17),
...steps.map(
(step) {
return Container(
margin: const EdgeInsets.only(bottom: 11),
padding: const EdgeInsets.all(14),
decoration: BoxDecoration(
color: Colors.white.withValues(alpha: 0.94),
borderRadius: BorderRadius.circular(20),
boxShadow: [
BoxShadow(
color: Colors.black.withValues(alpha: 0.09),
blurRadius: 16,
offset: const Offset(0, 6),
),
],
),
child: Row(
children: [
Container(
width: 52,
height: 52,
decoration: BoxDecoration(
gradient: const LinearGradient(
colors: [
Color(0xFFEFF4FF),
Color(0xFFEAE8FF),
],
),
borderRadius: BorderRadius.circular(16),
),
child: Center(
child: Text(
step.$2,
style: const TextStyle(fontSize: 24),
),
),
),
const SizedBox(width: 13),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
Text(
step.$1,
style: const TextStyle(
color: primary,
fontSize: 10,
fontWeight: FontWeight.w900,
),
),
const SizedBox(width: 7),
Expanded(
child: Text(
step.$3,
style: const TextStyle(
color: dark,
fontSize: 14,
fontWeight: FontWeight.w800,
),
),
),
],
),
const SizedBox(height: 4),
Text(
step.$4,
style: const TextStyle(
color: muted,
fontSize: 11,
height: 1.3,
),
),
],
),
),
],
),
);
},
),
],
),
);
}

// ============================================================
// WHY TRIPORA
// ============================================================

Widget _buildWhyTripora() {
final features = [
(
'🤖',
'AI Powered',
'Smart travel planning',
Color(0xFFEAF0FF),
),
(
'🎯',
'Personalized',
'Built around you',
Color(0xFFFFEAF4),
),
(
'💰',
'Budget Smart',
'Plan your spending',
Color(0xFFE8F8EF),
),
(
'🌎',
'Explore More',
'Discover possibilities',
Color(0xFFFFF1E5),
),
];

return Padding(
padding: const EdgeInsets.fromLTRB(18, 38, 18, 0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
_sectionHeading(
title: 'Why travelers choose Tripora',
subtitle: 'Everything starts with your idea.',
),
const SizedBox(height: 16),
LayoutBuilder(
builder: (context, constraints) {
final bool isWide = constraints.maxWidth >= 850;

return GridView.builder(
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
itemCount: features.length,
gridDelegate:
SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: isWide ? 4 : 2,
crossAxisSpacing: 11,
mainAxisSpacing: 11,
mainAxisExtent: 128,
),
itemBuilder: (context, index) {
final feature = features[index];

return Container(
padding: const EdgeInsets.all(14),
decoration: BoxDecoration(
color: feature.$4,
borderRadius: BorderRadius.circular(21),
boxShadow: [
BoxShadow(
color: Colors.black.withValues(alpha: 0.07),
blurRadius: 14,
offset: const Offset(0, 6),
),
],
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
Text(
feature.$1,
style: const TextStyle(fontSize: 25),
),
const Spacer(),
Icon(
Icons.arrow_outward_rounded,
size: 16,
color: dark.withValues(alpha: 0.25),
),
],
),
const Spacer(),
Text(
feature.$2,
style: const TextStyle(
color: dark,
fontSize: 13,
fontWeight: FontWeight.w900,
),
),
const SizedBox(height: 3),
Text(
feature.$3,
style: const TextStyle(
color: muted,
fontSize: 10,
),
),
],
),
);
},
);
},
),
],
),
);
}

// ============================================================
// FINAL CTA
// ============================================================

Widget _buildFinalCta(BuildContext context) {
return Padding(
padding: const EdgeInsets.fromLTRB(18, 38, 18, 0),
child: Container(
width: double.infinity,
padding: const EdgeInsets.fromLTRB(22, 25, 22, 22),
decoration: BoxDecoration(
gradient: const LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [
Color(0xFF2563EB),
Color(0xFF7C3AED),
Color(0xFF9333EA),
],
),
borderRadius: BorderRadius.circular(28),
boxShadow: [
BoxShadow(
color: const Color(0xFF4F46E5).withValues(alpha: 0.35),
blurRadius: 30,
offset: const Offset(0, 14),
),
],
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text(
'Your next story\nstarts here. 🌍',
style: TextStyle(
color: Colors.white,
fontSize: 27,
height: 1.08,
fontWeight: FontWeight.w900,
),
),
const SizedBox(height: 9),
Text(
'Turn your travel idea into a personalized journey with Tripora AI.',
style: TextStyle(
color: Colors.white.withValues(alpha: 0.84),
fontSize: 12,
height: 1.4,
),
),
const SizedBox(height: 19),
SizedBox(
width: double.infinity,
height: 53,
child: ElevatedButton(
onPressed: () {
_openPlanner(context);
},
style: ElevatedButton.styleFrom(
backgroundColor: Colors.white,
foregroundColor: primary,
elevation: 4,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(17),
),
),
child: const Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
'Create My Journey',
style: TextStyle(
fontSize: 14,
fontWeight: FontWeight.w900,
),
),
SizedBox(width: 8),
Text(
'✨',
style: TextStyle(fontSize: 17),
),
],
),
),
),
],
),
),
);
}

// ============================================================
// SECTION HEADING
// ============================================================

Widget _sectionHeading({
required String title,
required String subtitle,
String? trailing,
}) {
return Padding(
padding: const EdgeInsets.symmetric(horizontal: 18),
child: Row(
crossAxisAlignment: CrossAxisAlignment.end,
children: [
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
title,
style: const TextStyle(
color: Colors.white,
fontSize: 20,
fontWeight: FontWeight.w900,
letterSpacing: -0.2,
shadows: [
Shadow(
color: Colors.black45,
blurRadius: 8,
),
],
),
),
const SizedBox(height: 4),
Text(
subtitle,
style: TextStyle(
color: Colors.white.withValues(alpha: 0.78),
fontSize: 12,
),
),
],
),
),
if (trailing != null)
Text(
trailing,
style: const TextStyle(fontSize: 22),
),
],
),
);
}

// ============================================================
// NAVIGATION
// ============================================================

void _openPlanner(BuildContext context) {
Navigator.push(
context,
PageRouteBuilder(
transitionDuration: const Duration(milliseconds: 400),
reverseTransitionDuration:
const Duration(milliseconds: 300),
pageBuilder: (_, animation, secondaryAnimation) {
return const TripDetailsScreen();
},
transitionsBuilder:
(_, animation, secondaryAnimation, child) {
return FadeTransition(
opacity: CurvedAnimation(
parent: animation,
curve: Curves.easeOut,
),
child: SlideTransition(
position: Tween<Offset>(
begin: const Offset(0.08, 0),
end: Offset.zero,
).animate(
CurvedAnimation(
parent: animation,
curve: Curves.easeOutCubic,
),
),
child: child,
),
);
},
),
);
}
}

// ============================================================
// STAT ITEM
// ============================================================

class _StatItem extends StatelessWidget {
final String icon;
final String title;
final String subtitle;

const _StatItem({
required this.icon,
required this.title,
required this.subtitle,
});

@override
Widget build(BuildContext context) {
return Column(
children: [
Text(
icon,
style: const TextStyle(fontSize: 19),
),
const SizedBox(height: 5),
Text(
title,
style: const TextStyle(
color: Color(0xFF172033),
fontSize: 11,
fontWeight: FontWeight.w800,
),
),
const SizedBox(height: 2),
Text(
subtitle,
style: const TextStyle(
color: Color(0xFF7A8496),
fontSize: 9,
),
),
],
);
}
}

// ============================================================
// VERTICAL DIVIDER
// ============================================================

class _VerticalDivider extends StatelessWidget {
const _VerticalDivider();

@override
Widget build(BuildContext context) {
return Container(
width: 1,
height: 42,
color: const Color(0xFFE8ECF3),
);
}
}

