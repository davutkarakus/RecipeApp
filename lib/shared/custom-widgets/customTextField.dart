

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/colors.dart';

class CustomTextField extends StatefulWidget {
  TextInputType? keyboardType;
  bool hasSuffixIcon=false;
  bool? passwordVisible=true;
  IconButton? suffixIconButton;
  double? iconSize;
  Color? iconColor;
  IconData? prefixIcon;
  TextEditingController? tfController;
  String? labelText;
  String? validateText;

  CustomTextField({required this.labelText, required this.validateText,required this.tfController,required this.prefixIcon,this.iconColor,this.iconSize,this.suffixIconButton,required this.passwordVisible,required this.hasSuffixIcon,required this.keyboardType});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50,top: 17),
      child: Opacity(
        opacity: 0.9,
        child: Container(
          child: TextFormField(
            keyboardType: widget.keyboardType,
            controller: widget.tfController,
            obscureText: !widget.passwordVisible!,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return widget.validateText;
              }
              return null;
            },
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              prefixIcon: Icon(
                widget.prefixIcon??Icons.person,
                color: widget.iconColor??Colors.white,
                size: widget.iconSize??18,
              ),
              suffixIcon: widget.hasSuffixIcon ? IconButton(
                icon: widget.passwordVisible! ? Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined),
                color: Colors.white,
                iconSize: 18,
                onPressed: (() {
                  setState(() {
                    widget.passwordVisible = !widget.passwordVisible!;
                  });
                }),
              ):Icon(Icons.add,size: 0,),
              border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15)),
              filled: true,
              fillColor: textFieldColor,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15)),
              labelText: widget.labelText,
              contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}


