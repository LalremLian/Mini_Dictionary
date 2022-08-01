import 'package:get/get.dart';
import 'package:mini_dictionary/controller/definition_page_controller.dart';

class DefinitionBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(DefinitionPageController());
  }

}