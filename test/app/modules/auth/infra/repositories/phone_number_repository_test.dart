import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vault_manager/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:vault_manager/app/modules/auth/infra/datasources/phone_number_datasource.dart';
import 'package:vault_manager/app/modules/auth/infra/repositories/phone_number_repository.dart';

class PhoneNumberDatasourceMock extends Mock implements PhoneNumberDatasource {}

void main() {
  final datasource = PhoneNumberDatasourceMock();
  final repository = PhoneNumberRepository(datasource);
  test('deve retornar um numero de telefone ...', () async {
    when(() => datasource.getPhoneNumber(any()))
        .thenAnswer((_) async => const Right(dynamic));
    final result = await repository.getPhoneNumber('+65994555788');
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<dynamic>());
  });
  test('deve retornar um erro numero de telefone vazio ...', () async {
    when(() => datasource.getPhoneNumber(any()))
        .thenAnswer((_) async => const Right(dynamic));
    final result = await repository.getPhoneNumber('');
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<AuthErrorNumberEmpity>());
  });

  test('deve retornar um erro numero de telefone muito curto ...', () async {
    when(() => datasource.getPhoneNumber(any()))
        .thenAnswer((_) async => const Right(dynamic));
    final result = await repository.getPhoneNumber('+6599455578');
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<AuthErrorNumberSmal>());
  });
  test('deve retornar um erro numero de telefone muito grande ...', () async {
    when(() => datasource.getPhoneNumber(any()))
        .thenAnswer((_) async => const Right(dynamic));
    final result = await repository.getPhoneNumber('+659945557888');
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<AuthErrorNumberLarge>());
  });
}
