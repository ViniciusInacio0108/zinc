// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$currentPageIndexAtom =
      Atom(name: '_HomeViewModelBase.currentPageIndex', context: context);

  @override
  int get currentPageIndex {
    _$currentPageIndexAtom.reportRead();
    return super.currentPageIndex;
  }

  @override
  set currentPageIndex(int value) {
    _$currentPageIndexAtom.reportWrite(value, super.currentPageIndex, () {
      super.currentPageIndex = value;
    });
  }

  late final _$jobsAtom =
      Atom(name: '_HomeViewModelBase.jobs', context: context);

  @override
  ObservableList<dynamic> get jobs {
    _$jobsAtom.reportRead();
    return super.jobs;
  }

  @override
  set jobs(ObservableList<dynamic> value) {
    _$jobsAtom.reportWrite(value, super.jobs, () {
      super.jobs = value;
    });
  }

  late final _$isFetchingJobsAtom =
      Atom(name: '_HomeViewModelBase.isFetchingJobs', context: context);

  @override
  bool get isFetchingJobs {
    _$isFetchingJobsAtom.reportRead();
    return super.isFetchingJobs;
  }

  @override
  set isFetchingJobs(bool value) {
    _$isFetchingJobsAtom.reportWrite(value, super.isFetchingJobs, () {
      super.isFetchingJobs = value;
    });
  }

  late final _$fetchJobsAsyncAction =
      AsyncAction('_HomeViewModelBase.fetchJobs', context: context);

  @override
  Future<void> fetchJobs() {
    return _$fetchJobsAsyncAction.run(() => super.fetchJobs());
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  void setCurrentPageIndex(int i) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setCurrentPageIndex');
    try {
      return super.setCurrentPageIndex(i);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPageIndex: ${currentPageIndex},
jobs: ${jobs},
isFetchingJobs: ${isFetchingJobs}
    ''';
  }
}
