import 'package:vault_manager/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:vault_manager/app/modules/auth/domain/repositories/phone_number_repository_impl.dart';

import '../datasources/phone_number_datasource.dart';

class PhoneNumberRepository implements IPhoneNumberRepository {
  final PhoneNumberDatasource _phoneNumberDatasource;

  PhoneNumberRepository(this._phoneNumberDatasource);
  @override
  Future<Either<AuthErrors, dynamic>> getPhoneNumber(String phoneNumber) async {
    try {
      if (phoneNumber.isEmpty) {
        return Left(AuthErrorNumberEmpity());
      }
      if (phoneNumber.length < 12) {
        return Left(AuthErrorNumberSmal());
      }

      if (phoneNumber.length > 12) {
        return Left(AuthErrorNumberLarge());
      }
      final future = await _phoneNumberDatasource.getPhoneNumber(phoneNumber);
      return Right(future);
    } catch (e) {
      return Left(AuthErrorNumberGeneric());
    }
  }
}
