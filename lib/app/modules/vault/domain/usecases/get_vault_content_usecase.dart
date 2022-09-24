import 'package:dartz/dartz.dart';
import 'package:vault_manager/app/modules/vault/domain/entities/vault_content_entity.dart';
import 'package:vault_manager/app/modules/vault/domain/repositories/vault_content_repository_impl.dart';

import '../errors/vault_content_errors.dart';

abstract class IGetVaultContentUsecase {
  Future<Either<VaultContentErrors, List<VaultContentEntity>>> call();
}

class GetVaultContentUsecase implements IGetVaultContentUsecase {
  final IVaultContentRepository _vaultContentRepository;

  GetVaultContentUsecase(this._vaultContentRepository);
  @override
  Future<Either<VaultContentErrors, List<VaultContentEntity>>> call() async {
    final result = await _vaultContentRepository.getVaultContent();

    return result;
  }
}
