import 'package:text_mask/text_mask.dart';

abstract class TextFormattingContract {
  String text = "";

  String numberFormating();
}

class TextFormating implements TextFormattingContract {
  @override
  String text;

  TextFormating(this.text);

  @override
  String numberFormating() {
    return TextMask(pallet: "(##) #####-####").getMaskedText(text);
  }
}
