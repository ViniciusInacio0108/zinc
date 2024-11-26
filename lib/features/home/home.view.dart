import 'package:empregonaarea/components/custom_app_bar.component.dart';
import 'package:empregonaarea/components/custom_loading.component.dart';
import 'package:empregonaarea/features/aplications/aplications.view.dart';
import 'package:empregonaarea/features/home/home.viewmodel.dart';
import 'package:empregonaarea/features/profile/profile.view.dart';
import 'package:empregonaarea/features/profile/profile_bottom_appbar.dart';
import 'package:empregonaarea/features/vacancy/vacancy.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeVM = GetIt.I.get<HomeViewModel>();

  @override
  void initState() {
    homeVM.fetchJobs();
    super.initState();
  }

  List<Widget> views = [
    VacancyView(),
    const AplicationView(),
    const ProfileView(),
  ];

  List<String> pageTitles = [
    "Vagas",
    "Aplicações",
    "",
  ];

  List<PreferredSizeWidget?> bottom = [
    null,
    null,
    PreferredSize(
      preferredSize: const Size(double.infinity, 50),
      child: BottomProfileAppBar(),
    ),
  ];

  List<Size?> sizes = [
    null,
    null,
    const Size(double.infinity, 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: MyAppBar(
            size: sizes[homeVM.currentPageIndex],
            bottom: bottom[homeVM.currentPageIndex],
            title: pageTitles[homeVM.currentPageIndex],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: (homeVM.isFetchingJobs)
                ? const Center(
                    child: MyCustomLoading(
                      color: Colors.white,
                    ),
                  )
                : views[homeVM.currentPageIndex],
          ),
          bottomNavigationBar: Observer(
            builder: (_) {
              return BottomNavigationBar(
                currentIndex: homeVM.currentPageIndex,
                onTap: (value) => homeVM.setCurrentPageIndex(value),
                backgroundColor: Theme.of(context).colorScheme.primary,
                elevation: 2,
                selectedItemColor: Colors.white,
                unselectedItemColor: Theme.of(context).colorScheme.onSecondary.withOpacity(0.8),
                items: [
                  BottomNavigationBarItem(
                    icon: (homeVM.currentPageIndex == 0) ? const Icon(Icons.home) : const Icon(Icons.home_outlined),
                    label: "Vagas",
                  ),
                  BottomNavigationBarItem(
                    icon: (homeVM.currentPageIndex == 1)
                        ? const Icon(Icons.cases_sharp)
                        : const Icon(Icons.cases_outlined),
                    label: "Aplicações",
                  ),
                  BottomNavigationBarItem(
                    icon: (homeVM.currentPageIndex == 2) ? const Icon(Icons.person) : const Icon(Icons.person_outline),
                    label: "Perfil",
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
