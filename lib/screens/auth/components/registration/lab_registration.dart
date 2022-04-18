import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:health_monitoring_system/models/labModel.dart';

import '../../../../constants.dart';
import '../../../constants.dart';

class labRegristration extends StatefulWidget {
  labRegristration({
    Key? key,
    required this.formKey,
    required this.labs,
  }) : super(key: key);

  final GlobalKey formKey;
  final Labs labs;

  @override
  State<labRegristration> createState() => _labRegristrationState();
}

class _labRegristrationState extends State<labRegristration> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldName(text: "Lab Name"),
          TextFormField(
            decoration: const InputDecoration(hintText: "Enter Lab Name"),
            validator: RequiredValidator(errorText: "Lab name is required"),
            // Let's save our username
            onSaved: (labname) => widget.labs.labName = labname!,
          ),
          const SizedBox(height: defaultPadding),

          const TextFieldName(text: "User Name"),
          TextFormField(
            decoration: const InputDecoration(hintText: "Enter User Name"),
            validator: RequiredValidator(errorText: "User name is required"),
            // Let's save our username
            onSaved: (username) => widget.labs.userName = username!,
          ),
          const SizedBox(height: defaultPadding),

          const TextFieldName(text: "Address"),
          TextFormField(
            decoration: const InputDecoration(hintText: "Enter Address"),
            validator: RequiredValidator(errorText: "User name is required"),
            // Let's save our username
            onSaved: (username) => widget.labs.address = username!,
          ),
          const SizedBox(height: defaultPadding),

          const TextFieldName(text: "Phone"),
          // Same for phone number
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: "+91 0123456789"),
            validator: (String? value) {
              Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
              RegExp regex = RegExp(pattern.toString());
              if (!regex.hasMatch(value!)) {
                return 'Enter Valid mobile number';
              } else {
                return null;
              }
            },
            onSaved: (phoneNumber) => widget.labs.contNo = phoneNumber!,
          ),
          const SizedBox(height: defaultPadding),

          const TextFieldName(text: "Password"),
          TextFormField(
            // We want to hide our password
            obscureText: true,
            decoration: const InputDecoration(hintText: "******"),
            validator: passwordValidator,
            onSaved: (password) => widget.labs.password = password!,
            // We also need to validate our password
            // Now if we type anything it adds that to our password
            onChanged: (pass) => widget.labs.password = pass,
          ),
          const SizedBox(height: defaultPadding),

          const TextFieldName(text: "Confirm Password"),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(hintText: "******"),
            validator: (pass) =>
                MatchValidator(errorText: "Password do not  match")
                    .validateMatch(pass!, widget.labs.password),
          ),
        ],
      ),
    );
  }

  void bookFlight(BuildContext context) {
    var alertDialog = const AlertDialog(
      title: Text("Form submitted successfully!"),
    );

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }
}

class TextFieldName extends StatelessWidget {
  const TextFieldName({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 3),
      child: Text(
        text,
        style:
            const TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
      ),
    );
  }
}
