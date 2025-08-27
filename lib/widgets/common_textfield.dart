import 'package:flutter/material.dart';
import 'package:todo_app/utils/extension.dart';

class CommonTextfield extends StatelessWidget {
  const CommonTextfield({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.maxLines,
    this.suffixIcon,
    this.readOnly = false,
  });

  final String title;
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: context.textTheme.titleLarge),
        SizedBox(height: 10),
        TextField(
          controller: controller,
          maxLines: maxLines,
          readOnly: readOnly,
          //here readonly true means used can not edit manually writing text or something like this
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          onChanged: (value) {},
        ),
      ],
    );
  }
}
