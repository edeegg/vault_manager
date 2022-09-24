import 'package:flutter_modular/flutter_modular.dart';
import 'package:vault_manager/app/modules/vault/presenter/vault_page.dart';

class VaultModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (_, args) => const VaultPage())];
}
