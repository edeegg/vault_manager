import '../entities/vault_content_entity.dart';

abstract class IVaultContentRepository {
  Future<List<VaultContentEntity>> getVaultContent();
}
