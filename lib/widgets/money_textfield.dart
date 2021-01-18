import 'package:flutter/material.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/widgets/thousand_separator.dart';

class MoneyTextField extends StatelessWidget {
  MoneyTextField(
      {this.icon,
      @required this.label,
      this.controller,
      this.validator,
      this.textColor,
      this.backgroundColor,
      this.onChanged});
  final IconData icon;
  final String label;
  final TextEditingController controller;
  final validator;
  final Color textColor;
  final Color backgroundColor;
  final onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      inputFormatters: [
        ThousandsSeparatorInputFormatter(),
      ],
      autofocus: false,
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(
          fontSize: 25.0,
          color: textColor ?? Colors.white,
          fontWeight: FontWeight.bold),
      validator: validator,
      cursorColor: textColor ?? Colors.white,
      decoration: InputDecoration(
        errorStyle: TextStyle(
            color: backgroundColor != null ? Colors.red : Colors.yellow),
        hintStyle: TextStyle(color: textColor ?? Colors.white24),
        prefixIcon: Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            'Rp ',
            style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        filled: true,
        fillColor: backgroundColor ?? AppStyle.primaryColor.withOpacity(1.0),
        hintText: label,
        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
