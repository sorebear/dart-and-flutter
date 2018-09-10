import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  build(context) {
    return Provider(
      child: MaterialApp(
        title: 'Log Me In',
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Log Me In!'),
          ),
          body: LoginScreen(),
        )
      )
    );
  }
}
