import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokeapp/core/di/injection.dart';
import 'package:pokeapp/presentation/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Pokedex App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'Fredoka',
            textTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: 14.sp),
              bodyLarge: TextStyle(fontSize: 16.sp),
              bodySmall: TextStyle(fontSize: 12.sp),
              titleLarge: TextStyle(fontSize: 20.sp),
              titleMedium: TextStyle(fontSize: 18.sp),
            ),
          ),
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: AppRoutes.home,
        );
      },
    );
  }
}
