import 'package:dartz/dartz.dart';

import '../entities/vault_content_entity.dart';
import '../errors/vault_content_errors.dart';

abstract class IVaultContentRepository {
  Future<Either<VaultContentErrors, List<VaultContentEntity>>>
      getVaultContent();
}
