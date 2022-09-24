import 'package:dartz/dartz.dart';
import 'package:vault_manager/app/modules/auth/domain/repositories/phone_number_repository_impl.dart';

import '../errors/auth_errors.dart';

abstract class IGetPhoneNumberUsecase {
  Future<Either<AuthErrors, dynamic>> call(String phoneNumber);
}

class GetPhoneNumberUsecase implements IGetPhoneNumberUsecase {
  final IPhoneNumberRepository _phoneNumberRepository;

  GetPhoneNumberUsecase(this._phoneNumberRepository);
  @override
  Future<Either<AuthErrors, dynamic>> call(String phoneNumber) async {
    if (phoneNumber.isEmpty) {
      return Left(AuthErrorNumberEmpity());
    }
    return await _phoneNumberRepository.getPhoneNumber(phoneNumber);
  }
}
