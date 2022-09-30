import 'package:firstapp/View/Screens/login_page.dart';
import 'package:firstapp/routes/route_manager.dart';
import 'package:firstapp/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => UserViewModel(),
              )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteManager.onGenerateRoute,
              initialRoute: RouteManager.loadingPage,
              theme: ThemeData(
                useMaterial3: true,
                textTheme:
                    GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
                primarySwatch: Colors.indigo,
              ),
              darkTheme: ThemeData.dark(),
              themeMode: currentMode,
            ),
          );
        });
  }
}
