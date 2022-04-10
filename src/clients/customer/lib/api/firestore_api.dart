import 'package:customer/app/app.logger.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/constants/app_keys.dart';
import 'package:customer/exceptions/firestore_api_exception.dart';
import 'package:customer/models/application_models.dart';
import 'package:customer/extensions/string_extensions.dart';

class FirestoreApi {
  final log = getLogger('FirestoreApi');

  final CollectionReference<Map<String, dynamic>> usersCollection =
      FirebaseFirestore.instance.collection(UsersFirestoreKey);

  final CollectionReference regionsCollection =
      FirebaseFirestore.instance.collection(RegionsFirestoreKey);

  Future<void> createUser({required User user}) async {
    log.i('user:$user');

    try {
      final userDocument = usersCollection.doc(user.id);
      await userDocument.set(user.toJson());
      log.v('UserCreated at ${userDocument.path}');
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: '$error',
      );
    }
  }

  Future<User?> getUser({required String userId}) async {
    log.i('userId:$userId');

    if (userId.isNotEmpty) {
      final userDoc = await usersCollection.doc(userId).get();
      if (!userDoc.exists) {
        log.v('We have no user with id $userId in our database');
        return null;
      }

      final userData = userDoc.data();
      log.v('User found. Data: $userData');

      return User.fromJson(userData!);
    } else {
      throw FirestoreApiException(
          message:
              'Your userId passed in is empty. Please pass in a valid user if from your Firebase user.');
    }
  }

  /// Saves the address passed in to the backend for the user and also sets
  /// the default address if the user doesn't have one set.
  /// Returns true if no errors occured
  /// Returns false for any error at any part of the process
  Future<bool> saveAddress({
    required Address address,
    required User user,
  }) async {
    log.i('address:$address');

    try {
      final addressDoc = _getAddressCollectionForUser(user.id).doc();
      final newAddressId = addressDoc.id;
      log.v('Address will be stored with id: $newAddressId');

      await addressDoc.set(
        address.copyWith(id: newAddressId).toJson(),
      );

      final hasDefaultAddress = user.hasAddress;

      log.v('Address save complete. hasDefaultAddress:$hasDefaultAddress');

      if (!hasDefaultAddress) {
        log.v(
            'This user has no default address. We need to set the current one as default');

        await usersCollection.doc(user.id).set(
              user.copyWith(defaultAddress: newAddressId).toJson(),
            );
        log.v('User ${user.id} defaultAddress set to $newAddressId');
      }

      return true;
    } on Exception catch (error) {
      log.e('we could not save the users address. $error');
      return false;
    }
  }

  Future<bool> isCityServiced({required String city}) async {
    log.i('city:$city');
    final cityDocument = await regionsCollection.doc(city).get();
    return cityDocument.exists;
  }

  CollectionReference<Map<String, dynamic>> _getAddressCollectionForUser(
      String userId) {
    return usersCollection.doc(userId).collection(AddressesFirestoreKey);
  }

  Future<List<Address>> getAddressListForUser(String userId) async {
    log.i('userId:$userId');
    try {
      final addressCollection =
          await _getAddressCollectionForUser(userId).get();
      log.v('addressCollection: ${addressCollection.toString()}');

      List<Address> addresses = addressCollection.docs.map((address) {
        return Address.fromJson(address.data());
      }).toList();
      return addresses;
    } catch (error) {
      throw FirestoreApiException(
        devDetails: error.toString(),
        message: "getAddressListForUser() failed,",
      );
    }
  }

  String extractRegionIdFromUserAddresses(
      {required List<Address> addresses,
      required String userDefaultAddressId}) {
    log.i('addresses:$addresses, userDefaultAddressId:$userDefaultAddressId');
    try {
      return addresses
          .firstWhere(
            (address) => address.id == userDefaultAddressId,
          )
          .city!
          .toCityDocument;
    } on StateError catch (error) {
      throw FirestoreApiException(
        devDetails: error.toString(),
        message:
            "we couldn't found the default address of the user in our address collection",
      );
    }
  }

  Future<List<Merchant>> getMerchantsCollectionForRegion(
      {required String regionId}) async {
    log.i('regionId:$regionId');
    try {
      final regionCollections = await regionsCollection
          .doc(regionId)
          .collection(MerchantsFirestoreKey)
          .get();
      if (regionCollections.docs.isEmpty) {
        log.w('We have no merchants in this region');
        return [];
      }

      final regionCollectionsDocuments = regionCollections.docs;
      log.v(
          'for regionId: $regionId, Merchants fetched: $regionCollectionsDocuments');
      List<Merchant> merchants = regionCollectionsDocuments.map((merchant) {
        var data = merchant.data();
        data.putIfAbsent('id', () => merchant.id);
        return Merchant.fromJson(data);
      }).toList();
      return merchants;
    } catch (error) {
      throw FirestoreApiException(
          devDetails: error.toString(),
          message:
              'An error ocurred while calling getMerchantsCollectionForRegion()');
    }
  }
}
