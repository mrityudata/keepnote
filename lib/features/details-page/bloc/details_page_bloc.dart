import '../../../app/index.dart';

class DetailsBloc extends Bloc<DetailsPageEvent,DetailsPageState>{
  DetailsBloc() : super(DetailsPageLoadingState()){
    on<DetailsPageLoadEvent>((event,emit){
      emit(DetailsPageLoadState(noteList: event.noteList,color: event.color));
    });
  }

}