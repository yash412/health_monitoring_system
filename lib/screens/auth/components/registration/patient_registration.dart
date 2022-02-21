import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../../constants.dart';


class PatientRegistration extends StatefulWidget {
  PatientRegistration({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey formKey;

  @override
  State<PatientRegistration> createState() => _PatientRegistrationState();
}

class _PatientRegistrationState extends State<PatientRegistration> {
  late String _userName, _email, _password, _phoneNumber;

  String _selectedGender = 'male';

  String _dropdownvalue = 'A+';

  // List of items in our dropdown menu
  final _items = [
    'A+','A-','B+','B-', 'O+', 'O-','AB+', 'AB-',
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldName(text: "Patient name"),
          TextFormField(
            decoration: InputDecoration(hintText: "Enter your first and last name"),
            validator: RequiredValidator(errorText: "Patient name is required"),
            // Let's save our username
            onSaved: (username) => _userName = username!,
          ),
          const SizedBox(height: defaultPadding),
          // We will fixed the error soon
          // As you can see, it's a email field
          // But no @ on keyboard
          Row(
              children:[
                const Text("Blood Group"),
                const SizedBox(width: defaultPadding),
                DropdownButton(
                  // Initial Value
                  value: _dropdownvalue,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                   items: _items.map((String items) {
                   return DropdownMenuItem(
                     value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      _dropdownvalue = newValue!;
                  });},
                ),
                Row(
                  children: [ Radio<String>(
                    value: 'male',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                    const Text('Male'),
                  ],

                ),
                Row(
                  children: [ Radio<String>(
                    value: 'female',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                    const Text('Female'),
                  ],

                )
              ]),

          const SizedBox(height: defaultPadding),

          TextFieldName(text: "Aadhar"),
          TextFormField(
            keyboardType: TextInputType.number,
            // decoration: InputDecoration(hintText: "test@email.com"),
            validator: EmailValidator(errorText: "Use a valid email!"),
            // onSaved: (email) => _email = email!,
          ),

          const SizedBox(height: defaultPadding),

          TextFieldName(text: "Phone"),
          // Same for phone number
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: "+123487697"),
            validator: RequiredValidator(errorText: "Phone number is required"),
            onSaved: (phoneNumber) => _phoneNumber = phoneNumber!,
          ),


          const SizedBox(height: defaultPadding),

          TextFieldName(text: "Password"),
          TextFormField(
            // We want to hide our password
            obscureText: true,
            decoration: InputDecoration(hintText: "******"),
            validator: passwordValidator,
            onSaved: (password) => _password = password!,
            // We also need to validate our password
            // Now if we type anything it adds that to our password
            onChanged: (pass) => _password = pass,
          ),

          const SizedBox(height: defaultPadding),

          TextFieldName(text: "Confirm Password"),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(hintText: "*****"),
            validator: (pass) => MatchValidator(errorText: "Password do not  match").validateMatch(pass!, _password),
          ),

          const SizedBox(height: defaultPadding),

          const TextFieldName(text: "Address"),
          TextFormField(
            keyboardType: TextInputType.streetAddress,
            // decoration: InputDecoration(hintText: "test@email.com"),
            validator: EmailValidator(errorText: "Enter your Address"),
            // onSaved: (email) => _email = email!,
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
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
      ),
    );
  }
}
