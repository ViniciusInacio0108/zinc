import 'package:auto_size_text/auto_size_text.dart';
import 'package:empregonaarea/data/models/jobs.model.dart';
import 'package:empregonaarea/features/detailed_job/detailed_job.view.dart';
import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final JobsModel job;

  const JobCard({super.key, required this.job});

  void navigateToDetailedJob(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailedJobsView(
          job: job,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final date = DateTime.tryParse(job.created_at);

    return InkWell(
      onTap: () => navigateToDetailedJob(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: AutoSizeText(
                          job.name,
                          style: Theme.of(context).textTheme.titleLarge,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      AutoSizeText(
                        job.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          AutoSizeText(
                            "Aplicantes: ",
                            style: const TextStyle().copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          AutoSizeText(
                            job.applicants_quantity.toString(),
                            style: const TextStyle().copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          AutoSizeText(
                            "Criado em: ",
                            style: const TextStyle().copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          AutoSizeText(
                            "${date!.day}/${date.month}/${date.year}",
                            style: const TextStyle().copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
