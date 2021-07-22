import 'package:kutilang_example/models/module.dart';
import 'package:kutilang_example/services/apps_routes.dart';
import 'package:kutilang_example/store/app_store/app_store.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../utils/routes.dart';
import 'account/services/user_routes.dart';

class MainModule implements Module {
  @override
  String? name = 'Main';

  @override
  pages() {
    return [
      Page(title: 'User Detail', route: UserRoutes.userDetail),
      Page(title: 'User Form', route: UserRoutes.userForm),
      Page(
          title: 'User List',
          route: UserRoutes.userList,
          showInDrawer: true,
          showInHome: true)
    ];
  }

  @override
  services() {}

  @override
  List<SingleChildWidget> providers() {
    return [
      Provider<AppStore>(
        create: (_) => AppStore(),
        dispose: (_, store) => store.dispose(),
      ),
    ];
  }

  @override
  void routes() {
    RoutesService.addRoutes(AppsRoutes.routes);
    RoutesService.addRoutes(UserRoutes.routes);
  }
}
