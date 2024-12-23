import 'package:empregonaarea/features/first_access/widgets/create_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FirstAccesView extends StatelessWidget {
  const FirstAccesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Observer(
        builder: (context) {
          return const CreateAccount();
        },
      ),
    );
  }
}
