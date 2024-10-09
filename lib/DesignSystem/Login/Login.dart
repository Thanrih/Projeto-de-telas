import '../Components/Buttons/ActionButton/action_button.dart';
import '../Components/Buttons/ActionButton/action_button_view_model.dart';
import '../Components/InputField/input_text.dart';
import '../Components/InputField/input_text_view_model.dart';
import '../Components/LinkedLabel/linked_label.dart';
import '../Components/LinkedLabel/linked_label_view_model.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                  Icons.person,
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
            const SizedBox(height: 8),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed:()=>null,
                child: const Text('Forgot Password'),
              ),
            ),

            const SizedBox(height: 20),

            // Login button with increased height
            SizedBox(
              width: double.infinity,
              height: 55, // Increased button height
              child: ActionButton.instantiate(
                viewModel: ActionButtonViewModel(
                  size: ActionButtonSize.large,
                  style: ActionButtonStyle.primary,
                  text: 'Login',
                  onPressed: ()=>null,
                ),
              ),
            ),

            const SizedBox(height: 150), // Spacer to adjust text position

            // "Don't Have An Account?" message
            LinkedLabel.instantiate(
              viewModel: LinkedLabelViewModel(
                fullText: "Don't have an account? ",
                linkedText: 'Sign Up',
                onLinkTap: ()=>null,
              ),
            ),
            const SizedBox(height: 20), // Space between message and Sign Up button

            // Sign Up button
            SizedBox(
              width: 90,
              child: ElevatedButton(
                onPressed: ()=>null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber, // Sign Up button color
                  padding: const EdgeInsets.symmetric(vertical: 16), // Adjust button height
                ),
                child: const Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
