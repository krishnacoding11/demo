import 'package:demo/presentation/screen/toDo_list_with_firebase/screen/sql_login_screen.dart';
import 'package:demo/presentation/screen/toDo_list_with_firebase/screen/sql_sign_up_screen.dart';
import 'package:flutter/material.dart';

class SqlAuthPage extends StatefulWidget {
  const SqlAuthPage({super.key});

  @override
  State<SqlAuthPage> createState() => _SqlAuthPageState();
}

class _SqlAuthPageState extends State<SqlAuthPage> {
  bool a = true;
  void to() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return SqlLoginScreen(to);
    } else {
      return SqlSignUpScreen(to);
    }
  }
}
