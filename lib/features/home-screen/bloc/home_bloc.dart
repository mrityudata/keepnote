import '../../../app/index.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc() : super(HomeScreenLoadingState()){
    on<HomeScreenLoadedEvent>((event, emit){
      emit(HomeScreenLoadedState(dateTime: event.dateTime,allNotesList: event.allNotesList,count: event.count));
    });
  }

}