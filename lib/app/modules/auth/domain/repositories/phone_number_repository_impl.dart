import 'package:dartz/dartz.dart';

import '../errors/auth_errors.dart';

abstract class IPhoneNumberRepository {
  Future<Either<AuthErrors, dynamic>> getPhoneNumber(String phoneNumber);
}
