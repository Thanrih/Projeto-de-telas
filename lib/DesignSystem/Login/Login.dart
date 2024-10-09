import 'package:designsystemsampleapp/DesignSystem/Login/Signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/Buttons/ActionButton/action_button.dart';
import '../Components/Buttons/ActionButton/action_button_view_model.dart';
import '../Components/InputField/input_text_view_model.dart';
import '../Components/LinkedLabel/linked_label.dart';
import '../Components/InputField/input_text.dart';
import '../Components/LinkedLabel/linked_label_view_model.dart';
import 'Perfil.dart'; // Importe a tela ProfileScreen

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
            const SizedBox(
              width: 150,
              height: 150,
              child: Center(
                child: Icon(
                  Icons.image,
                  size: 150,
                  color: CupertinoColors.systemGrey5,
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
            const SizedBox(height: 8),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
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
                  onPressed: () {
                    // Navega para a ProfileScreen quando o login for bem-sucedido
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(
                          name: "John Doe",
                          email: "john.doe@example.com",
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 150), // Spacer to adjust text position

            // "Don't Have An Account?" message
            Text('Dont have an account?'),
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
                      builder: (context) => RegisterScreen(), // Certifique-se de que a tela RegisterScreen exista
                    ),
                  );
                },
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
