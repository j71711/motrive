import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final bool? isObscure;
  final bool isFocused;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.textInputType,
    this.textInputAction,
    this.validator,
    this.readOnly,
    this.isObscure,
    this.isFocused = false,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 18,
          bottom: 12,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            TextFormField(
              controller: controller,
              keyboardType: textInputType,
              textInputAction: textInputAction,
              validator: validator,
              readOnly: readOnly ?? false,
              obscureText: isObscure ?? false,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                hintText: 'Enter your $label',
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 15,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 22,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Color(0xffD7A7D9),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Color(0xff8E1D93),
                    width: 2.6,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2.6,
                  ),
                ),
              ),
            ),

            if (isFocused)
              Positioned(
                top: -18,
                left: 22,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color(0xff8E1D93),
                      width: 2,
                    ),
                  ),
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Color(0xff8E1D93),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}