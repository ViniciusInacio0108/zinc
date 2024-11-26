import 'package:empregonaarea/components/custom_feedback.component.dart';
import 'package:empregonaarea/components/job_card.component.dart';
import 'package:empregonaarea/data/models/feedback.model.dart';
import 'package:empregonaarea/features/home/home.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class VacancyView extends StatelessWidget {
  VacancyView({super.key});

  final homeVM = GetIt.I.get<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return (homeVM.jobs.isEmpty)
        ? const CustomFeedback(type: FeedbackType.emptyJobsPage)
        : RefreshIndicator(
            onRefresh: () => homeVM.fetchJobs(),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: homeVM.jobs
                  .map((job) => JobCard(
                        job: job,
                      ))
                  .toList(),
            ),
          );
  }
}
