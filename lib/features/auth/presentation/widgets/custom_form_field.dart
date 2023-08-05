import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final bool? obscureText;

  const CustomFormField({
    super.key,
    this.validator,
    required this.labelText,
    this.obscureText,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool visibility = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText != null ? !visibility : false,
      decoration: InputDecoration(
        suffixIcon: widget.obscureText != null
            ? visibility
                ? InkWell(
                    onTap: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                    child: const Icon(Icons.visibility),
                  )
                : InkWell(
                    onTap: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                    child: const Icon(Icons.visibility_off),
                  )
            : null,
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Color(0xFFD0D0D0), fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w400),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFD0D0D0), width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFD0D0D0), width: 1.0),
        ),
      ),
      validator: widget.validator,
    );
  }
}
