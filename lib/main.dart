import 'package:auth_app/common/bloc/auth/auth_state.dart';
import 'package:auth_app/common/bloc/auth/auth_state_cubit.dart';
import 'package:auth_app/presentation/auth/pages/signup.dart';
import 'package:auth_app/presentation/home/pages/home.dart';
import 'package:auth_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthStateCubit()..appStarted(),
      child: MaterialApp(
        // theme: AppTheme.appTheme,
        home: BlocBuilder<AuthStateCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthenticatedState) {
              return const HomePage();
            }
            if (state is UnauthenticatedState) {
              return SignupPage();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
