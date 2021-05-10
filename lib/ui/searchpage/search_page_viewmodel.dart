import 'package:get/get.dart';

class SearchPageViewModel extends GetxController {
  RxString resource = RxString('');
  RxBool verified = RxBool(false);
  RxString place = RxString('');
}
