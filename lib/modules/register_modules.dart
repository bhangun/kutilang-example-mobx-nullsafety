import 'main_module.dart';
import '../utils/modules/module.dart';
import '../modules/kojek/ko_module.dart';
// kutilang-needle-import-module -- don't remove this line

List<Module> registerModules(){
  return [
    MainModule(),
    KoModule(),
    // kutilang-needle-add-module -- don't remove this line
  ];
}