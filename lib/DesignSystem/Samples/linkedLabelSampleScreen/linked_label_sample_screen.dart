import 'package:designsystemsampleapp/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:flutter/material.dart';
import '../../Components/LinkedLabel/linked_label.dart';
import '../../Components/LinkedLabel/linked_label_view_model.dart';

class LinkedLabelSampleScreen extends StatelessWidget {
  const LinkedLabelSampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linked Label Sample'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LinkedLabel.instantiate(
                viewModel: LinkedLabelViewModel(
                  text: 'Você concorda com nossos ',
                  linkedText: 'termos de privacidade?',
                  textSize: TextSize.medium,
                  textColor: TextColor.primary,
                  linkedTextColor: LinkedTextColor.primary,
                  textWeight: TextWeight.regular,
                  textDecoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}