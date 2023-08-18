import 'package:flutter/material.dart';
import 'package:prueba_monja/core/viewmodel/login_view_viewmodel.dart';
import 'package:prueba_monja/ui/widgets/custom_input.dart';
import 'package:prueba_monja/ui/widgets/scaffold_with_loading.dart';
import 'package:stacked/stacked.dart';

import '../widgets/custom_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ViewModelBuilder<LoginViewViewModel>.reactive(
      viewModelBuilder: () => LoginViewViewModel(),
      builder: (context, vm, child) {
        return ScaffoldWithLoading(
          backgroundColor: Colors.white60,
          showAppBar: false,
          showEndDrawer: false,
          isBusy: vm.isBusy,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Container(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                height: size.height * 0.5,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(fontSize: 20),
                    ),
                    CustomInput(
                      controller: vm.userController,
                      label: 'Email',
                    ),
                    CustomInput(
                      controller: vm.passwordController,
                      isPassword: true,
                      label: 'Password',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                            icon: const Icon(Icons.person_2_outlined),
                            label: "Log in",
                            onPressed: vm.loginController),
                        CustomButton(
                            icon: const Icon(Icons.app_registration_outlined),
                            label: "Sign up",
                            onPressed: vm.registerController),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        icon: const Icon(Icons.g_mobiledata_outlined),
                        label: "Google",
                        onPressed: vm.googleController),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
