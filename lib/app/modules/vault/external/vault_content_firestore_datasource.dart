import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vault_manager/app/modules/vault/infra/datasources/vault_content_datasource.dart';

import '../domain/errors/vault_content_errors.dart';

class VaultContentFirestoreDatasource implements VaultContentDatasource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _user;
  VaultContentFirestoreDatasource(this._firebaseFirestore, this._user);
  @override
  Future<List<Map>> getVaultList() async {
    try {
      if (_user.currentUser!.uid.isEmpty) {
        throw VaultContentErrorUserNotFound();
      }
      final snapshot = await _firebaseFirestore
          .collection('Users')
          .doc(_user.currentUser?.uid)
          .collection('vault-passwords')
          .get();

      final data =
          snapshot.docs.map((value) => value.data()).map((map) => map).toList();
      return data;
    } catch (e) {
      throw VaultContentErrorGeneric();
    }
  }
}
