import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/core/di/injection_container.dart';
import 'package:quiz/feature/auth/presentation/screens/splash_screen.dart';

import 'core/manager/global_cubit/global_cubit.dart';
import 'core/router/app_router.dart';
import 'core/styles/themes.dart';
import 'feature/auth/manager/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  runApp( MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => serviceLocator<GlobalCubit>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<AuthCubit>(),
      ),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(394, 852),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          theme: lightTheme,
        );
      },
    );
  }
}

