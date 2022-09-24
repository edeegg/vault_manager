import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:vault_manager/app/modules/auth/external/firebase_phone_auth.dart';

void main() async {
  // Mock sign in with Google.
  final googleSignIn = MockGoogleSignIn();
  final signinAccount = await googleSignIn.signIn();
  final googleAuth = await signinAccount?.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  // Sign in.
  final user = MockUser(
      isAnonymous: false, isEmailVerified: false, phoneNumber: '+5565999456598'
      // uid: 'someuid',
      //email: 'bob@somedomain.com',
      //displayName: 'Bob',
      );
  final auth = MockFirebaseAuth(mockUser: user);
  final firebaseAuth = FirebasePhoneAuth(auth);
  final result = await auth.signInWithCredential(credential);
  final users = result.user;
  test('firebase phone auth ...', () async {
    //  when(() => firebaseAuth.getPhoneNumber(any()))
    //     .thenAnswer((_) async => dynamic);

    final resulte = firebaseAuth.getPhoneNumber(users!.displayName.toString());

    expect(resulte, isA<dynamic>());

    print(users.phoneNumber);
  });
}
