import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_validation/bloc/auth_bloc.dart';
import 'package:form_validation/home_page.dart';
import 'package:form_validation/widgets/gradientbutton.dart';
import 'package:form_validation/widgets/loginfield.dart';
import 'package:form_validation/widgets/socialButtons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();
    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
            if (state is AuthSuccess) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'SIGN IN',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Socialbuttons(
                    label: 'Continue with google',
                    iconpath: FaIcon(
                      FontAwesomeIcons.google,
                      size: 20,
                    )),
                SizedBox(
                  height: 20,
                ),
                Socialbuttons(
                    label: 'Continue with facebook',
                    iconpath: FaIcon(
                      FontAwesomeIcons.facebook,
                      size: 20,
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Or',
                  style: TextStyle(fontSize: 20),
                ),
                Loginfield(controller: emailcontroller, hinttext: 'Email'),
                SizedBox(
                  height: 20,
                ),
                Loginfield(
                    controller: passwordcontroller, hinttext: 'Password'),
                SizedBox(
                  height: 30,
                ),
                Gradientbutton(
                    buttontext: 'Sign In',
                    ontap: () {
                      context.read<AuthBloc>().add(AuthLoginRequested(
                          email: emailcontroller.text.trim(),
                          password: passwordcontroller.text.trim()));
                    })
              ],
            );
          },
        ),
      ),
    );
  }
}
