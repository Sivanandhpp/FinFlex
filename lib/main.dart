
import 'package:finflex/core/globalvalues/theme_color.dart';
import 'package:finflex/core/globalvalues/user_data.dart';
import 'package:finflex/core/services/auth_service.dart';
import 'package:finflex/core/services/routing_service.dart';
import 'package:finflex/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences spInstance;
late DatabaseReference dbReference;
final userData = UserData();

void main() async {
 

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  spInstance = await SharedPreferences.getInstance();
  dbReference = FirebaseDatabase.instance.ref();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: ThemeColor.scaffoldBgColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: ThemeColor.scaffoldBgColor,
      statusBarIconBrightness: Brightness.dark));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FinFlex',
          theme: ThemeData(
            scaffoldBackgroundColor: ThemeColor.scaffoldBgColor,
            primarySwatch: Colors.blue,
          ),
          home: RoutingService()),
    );
  }
}
