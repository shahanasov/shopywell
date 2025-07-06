import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/data/models/personal_details_model.dart';
import 'package:shopywell/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:shopywell/screens/checkout/checkout_screen.dart';
import 'package:shopywell/screens/profile_page/widgets/custom_textfield.dart';
import 'package:shopywell/screens/profile_page/widgets/profile_image.dart';
import 'package:shopywell/viewmodels/personal_details_viewmodel.dart';

class PersonalDetailsForm extends ConsumerStatefulWidget {
  const PersonalDetailsForm({super.key});

  @override
  ConsumerState<PersonalDetailsForm> createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends ConsumerState<PersonalDetailsForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final pincodeController = TextEditingController();
  final addressController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final accountNumberController = TextEditingController();
  final nameController = TextEditingController();
  final ifscController = TextEditingController();
  @override
  Widget build(BuildContext context,) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: EditableAvatar()),
          const Text(
            'Personal Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          // const SizedBox(height: 20),
          CustomFormField(label: 'Email Address', controller: emailController),
          // const SizedBox(height: 20),
          CustomFormField(
            label: 'Password',
            controller: passwordController,
            isPassword: true,
          ),
           Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Change Password",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                           decorationColor: AppColors.accentRed,
                           decorationThickness: 2,
                        color: AppColors.accentRed),
                    ),
                  ),
                ),
          Divider(thickness: 1),
          const Text(
            'Business Address Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CustomFormField(
            label: 'Pincode',
            controller: pincodeController,
            isPassword: false,
          ),
          CustomFormField(
            label: 'Address',
            controller: addressController,
            isPassword: false,
          ),
          CustomFormField(
            label: 'City',
            controller: cityController,
            isPassword: false,
          ),
          CustomFormField(
            label: 'State',
            controller: stateController,
            isPassword: false,
          ),
          CustomFormField(
            label: 'Country',
            controller: countryController,
            isPassword: false,
          ),
          Divider(thickness: 1),
          const Text(
            'Bank Account Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CustomFormField(
            label: 'Bank Account Number',
            controller: accountNumberController,
            isPassword: false,
          ),
          CustomFormField(
            label: 'Account Holder’s Name',
            controller: nameController,
            isPassword: false,
          ),
          CustomFormField(
            label: 'IFSC Code',
            controller: ifscController,
            isPassword: false,
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final viewModel = ref.read(personalDetailsViewModelProvider);

                  final model = PersonalDetailsModel(
                    email: emailController.text,
                    password: passwordController.text,
                    pincode: pincodeController.text,
                    address: addressController.text,
                    city: cityController.text,
                    state: stateController.text,
                    country: countryController.text,
                    accountNumber: accountNumberController.text,
                    name: nameController.text,
                    ifsc: ifscController.text,
                  );

                  await viewModel.saveDetails(model);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Details Saved Successfully")),
                  );

                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CheckoutScreen()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentRed,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text("Save", style: GoogleFonts.montserrat()),
            ),
          ),
        ],
      ),
    );
  }
}
