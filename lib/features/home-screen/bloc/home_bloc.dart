import '../../../app/index.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeRepo homeRepo = HomeRepo();

  HomeBloc(this.homeRepo) : super(HomeScreenLoadingState()) {

    on<HomeScreenLoadedEvent>((event, emit) {
      log("Total loads ${event.allNotesList}");
      emit(HomeScreenLoadedState(dateTime: event.dateTime, allNotesList: event.allNotesList, count: event.count));
    });

    on<AddNoteEvent>((event,emit) async {
      final response = await homeRepo.addNewNote(newNote: event.newNote);
      if(response > 0){
        emit(AddNoteState(result: response));
      }else{
        emit(AddNoteState(result: 0));
      }
    });

    on<NavigateBackEvent>((event,emit) async {
      emit(NavigateBackState());
    });
  }
}