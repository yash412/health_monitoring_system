import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../../db/database.dart';
import '../../../../models/doctorModel.dart';
import '../../../../constants.dart';

class DoctorRegistration extends StatefulWidget {
  DoctorRegistration({
    Key? key,
    required this.formKey,
    required this.doctors,
  }) : super(key: key);

  final GlobalKey formKey;
  final Doctors doctors;
  @override
  State<DoctorRegistration> createState() => _DoctorRegistrationState();
}

class _DoctorRegistrationState extends State<DoctorRegistration> {
  Database db = Database();
  String _gender = 'male';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldName(text: "Doctor name"),
          TextFormField(
            decoration: const InputDecoration(
                hintText: "Enter your first and last name"),
            validator: RequiredValidator(errorText: "Patient name is required"),
            // Let's save our username

            onSaved: (username) {
              widget.doctors.drName = username!;
            },
          ),

          const SizedBox(height: defaultPadding),

          const TextFieldName(text: "Clinic"),
          TextFormField(
            decoration: const InputDecoration(hintText: "Clinic Address"),
            validator: RequiredValidator(errorText: "Clinic Address required"),
            // Let's save our username

            onSaved: (address) => widget.doctors.address = address!,
          ),
          const SizedBox(height: defaultPadding),
          // We will fixed the error soon
          // As you can see, it's a email field
          // But no @ on keyboard

          Row(children: [
            Row(
              children: [
                Radio<String>(
                  value: 'male',
                  groupValue: widget.doctors.gender,
                  onChanged: (value) {
                    setState(() {
                      widget.doctors.gender = value!;
                    });
                  },
                ),
                const Text('Male'),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'female',
                  groupValue: widget.doctors.gender,
                  onChanged: (value) {
                    setState(() {
                      widget.doctors.gender = value!;
                    });
                  },
                ),
                const Text('Female'),
              ],
            ),
          ]),

          const SizedBox(height: defaultPadding),

          const TextFieldName(text: "Aadhar"),
          TextFormField(
            keyboardType: TextInputType.number,
            // decoration: InputDecoration(hintText: "test@email.com"),
            // validator: EmailValidator(errorText: "Use a valid email!"),

            onSaved: (uID) => widget.doctors.aadharNo = uID!,
          ),

          const SizedBox(height: defaultPadding),

          const TextFieldName(text: "Phone"),
          // Same for phone number
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: "+123487697"),
            validator: (String? value) {
              Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
              RegExp regex = RegExp(pattern.toString());
              if (!regex.hasMatch(value!)) {
                return 'Enter Valid mobile number';
              } else {
                return null;
              }
            },
            onSaved: (phoneNumber) => widget.doctors.contNo = phoneNumber!,
          ),

          const SizedBox(height: defaultPadding),

          const TextFieldName(text: "Password"),
          TextFormField(
            // We want to hide our password
            obscureText: true,
            decoration: const InputDecoration(hintText: "******"),
            validator: passwordValidator,

            onSaved: (password) => widget.doctors.password = password!,
            // We also need to validate our password
            // Now if we type anything it adds that to our password
            onChanged: (pass) => widget.doctors.password = pass,
          ),

          const SizedBox(height: defaultPadding),

          const TextFieldName(text: "Confirm Password"),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(hintText: "*****"),
            validator: (pass) =>
                MatchValidator(errorText: "Password do not  match")
                    .validateMatch(pass!, widget.doctors.password),
          ),
        ],
      ),
    );
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
