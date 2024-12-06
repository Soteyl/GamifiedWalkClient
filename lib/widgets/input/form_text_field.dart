import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool obscureText;

  const FormTextField({
    required this.label,
    required this.icon,
    required this.controller,
    this.obscureText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: Theme.of(context).colorScheme.secondary),
        prefixIcon: Icon(icon, color: Theme.of(context).colorScheme.primary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: Theme.of(context).colorScheme.primary),
      controller: controller,
    );
  }
}
