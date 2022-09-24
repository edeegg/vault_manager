import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vault_manager/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:vault_manager/app/modules/auth/domain/repositories/phone_number_repository_impl.dart';
import 'package:vault_manager/app/modules/auth/domain/usecases/get_phone_number_usecase.dart';

class IPhoneNumberRepositoryMock extends Mock
    implements IPhoneNumberRepository {}

void main() {
  final repository = IPhoneNumberRepositoryMock();
  final usecase = GetPhoneNumberUsecase(repository);
  test('deve retornar um numero de telefone ...', () async {
    when(() => repository.getPhoneNumber(any()))
        .thenAnswer((_) async => const Right(dynamic));
    final result = await usecase.call('+65994555788');

    expect(result | null, isA<dynamic>());
  });
  test('deve retornar um erro numero de telefone vazio ...', () async {
    when(() => repository.getPhoneNumber(any()))
        .thenAnswer((_) async => const Right(dynamic));
    final result = await usecase.call('');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<AuthErrors>());
  });
}
