import 'package:auto_size_text/auto_size_text.dart';
import 'package:empregonaarea/components/custom_app_bar.component.dart';
import 'package:empregonaarea/components/custom_loading.component.dart';
import 'package:empregonaarea/components/job_map_location.component.dart';
import 'package:empregonaarea/data/models/jobs.model.dart';
import 'package:empregonaarea/features/detailed_job/detailed_job.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong2/latlong.dart';

class DetailedJobsView extends StatefulWidget {
  final JobsModel job;

  const DetailedJobsView({super.key, required this.job});

  @override
  State<DetailedJobsView> createState() => _DetailedJobsViewState();
}

class _DetailedJobsViewState extends State<DetailedJobsView> {
  final companyVM = GetIt.I.get<DetailedJobsViewModel>();

  @override
  void initState() {
    companyVM.fetchCompanyById(widget.job.companyId ?? "");
    super.initState();
  }

  Future<void> aplyForJob() async {}

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: MyAppBar(title: widget.job.name),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              child: FloatingActionButton.extended(
                elevation: 0,
                splashColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {},
                label: Text(
                  "Aplicar",
                  style: const TextStyle().copyWith(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          body: (companyVM.isFetchingData)
              ? const Center(
                  child: MyCustomLoading(),
                )
              : Padding(
                  padding: const EdgeInsets.all(24),
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            maxRadius: 30,
                            minRadius: 26,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  companyVM.currentCompany.name,
                                  maxFontSize: 18,
                                  minFontSize: 16,
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                AutoSizeText(
                                  "${widget.job.formatedJobType()} - Presencial",
                                  maxFontSize: 14,
                                  minFontSize: 12,
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AutoSizeText(
                        "Localização",
                        maxFontSize: 24,
                        minFontSize: 20,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      JobMapLocation(
                        initialCenter: LatLng(double.tryParse(widget.job.latitude ?? "0.0") ?? 0.0,
                            double.tryParse(widget.job.longitude ?? "0.0") ?? 0.0),
                        height: 150,
                      ),
                      AutoSizeText(
                        "Sobre a vaga",
                        maxFontSize: 24,
                        minFontSize: 20,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AutoSizeText(
                        widget.job.description,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
