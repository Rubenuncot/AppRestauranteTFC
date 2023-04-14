import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }

  TextFormField _customTextFormField(BuildContext context, String labelText, String hintText, IconData icon) {
    return TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: labelText,
                hintText: hintText,
                prefixIcon: Icon(icon, color: Theme.of(context).primaryColor,)
              ),

            );
  }
}