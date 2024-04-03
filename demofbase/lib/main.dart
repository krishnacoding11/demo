import 'package:demo/presentation/screen/toDo_list_with_firebase/auth/main_page.dart';
import 'package:demo/presentation/screen/toDo_list_with_firebase/widgets/task_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'presentation/screen/toDo_app_with_sqLite/blocs/database_bloc.dart';

//
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyBUOlagdr7n14JvPGxUuigyTRE2LxTzRdw',
    appId: '1:452190888293:android:2c013146f7fdba8f41818c',
    messagingSenderId: '452190888293',
    projectId: 'todo-app-2500e',
    storageBucket: 'todo-app-2500e.appspot.com',
  ));
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<DatabaseBloc>(
        create: (context) => DatabaseBloc()..initDatabase(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final appTitle = 'Flutter Drawer Demo';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const TodoListScreen(),
      home: const MainPage(),
    );

    // return BlocProvider(
    //   create: (context) => InternetBloc(),
    //   child: GetMaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: appTitle,
    //     theme: ThemeData(
    //       // This is the theme of your application.
    //       //
    //       // TRY THIS: Try running your application with "flutter run". You'll see
    //       // the application has a purple toolbar. Then, without quitting the app,
    //       // try changing the seedColor in the colorScheme below to Colors.green
    //       // and then invoke "hot reload" (save your changes or press the "hot
    //       // reload" button in a Flutter-supported IDE, or press "r" if you used
    //       // the command line to start the app).
    //       //
    //       // Notice that the counter didn't reset back to zero; the application
    //       // state is not lost during the reload. To reset the state, use hot
    //       // restart instead.
    //       //
    //       // This works for code too, not just values: Most code changes can be
    //       // tested with just a hot reload.
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //     ),
    //     // home: const TodoListScreen(),
    //     home:  const BlocHomeScreen(),
    //   ),
    // );
  }
}
