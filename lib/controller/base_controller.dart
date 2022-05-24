import 'package:get/get.dart';
import 'package:odc_hackathon/enum/view_state.dart';

class BaseController extends GetxController {
  final _state = ViewState.idle.obs;

  ViewState get state => _state.value;

  setSate(ViewState state) {
    _state.value = state;
  }
}
