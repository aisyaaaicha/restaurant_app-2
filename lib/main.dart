import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/providers.dart';
import 'common/style.dart';

import 'common/navigation.dart';
import 'data/api/api_service.dart';

import 'data/models/models.dart';
import 'pages/pages.dart';
import 'utils/utils.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  _service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RestaurantsProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchRestaurantsProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider(create: (_) => SchedulingProvider()),
      ],
      child: Consumer(
        builder: (context, provider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ThemeData.light().colorScheme.copyWith(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    secondary: yellow,
                  ),
              scaffoldBackgroundColor: Colors.white,
              dividerColor: Colors.transparent,
              textTheme: textTheme,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              appBarTheme: const AppBarTheme(
                elevation: 0,
                color: Colors.white,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: yellow,
                unselectedItemColor: Colors.grey,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: yellow,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 10.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
            ),
            navigatorKey: navigatorKey,
            initialRoute: StartScreen.routeName,
            routes: {
              StartScreen.routeName: (context) => const StartScreen(),
              MainScreen.routeName: (context) => const MainScreen(),
              DetailScreen.routeName: (context) => DetailScreen(
                    restaurant: ModalRoute.of(context)?.settings.arguments
                        as Restaurant,
                  ),
              SearchScreen.routeName: (context) => const SearchScreen(),
              SettingScreen.routeName: (context) => const SettingScreen(),
            },
          );
        },
      ),
    );
  }
}
