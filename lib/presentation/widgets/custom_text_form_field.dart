import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Icon? icon;
  final Widget? suffixIcon; 
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.obscureText,
    this.icon,
    this.suffixIcon, 
  });

  @override
  Widget build(BuildContext context) {
    final colors = const Color.fromARGB(255, 157, 157, 156);
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.white) );

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText ?? false,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors)),
        errorBorder:
            border.copyWith(borderSide: const BorderSide(color: Colors.red)),
        label: label != null
            ? Text(label!, style: const TextStyle(color: Colors.white))
            : null,
        hintText: hint,
        focusColor: colors,
        prefixIcon: icon,
        prefixIconColor: Colors.white,
        suffixIcon: suffixIcon, 
        errorText: errorMessage,
      ),
    );
  }
}
