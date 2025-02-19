abstract class HomeEvent{}

class HomeScreenLoadingEvent implements HomeEvent{

}

class HomeScreenLoadedEvent implements HomeEvent{
  String dateTime;
  HomeScreenLoadedEvent({required this.dateTime});
}