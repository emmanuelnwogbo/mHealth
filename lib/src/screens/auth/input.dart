import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String formType;

  Input(this.formType);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
        height: mediaQuery.size.height / 13,
        padding: const EdgeInsets.only(top: 8, left: 25, right: 8, bottom: 8),
        margin: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xFFD9D9D9),
            width: 1.5,
          ),
        ),
        child: formType == "Email Address"
            ? TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Email Address',
                    hintText: ''),
              )
            : TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: formType,
                    hintText: ''),
              ));
  }
}
