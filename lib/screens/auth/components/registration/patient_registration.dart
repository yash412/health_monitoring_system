import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../../models/paitentModel.dart';
import '../../../../constants.dart';

class PatientRegistration extends StatefulWidget {
  PatientRegistration({Key? key, required this.formKey, required this.patients})
      : super(key: key);

  final GlobalKey formKey;
  final Patients patients;

  @override
  State<PatientRegistration> createState() => _PatientRegistrationState();
}

class _PatientRegistrationState extends State<PatientRegistration> {
  // List of items in our dropdown menu
  final _items = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldName(text: "Patient name"),
          TextFormField(
            decoration: const InputDecoration(
                hintText: "Enter your first and last name"),
            validator: RequiredValidator(errorText: "Patient name is required"),
            // Let's save our username
            onSaved: (username) => widget.patients.name = username!,
          ),
          const SizedBox(height: defaultPadding),
          // We will fixed the error soon
          // As you can see, it's a email field
          // But no @ on keyboard
          Row(children: [
            const Text("Blood Group"),
            const SizedBox(width: defaultPadding),
            DropdownButton(
              // Initial Value
              value: widget.patients.bloodGr,
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
                  widget.patients.bloodGr = newValue!;
                });
              },
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'male',
                  groupValue: widget.patients.gender,
                  onChanged: (value) {
                    setState(() {
                      widget.patients.gender = value!;
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
                  groupValue: widget.patients.gender,
                  onChanged: (value) {
                    setState(() {
                      widget.patients.gender = value!;
                    });
                  },
                ),
                const Text('Female'),
              ],
            )
          ]),
          const SizedBox(height: defaultPadding),

          const TextFieldName(text: "Birth Date"),
          TextFormField(
              keyboardType: TextInputType.datetime,
              // decoration: InputDecoration(hintText: "test@email.com"),
              // onTap: ()async{
              //    date = await showDatePicker(
              //       context: context,
              //       initialDate: DateTime.now(),
              //       firstDate: DateTime(1900),
              //       lastDate: DateTime(2100));
              // },
              onSaved: (bod) => widget.patients.birthDate = bod!),

          const SizedBox(height: defaultPadding),

          const TextFieldName(text: "Aadhar"),
          TextFormField(
            keyboardType: TextInputType.number,
            // decoration: InputDecoration(hintText: "test@email.com"),
            // validator: EmailValidator(errorText: "Use a valid email!"),
            onSaved: (uID) => widget.patients.aadharNo = uID!,
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
            onSaved: (phoneNumber) => widget.patients.contNo = phoneNumber!,
          ),
          const SizedBox(height: defaultPadding),

          const TextFieldName(text: "Password"),
          TextFormField(
            // We want to hide our password
            obscureText: true,
            decoration: const InputDecoration(hintText: "******"),
            validator: passwordValidator,
            onSaved: (password) => widget.patients.password = password!,
            // We also need to validate our password
            // Now if we type anything it adds that to our password
            onChanged: (pass) => widget.patients.password = pass,
          ),

          const SizedBox(height: defaultPadding),

          const TextFieldName(text: "Confirm Password"),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(hintText: "*****"),
            validator: (pass) =>
                MatchValidator(errorText: "Password do not  match")
                    .validateMatch(pass!, widget.patients.password),
          ),

          const SizedBox(height: defaultPadding),

          const TextFieldName(text: "Address"),
          TextFormField(
            keyboardType: TextInputType.streetAddress,
            // decoration: InputDecoration(hintText: "test@email.com"),
            // validator: EmailValidator(errorText: "Enter your Address"),
            onSaved: (address) => widget.patients.address = address!,
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
