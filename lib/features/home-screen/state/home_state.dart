abstract class HomeState{}

class HomeScreenLoadingState implements HomeState{

}

class HomeScreenLoadedState implements HomeState{
  String dateTime;
  HomeScreenLoadedState({required this.dateTime});
}