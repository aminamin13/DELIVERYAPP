import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  CustomTextFormAuth({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.mycontroller,
    required this.iconData,
    required this.validator, 
    this.focusNode, 
    required this.keyboardType,
    required this.obscureText,
    this.onTapIcon,
  });

  final String hintText;
  final String labelText;
  final TextEditingController? mycontroller;
  final IconData iconData;
  String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool obscureText;
  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextFormField(
        validator: validator,
        keyboardType: keyboardType ,
        obscureText: obscureText,
        focusNode: focusNode ,
        controller: mycontroller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          focusColor: Colors.blue,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14),
          contentPadding:
              const EdgeInsets.only(left: 30, top: 15, bottom: 15, right: 30),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(labelText)),
          suffixIcon: InkWell(
            onTap:onTapIcon,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: Icon(
                iconData,
              ),
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
    );
  }
}
