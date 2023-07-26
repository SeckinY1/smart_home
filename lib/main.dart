import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive_flutter/adapters.dart';

import 'package:provider/provider.dart';
import 'package:smart_home_system/firebase_options.dart';
import 'package:smart_home_system/model/stove.dart';
import 'package:smart_home_system/pages/login_page.dart';
import 'package:smart_home_system/services/auth_service.dart';

import 'model/lamp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StoveAdapter());
  Hive.registerAdapter(LampAdapter());

  await Hive.openBox<Stove>('stoves');
  await Hive.openBox<Lamp>('lamps');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 786),
        builder: (context, child) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
        ),
      ),
    );
  }
}
