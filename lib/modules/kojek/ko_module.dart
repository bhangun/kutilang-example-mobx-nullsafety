import 'package:kutilang_example/models/module.dart';
import 'package:provider/single_child_widget.dart';

import '../../utils/routes.dart';
import 'ko_routes.dart';

class KoModule implements Module {
  @override
  String? name = 'Main';

  @override
  pages() {
    return [
      Page(title: 'User Detail', route: KoRoutes.koHome),
      Page(title: 'User Form', route: KoRoutes.kojekHome),
      Page(title: 'User Form', route: KoRoutes.koPayHome),
      Page(title: 'User Form', route: KoRoutes.koSendHome),
      Page(title: 'User Form', route: KoRoutes.koShopHome),
      Page(
          title: 'User List',
          route: KoRoutes.koMartHome,
          showInDrawer: true,
          showInHome: true)
    ];
  }

  @override
  services() {}

  @override
  void routes() {
    RoutesService.addRoutes(KoRoutes.routes);
  }

   @override
  List<SingleChildWidget> providers() {
    return [
    ];
  }
}
