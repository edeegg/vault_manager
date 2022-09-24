import 'package:flutter_modular/flutter_modular.dart';
import 'package:vault_manager/app/modules/vault/presenter/vault_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: VaultModule()),
      ];
}
