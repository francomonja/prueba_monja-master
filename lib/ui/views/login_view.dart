import 'package:flutter/material.dart';
import 'package:prueba_monja/core/viewmodel/login_view_viewmodel.dart';
import 'package:prueba_monja/ui/widgets/custom_input.dart';
import 'package:stacked/stacked.dart';

import '../widgets/custom_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewViewModel>.reactive(
      viewModelBuilder: () => LoginViewViewModel(),
      builder: (context, vm, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomInput(
                  controller: vm.userController,
                  label: 'User',
                ),
                CustomInput(
                  controller: vm.passwordController,
                  isPassword: true,
                  label: 'Password',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(icon: Icon(Icons.person_2_outlined), label: "Log in", onPressed: vm.loginController),
                    CustomButton(icon: Icon(Icons.app_registration_outlined), label: "Sign up", onPressed: vm.registerController),
                    CustomButton(icon: Icon(Icons.g_mobiledata_outlined), label: "Google", onPressed: vm.googleController),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
