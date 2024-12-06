import 'package:flutter/material.dart';
import 'package:gamified_walk/widgets/input/form_text_field.dart';
import 'package:provider/provider.dart';
import '../controller/login_provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  Widget _buildSignInButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'SIGN IN',
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context)
            .iconTheme
            .copyWith(color: colorScheme.onSecondaryContainer),
        title: Text(
          'Login',
          style: textTheme.titleLarge!
              .copyWith(color: colorScheme.onSecondaryContainer),
        ),
        backgroundColor: colorScheme.secondaryContainer,
      ),
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            // Синій фон
            Container(
              color: colorScheme.secondaryContainer,
            ),
            // Білий контейнер
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back',
                      style: textTheme.displaySmall!
                          .copyWith(color: colorScheme.primary),
                    ),
                    const SizedBox(height: 20),
                    FormTextField(
                      label: 'Email or Username',
                      icon: Icons.email,
                      controller: _usernameController,
                    ),
                    const SizedBox(height: 20),
                    FormTextField(
                      label: 'Password',
                      icon: Icons.lock,
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: textTheme.bodyMedium!
                              .copyWith(color: colorScheme.tertiary),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildSignInButton(context),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          loginProvider.login(_usernameController.text,
                              _passwordController.text);
                        }
                      },
                      child: Text(
                        "Don't have an account? Sign up",
                        style: textTheme.bodyMedium!
                            .copyWith(color: colorScheme.tertiary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
