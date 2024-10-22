import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key,
    this.hintText,
    this.iconPath,
    this.keyboardType = TextInputType.text, 
    this.controller, 
    this.validator,
    this.readOnly = false,
    this.maxLines = 1,
    this.onTap
  });

  final String? hintText;
  final String? iconPath;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool readOnly;
  final int maxLines;
  final Function()? onTap;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
   bool _obscure = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      controller: widget.controller,
      validator: widget.validator,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      obscureText: _obscure,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 14.sp,color: UiColors.greyTextColor,fontWeight: FontWeight.w500),
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.5.w),
          child: widget.keyboardType != TextInputType.visiblePassword? widget.iconPath == null ? null:SvgPicture.asset(widget.iconPath!) :
          GestureDetector(
            onTap: () {
              setState(() {
                _obscure = !_obscure;
              });
            },
              child: Icon(_obscure ? CupertinoIcons.eye_slash :  CupertinoIcons.eye)),
        )
      ),
    );
  }
}
