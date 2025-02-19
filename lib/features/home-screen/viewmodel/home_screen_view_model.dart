import '../../../app/index.dart';

class HomeScreenViewModel{
  late HomeBloc _homeBloc;
  HomeBloc get  homeBloc => _homeBloc;
  late final String todayDate;


  List<String> priorityList = ["Urgent","My Goals","Home","College","Market","May be later"];
  List<Color> colorListAccordingToPriority = [Colors.red,Colors.purple,Colors.green,Colors.orange,Colors.yellow,Colors.blue];

  //init function
  init(){
    formatDate();
    _homeBloc = HomeBloc()..add(HomeScreenLoadedEvent(dateTime: todayDate));
    getDatabase();
  }
  //function to format date
  void formatDate(){
    todayDate = DateFormat('EEE, yyyy, MM, dd').format(DateTime.now());
    log(todayDate);
  }

  //get note list
  void getDatabase() async {
    List<NotesModel> noteListMap = await DatabaseHelper().getNoteList("Home");
    for(var ele in noteListMap){
     print("note name ${ele.title}");
    }
  }

}