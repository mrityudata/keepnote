import '../../../app/index.dart';

class HomeScreenViewModel{
  late HomeBloc _homeBloc;
  HomeBloc get  homeBloc => _homeBloc;
  late final String todayDate;
  int count = 0;
  List<List<NotesModel>> allNotesList = [];
  List<NotesModel> urgentList = [];
  List<NotesModel> goalsList = [];
  List<NotesModel> homeList = [];
  List<NotesModel> collegeList = [];
  List<NotesModel> marketList = [];
  List<NotesModel> laterList = [];

  late StreamSubscription<dynamic> actionSubscription;


  List<String> priorityList = [Strings.urgent,Strings.myGoals,Strings.home,Strings.college,Strings.market,Strings.mayBeLater];
  List<Color> colorListAccordingToPriority = [Colors.red,Colors.purple,Colors.green,Colors.orange,Colors.yellow,Colors.blue];

  //init function
  init(){
    formatDate();
    getAllList();
    addAllList();
    _homeBloc = HomeBloc()..add(HomeScreenLoadedEvent(dateTime: todayDate,allNotesList: allNotesList,count: count));
  }
  //function to format date
  void formatDate(){
    todayDate = DateFormat('EEE, yyyy, MM, dd').format(DateTime.now());
  }

  listenForAction(){
    actionSubscription = GlobalActionManager().eventStream.listen( (event){
      if(event is HomeScreenAction){
        if(event.isUpdated){
          updateUI();
        }
      }
    } );
  }


  //get note list
  void getUrgentList() async {
    List<NotesModel> urgentData = await DatabaseHelper().getNoteList(Strings.urgent);
    urgentList.addAll(urgentData);
    count += urgentList.length;
  }

  void getGoalList() async {
    List<NotesModel> goalList = await DatabaseHelper().getNoteList(Strings.myGoals);
    goalsList.addAll(goalList);
    count += goalsList.length;
  }

  void getHomeList() async {
    List<NotesModel> homeData = await DatabaseHelper().getNoteList(Strings.home);
    homeList.addAll(homeData);
    count += homeList.length;
  }

  void getCollegeList() async {
    List<NotesModel> collegeData = await DatabaseHelper().getNoteList(Strings.college);
    collegeList.addAll(collegeData);
    count += collegeList.length;
  }

  void getMarketList() async {
    List<NotesModel> marketData = await DatabaseHelper().getNoteList(Strings.market);
    marketList.addAll(marketData);
    count += marketList.length;
  }

  void getMayBeLaterList() async {
    List<NotesModel> mayBeLaterData = await DatabaseHelper().getNoteList(Strings.mayBeLater);
    laterList.addAll(mayBeLaterData);
    count += laterList.length;
  }

  //get All List from DB
  getAllList(){
    getGoalList();
    getHomeList();
    getUrgentList();
    getCollegeList();
    getMarketList();
    getMayBeLaterList();
  }

  //Add all list in a single list
  addAllList(){
    allNotesList.add(urgentList);
    allNotesList.add(goalsList);
    allNotesList.add(homeList);
    allNotesList.add(collegeList);
    allNotesList.add(marketList);
    allNotesList.add(laterList);
  }

  void updateUI(){
    clearAllList();
    getAllList();
    addAllList();
      log("UI Updated");
      _homeBloc.add(HomeScreenLoadedEvent(dateTime: todayDate,allNotesList: allNotesList,count: count));

  }

  void clearAllList(){
     count = 0;
     urgentList.clear();
     goalsList.clear();
     homeList.clear();
     collegeList.clear();
     marketList.clear();
     laterList.clear();
     allNotesList.clear();
  }

}