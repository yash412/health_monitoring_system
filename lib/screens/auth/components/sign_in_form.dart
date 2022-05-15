import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:health_monitoring_system/screens/auth/components/registration/doctor_registration.dart';
import '../../../models/authModel.dart';
import '../../../constants.dart';
import 'sign_up_form.dart';

class SignInForm extends StatefulWidget {
  SignInForm(
      {Key? key,
      required this.formKey,
      required this.auth
  })
      : super(key: key);

  final GlobalKey formKey;
  final AuthModel auth;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // late String _email, _password;
  var items = ['Doctor', 'Patient', 'LAB'];
  String dropDownValue = 'Doctor';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: defaultPadding),
          //dropdoun
          const SizedBox(height: defaultPadding),
          const TextFieldName(text: "User Name"),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: "Aadhar/user name"),
            // validator: EmailValidator(errorText: "Use a valid email!"),
            onSaved: (email) => widget.auth.email = email!,
          ),
          const SizedBox(height: defaultPadding),
          const TextFieldName(text: "Password"),
          TextFormField(
            // We want to hide our password
            obscureText: true,
            decoration: const InputDecoration(hintText: "******"),
            validator: passwordValidator,
            onSaved: (password) async {
              widget.auth.password = password!;

            },
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
