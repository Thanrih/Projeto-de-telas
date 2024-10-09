import 'package:designsystemsampleapp/DesignSystem/Login/Login.dart';

import '../Components/Buttons/ActionButton/action_button.dart';
import '../Components/Buttons/ActionButton/action_button_view_model.dart';
import '../Components/InputField/input_text.dart';
import '../Components/InputField/input_text_view_model.dart';
import '../Components/LinkedLabel/linked_label.dart';
import '../Components/LinkedLabel/linked_label_view_model.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  RegisterScreen({super.key});

  // Handles register action
  void handleRegister() {}

  // Handles login redirect
  void handleLoginRedirect() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white, // Sets background to white
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.grey[300],
              child: const Center(
                child: Icon(
                  Icons.person_add,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Email input field
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: emailController,
                placeholder: 'E-mail',
                password: false,
              ),
            ),
            const SizedBox(height: 16),

            // Password input field
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: passwordController,
                placeholder: 'Password',
                password: true,
                suffixIcon: const Icon(Icons.visibility),
                togglePasswordVisibility: () {},
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Checkbox(value:false, onChanged: null,shape: CircleBorder(),),
        LinkedLabel.instantiate(
          viewModel: LinkedLabelViewModel(
              text: 'I have read and agree',
              linkedText: ' Terms & Services',
              textSize: TextSize.small,
              textColor: TextColor.primary,
              linkedTextColor: LinkedTextColor.primary,
              textWeight: TextWeight.regular,
              textDecoration:TextDecoration.none),
        ),
              ],
            ),
            const SizedBox(height: 20),
// Checkbox for password visibility
            // Register button with increased height
            SizedBox(
              width: double.infinity,
              height: 55, // Increased button height
              child: ActionButton.instantiate(
                viewModel: ActionButtonViewModel(
                  size: ActionButtonSize.large,
                  style: ActionButtonStyle.primary,
                  text: 'Sign Up',
                  onPressed: handleRegister,
                ),
              ),
            ),

            const SizedBox(height: 150),

            // Linked label for redirect to login
        LinkedLabel.instantiate(
          viewModel: LinkedLabelViewModel(text: 'Already Have An Account?', linkedText: '', textSize: TextSize.small, textColor: TextColor.primary, linkedTextColor: LinkedTextColor.tertiary, textWeight: TextWeight.bold, textDecoration:TextDecoration.none),),
        const SizedBox(height: 20), // Space between message and Sign Up button

        // Sign Up button
        SizedBox(
          width: 90,
          child: ElevatedButton(
            onPressed: () {
              // Navegar para a tela RegisterScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(), // Certifique-se de que a tela RegisterScreen exista
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber, // Sign Up button color
              padding: const EdgeInsets.symmetric(vertical: 16), // Adjust button height
            ),
            child: const Text('Sign In'),
          ),
        ),
          ],
        ),
      ),
    );
  }
}
