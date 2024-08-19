import 'package:empregonaarea/interfaces/dependecy_injection.dart';
import 'package:empregonaarea/utils/enviroment.dart';
import 'package:empregonaarea/utils/themes.dart';
import 'package:empregonaarea/features/views.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependencieInjection();

  await Supabase.initialize(
    url: EnviromentData.SUPABASE_URL,
    anonKey: EnviromentData.SUPABASE_ANON_KEY,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zinc',
      theme: MyThemeData.themeData(),
      home: const FirstLoadingView(),
    );
  }
}