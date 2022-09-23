import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vault_manager/app/modules/vault/domain/entities/vault_content_entity.dart';
import 'package:vault_manager/app/modules/vault/infra/datasources/vault_content_datasource.dart';
import 'package:vault_manager/app/modules/vault/infra/repositories/vault_content_repository.dart';

class VaultContentDatasourceMock extends Mock
    implements VaultContentDatasource {}

void main() {
  final datasource = VaultContentDatasourceMock();
  final repository = VaultContentRepository(datasource);
  test('deve retornar uma lista de vaultcontentrepository ...', () async {
    when(() => datasource.getVaultList()).thenAnswer((_) async => <Map>[]);
    final result = await repository.getVaultContent();

    expect(result, isA<List<VaultContentEntity>>());
  });
}
