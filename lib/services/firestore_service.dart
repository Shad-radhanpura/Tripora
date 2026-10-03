
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
static final FirebaseFirestore _db = FirebaseFirestore.instance;

// Create or update a user document
static Future<void> createUser({
required String uid,
required String email,
}) async {
await _db.collection('users').doc(uid).set({
'uid': uid,
'email': email,
'createdAt': FieldValue.serverTimestamp(),
}, SetOptions(merge: true));
}

// Save a generated trip
static Future<String> saveTrip({
required String userId,
required String destination,
required String budget,
required int days,
required String interest,
required String itinerary,
}) async {
final docRef = await _db.collection('trips').add({
'userId': userId,
'destination': destination,
'budget': budget,
'days': days,
'interest': interest,
'itinerary': itinerary,
'createdAt': FieldValue.serverTimestamp(),
});

return docRef.id;
}

// Get all trips of a particular user
static Future<List<Map<String, dynamic>>> getUserTrips(
String userId,
) async {
final snapshot = await _db
    .collection('trips')
    .where('userId', isEqualTo: userId)
    .get();

return snapshot.docs.map((doc) {
return {
'id': doc.id,
...doc.data(),
};
}).toList();
}

// Get one trip by document ID
static Future<Map<String, dynamic>?> getTrip(String tripId) async {
final doc = await _db.collection('trips').doc(tripId).get();

if (!doc.exists) {
return null;
}

return {
'id': doc.id,
...doc.data()!,
};
}
}

