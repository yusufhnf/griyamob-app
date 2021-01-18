import 'package:flutter/material.dart';
import 'package:griyabayar/utils/app_style.dart';

class RoundedTextField extends StatelessWidget {
  RoundedTextField(
      {this.icon,
      @required this.label,
      this.obsecureText,
      this.inputType,
      this.controller,
      this.prefixText,
      this.onChanged,
      this.validator});
  final IconData icon;
  final String label;
  final TextEditingController controller;
  final bool obsecureText;
  final TextInputType inputType;
  final String prefixText;
  final validator;
  final onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      obscureText: obsecureText,
      keyboardType: inputType,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixStyle: TextStyle(color: AppStyle.primaryColor),
        prefixIcon: icon != null
            ? Icon(icon, color: AppStyle.primaryColor)
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      prefixText,
                      style: TextStyle(color: AppStyle.primaryColor),
                    ),
                  )
                ],
              ),
        hintText: label,
        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
