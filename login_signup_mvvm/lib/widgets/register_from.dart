import 'package:firstapp/misc/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../misc/validators.dart';
import '../view_models/user_view_model.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<UserViewModel>().registerFormKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "First App",
                style: titleStyleIndigo,
              ),
              const SizedBoxH20(),
              TextFormField(
                validator: validateName,
                controller: nameController,
                decoration: formDecoration(
                  "Name",
                  Icons.person_outline,
                ),
              ),
              const SizedBoxH10(),
              TextFormField(
                validator: validateEmail,
                controller: emailController,
                decoration: formDecoration(
                  "Email address",
                  Icons.mail_outline,
                ),
              ),
              const SizedBoxH10(),
              TextFormField(
                validator: validatePassword,
                controller: passwordController,
                obscureText: true,
                decoration: formDecoration(
                  "Password",
                  Icons.lock_outline,
                ),
              ),
              const SizedBoxH10(),
              TextFormField(
                validator: validateConfirmPassword,
                controller: confirmPasswordController,
                obscureText: true,
                decoration: formDecoration(
                  "Confirm password",
                  Icons.lock_outline,
                ),
              ),
              const SizedBoxH20(),
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.indigo,
                  child: const Text(
                    'Sign up',
                    style: style16White,
                  ),
                  onPressed: () {
                    context.read<UserViewModel>().createUserInUI(context,
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        confirmPassword: confirmPasswordController.text.trim());
                  }),
            ],
          ),
        ));
  }
}
