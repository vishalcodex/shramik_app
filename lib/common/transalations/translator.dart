import 'package:get/get.dart';

import 'en.dart';
import 'mr.dart';

class Translator extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en_US": En().messages,
        "mr_MAR": Mr().messages,
      };
}
