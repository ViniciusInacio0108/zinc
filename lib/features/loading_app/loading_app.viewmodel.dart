import 'package:mobx/mobx.dart';
part 'loading_app.viewmodel.g.dart';

class LoadingAppViewModel = _LoadingAppViewModelBase with _$LoadingAppViewModel;

abstract class _LoadingAppViewModelBase with Store {
  @observable
  bool isLoading = false;
}
