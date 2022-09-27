import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/view/screen/change_name_screen.dart';
import 'package:today_dot/view/screen/edit_diary_screen.dart';
import 'package:today_dot/view/screen/home_screen.dart';
import 'package:today_dot/view/screen/license_screen.dart';
import 'package:today_dot/view/screen/setting_screen.dart';
import 'package:today_dot/view/screen/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:today_dot/view/screen/sign_up_screen.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
    } else {}
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => const SignInScreen()),
            GetPage(name: '/signUp', page: () => const SignUpScreen()),
            GetPage(name: '/home', page: () => const HomeScreen()),
            GetPage(name: '/setting', page: () => const SettingScreen()),
            GetPage(name: '/changeName', page: () => const ChangeNameScreen()),
            GetPage(name: '/editDiary', page: () => const EditDiaryScreen()),
            GetPage(name: '/license', page: () => const LicenseScreen()),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: const [
            Locale('ko', 'KR'),
          ],
          locale: const Locale('ko'),
          theme: ThemeData(
            primaryColor: const Color(0xff92B4EC),
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff92B4EC),
                onSurface: const Color(0xff92B4EC),
                textStyle: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        );
      },
    );
  }
}
