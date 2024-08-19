import 'package:empregonaarea/features/home/home.view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FirstLoadingView extends StatelessWidget {
  const FirstLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (kIsWeb) {
            return Center(
              child: Column(
                children: [
                  Text("Bem vindo"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ),
                      );
                    },
                    child: Text("Go to home"),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: Text("mobile"),
          );
        },
      ),
    );
  }
}
