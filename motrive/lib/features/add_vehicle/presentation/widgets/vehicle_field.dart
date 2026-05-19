import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VehicleField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  final int? maxLength;
  final bool? readOnly;

  const VehicleField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType,
    this.validator,
    this.autovalidateMode,
    this.maxLength,
    this.suffix, this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      maxLength: maxLength,
      readOnly: readOnly ?? false,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
        suffixIcon: suffix,
      ),
    );
  }
}
