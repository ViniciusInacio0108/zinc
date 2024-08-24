import 'package:flutter/material.dart';

class MyCustomTextFormField extends StatelessWidget {
  const MyCustomTextFormField({
    super.key,
    this.labelText = "",
    required this.controller,
    required this.keyboardType,
    required this.inputAction,
    required this.validatorFuncion,
  });

  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  final String? Function(String?)? validatorFuncion;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: Colors.white,
      textInputAction: inputAction,
      maxLength: 100,
      validator: validatorFuncion,
      buildCounter: (context, {required currentLength, required isFocused, required maxLength}) =>
          const SizedBox.shrink(),
      style: const TextStyle().copyWith(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle().copyWith(
          color: Colors.white,
        ),
        errorStyle: const TextStyle().copyWith(
          color: Colors.red,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
    );
  }
}
