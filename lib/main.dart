import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slipflow/routes/routes.dart';
import 'package:slipflow/shared/theme/colors.dart';
import 'package:firebase_core/firebase_core.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(AppFirebase());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeData theme = ThemeData(
    primarySwatch: Colors.deepPurple,
    primaryColor: AppColors.colorPrimary,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: theme,
      initialRoute: '/',
    );
  }
}

class AppFirebase extends StatefulWidget {
  AppFirebase({Key? key}) : super(key: key);

  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          // return SomethingWentWrong();
          return AppError();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          //return MyAwesomeApp();
          return App();
        }
        return AppLoading();
        // Otherwise, show something whilst waiting for initialization to complete
        //return Loading();
      },
    );
  }
}

class AppError extends StatefulWidget {
  AppError({Key? key}) : super(key: key);

  @override
  _AppErrorState createState() => _AppErrorState();
}

class _AppErrorState extends State<AppError> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: Center(
          child: Text(
            "Erro ao Iniciar o App",
            style: TextStyle(color: AppColors.colorError),
          ),
        ),
      ),
    );
  }
}

class AppLoading extends StatefulWidget {
  AppLoading({Key? key}) : super(key: key);

  @override
  _AppLoadingState createState() => _AppLoadingState();
}

class _AppLoadingState extends State<AppLoading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
