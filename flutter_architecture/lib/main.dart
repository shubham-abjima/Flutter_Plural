import 'package:flutter/material.dart';
import 'package:flutter_architecture/utils/routes/routes.dart';
import 'package:flutter_architecture/utils/routes/routes_name.dart';
import 'package:flutter_architecture/view_model/auth_view_model.dart';
import 'package:flutter_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => AuthViewModel())),
        ChangeNotifierProvider(create: ((context) => UserViewModel()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.grey,
        ),
        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
