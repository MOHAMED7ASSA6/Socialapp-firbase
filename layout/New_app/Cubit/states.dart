abstract class NewsStates {}

class NewsChangeBottomNavBar extends NewsStates {}

class NewsInitialState extends NewsStates {}
//
class NewsGetBusninessSuccessState extends NewsStates {}

class NewsGetBusninessErrorState extends NewsStates {
  final String error;

  NewsGetBusninessErrorState(this.error);
}

class NewsGetBusninessLoadingState extends NewsStates{}

//
class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates{}

//
class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates{}

//

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  final String error;

  NewsGetSearchErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsStates{}
