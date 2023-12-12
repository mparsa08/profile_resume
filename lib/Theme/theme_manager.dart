import 'package:get/get.dart';
import './theme_constants.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.toggle();
    Get.changeTheme(isDarkMode.value ? MyTheme.darkTheme : MyTheme.lightTheme);
  }
}
