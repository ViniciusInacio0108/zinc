import 'package:auto_size_text/auto_size_text.dart';
import 'package:empregonaarea/features/profile/profile.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class BottomProfileAppBar extends StatelessWidget {
  const BottomProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final profileVM = GetIt.I.get<ProfileViewModel>();

    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    profileVM.userName,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                  ),
                  AutoSizeText(
                    profileVM.workTitle,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ],
        ),
      );
    });
  }
}
