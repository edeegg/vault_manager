import 'package:firebase_auth/firebase_auth.dart';
import 'package:vault_manager/app/modules/auth/infra/datasources/phone_number_datasource.dart';

import '../domain/errors/auth_errors.dart';

class FirebasePhoneAuth implements PhoneNumberDatasource {
  final FirebaseAuth _firebaseAuth;

  FirebasePhoneAuth(this._firebaseAuth);
  @override
  Future getPhoneNumber(String phoneNUmber) async {
    try {
      _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNUmber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          //only android phone
          await _firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (error) {
          //a message when verification fails
          throw AuthErrorNumberVerificationFailed();
        },
        codeSent: ((verificationId, forceResendingToken) async {
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: phoneNUmber,
          );
          //works only ios and android phone
          await _firebaseAuth.signInWithCredential(credential);
        }),
        codeAutoRetrievalTimeout: ((verificationId) {}),
      );
    } catch (e) {}
  }
}
