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
                placeholder: 'Email',
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
            const SizedBox(height: 16),

            // Confirm password input field
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: confirmPasswordController,
                placeholder: 'Confirm Password',
                password: true,
                suffixIcon: const Icon(Icons.visibility),
                togglePasswordVisibility: () {},
              ),
            ),
            const SizedBox(height: 20),

            // Register button with increased height
            SizedBox(
              width: double.infinity,
              height: 55, // Increased button height
              child: ActionButton.instantiate(
                viewModel: ActionButtonViewModel(
                  size: ActionButtonSize.large,
                  style: ActionButtonStyle.primary,
                  text: 'Register',
                  onPressed: handleRegister,
                ),
              ),
            ),

            const SizedBox(height: 150), // Spacer to adjust text position

            // "Already have an account?" message
            LinkedLabel.instantiate(
              viewModel: LinkedLabelViewModel(
                fullText: "Already have an account? ",
                linkedText: 'Login',
                onLinkTap: handleLoginRedirect,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
