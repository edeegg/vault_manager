import 'package:vault_manager/app/modules/vault/domain/entities/vault_content_entity.dart';

class VaultContentAdapter {
  static VaultContentEntity fromJson(dynamic data) {
    return VaultContentEntity(
      serviceName: data['serviceName'],
      serviceEmail: data['serviceEmail'],
      serviceImageUrl: data['serviceImageUrl'],
    );
  }
}
