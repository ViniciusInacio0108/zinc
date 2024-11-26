enum FeedbackType {
  emptyApplicationsPage,
  emptyJobsPage,
  error400,
}

class FeedbackModel {
  FeedbackType type;

  FeedbackModel(this.type);

  String getTitle() {
    switch (type) {
      case FeedbackType.emptyApplicationsPage:
        return "Sem aplicações!";
      case FeedbackType.emptyJobsPage:
        return "Sem vagas disponíveis!";
      case FeedbackType.error400:
        return "Erro 400!";
      default:
        return "Algo inesperado aconteceu!";
    }
  }

  String getDescription() {
    switch (type) {
      case FeedbackType.emptyApplicationsPage:
        return "Aparentemente não foi possível ou não foram encontradas aplicações!";
      case FeedbackType.emptyJobsPage:
        return "Aparentemente não foi possível ou não foram encontradas vagas!";
      case FeedbackType.error400:
        return "Erro 400 aconteceu enquanto buscavamos as informações. Por favor, tente novamente mais tarde.";
      default:
        return "Algo inesperado aconteceu!";
    }
  }
}
