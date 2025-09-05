import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/bloc/auth_bloc.dart';
import 'package:form_validation/widgets/gradientbutton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AuthSuccess) {
            final String uid = state.uid;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("UID: $uid"),
                const SizedBox(height: 20),
                Gradientbutton(
                  buttontext: 'LOGOUT',
                  ontap: () {
                    context.read<AuthBloc>().add(AuthLogout());
                  },
                ),
              ],
            );
          }
          return const Center(
            child: Text("No user data available"),
          );
        },
      ),
    );
  }
}
