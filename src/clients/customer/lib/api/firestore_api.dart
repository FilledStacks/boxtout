import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/app/app.logger.dart';
import 'package:customer/exceptions/firestore_api_exception.dart';
import 'package:customer/models/application_models.dart';

/// Contains the functionality to interact with the Firestore database
class FirestoreApi {
  final log = getLogger('FirestoreApi');
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  /// Creates a new user document in the [usersCollection]
  Future<void> createUser({required User user}) async {
    log.i('user:$user');

    try {
      final userDocument = usersCollection.doc(user.id);
      await userDocument.set(user.toJson());
      log.v('UserCreated at ${userDocument.path} ...');
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: 'Failed to create new user. $error',
      );
    }
  }

  /// Returns a [User] from the [usersCollection] if the document exists
  Future<User?> getUser({
    required String userId,
  }) async {
    log.i('userId:$userId');

    if (userId.isNotEmpty) {
      final userDoc = await usersCollection.doc(userId).get();
      if (!userDoc.exists) {
        log.v('We have no user with id :$userId in our database');
        return null;
      }

      final userData = userDoc.data();
      log.v('User found.\nData:\n$userData');

      return User.fromJson(userData!);
    } else {
      throw FirestoreApiException(
          message:
              'Your user passed in is null. Please pass in a valid user id from your firestore database');
    }
  }
}
