import 'package:flutter/material.dart';
import 'package:shopywell/screens/checkout/widgets/custom_textfield.dart';
import 'package:shopywell/screens/checkout/widgets/profile_image.dart';

class PersonalDetailsForm extends StatefulWidget {
  const PersonalDetailsForm({super.key});

  @override
  State<PersonalDetailsForm> createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<PersonalDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: EditableAvatar()),
          const Text(
            'Personal Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          CustomFormField(
            label: 'Email Address',
            controller: _emailController,
          ),
          const SizedBox(height: 20),
          CustomFormField(
            label: 'Password',
            controller: _passwordController,
            isPassword: true,
          ),
        ],
      ),
    );
  }
}
