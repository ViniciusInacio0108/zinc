import 'package:mobx/mobx.dart';
part 'onboarding.viewmodel.g.dart';

class OnboardingViewModel = _OnboardingViewModelBase with _$OnboardingViewModel;

enum ClientType {
  EMPLOYEE,
  EMPLOYER,
}

abstract class _OnboardingViewModelBase with Store {
  @observable
  ClientType _currentClientType = ClientType.EMPLOYEE;

  @computed
  ClientType get currentClientType => _currentClientType;

  @action
  void setCurrentClientType(ClientType type) {
    _currentClientType = type;
  }
}
