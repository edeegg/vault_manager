import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vault_manager/app/modules/vault/domain/entities/vault_content_entity.dart';
import 'package:vault_manager/app/modules/vault/domain/repositories/vault_content_repository_impl.dart';
import 'package:vault_manager/app/modules/vault/domain/usecases/get_vault_content_usecase.dart';

class IVaultContentRepositoryMock extends Mock
    implements IVaultContentRepository {}

void main() {
  final repository = IVaultContentRepositoryMock();
  final usecase = GetVaultContentUsecase(repository);
  test(
    'deve retornar uma lista de vaultcontent ...',
    () async {
      when(() => repository.getVaultContent())
          .thenAnswer((_) async => const Right(<VaultContentEntity>[]));
      final result = await usecase.call();
      expect(result.isRight(), true);
      expect(result.fold(id, id), isA<List<VaultContentEntity>>());
    },
  );

  /* test(
    'deve retornar um erro de vaultcontent vazia ...',
    () async {
      when(() => repository.getVaultContent())
          .thenAnswer((_) async => const Right(<VaultContentEntity>[]));
      final result = await usecase.call();

      expect(result.isLeft(), true);
    },
  );*/
}
