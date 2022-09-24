import 'package:dartz/dartz.dart';
import 'package:vault_manager/app/modules/vault/domain/entities/vault_content_entity.dart';
import 'package:vault_manager/app/modules/vault/domain/errors/vault_content_errors.dart';
import 'package:vault_manager/app/modules/vault/infra/adapters/vault_content_adapter.dart';
import 'package:vault_manager/app/modules/vault/infra/datasources/vault_content_datasource.dart';

import '../../domain/repositories/vault_content_repository_impl.dart';

class VaultContentRepository implements IVaultContentRepository {
  final VaultContentDatasource _vaultContentDatasource;

  VaultContentRepository(this._vaultContentDatasource);
  @override
  Future<Either<VaultContentErrors, List<VaultContentEntity>>>
      getVaultContent() async {
    try {
      final result = await _vaultContentDatasource.getVaultList();
      final convert = result.map((data) => VaultContentAdapter.fromJson(data));
      return Right(convert.toList());
    } catch (e) {
      return Left(VaultContentErrorEmpityList());
    }
  }
}
