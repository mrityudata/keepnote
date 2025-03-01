import '../../../app/index.dart';

class HomeScreenViewModel{
  late HomeBloc _homeBloc;
  HomeBloc get  homeBloc => _homeBloc;
  late final String todayDate;
  List<List<NotesModel>> allNotesList = [];
  List<NotesModel> urgentList = [];
  List<NotesModel> goalsList = [];
  List<NotesModel> homeList = [];
  List<NotesModel> collegeList = [];
  List<NotesModel> marketList = [];
  List<NotesModel> laterList = [];


  List<String> priorityList = ["Urgent","My Goals","Home","College","Market","May be later"];
  List<Color> colorListAccordingToPriority = [Colors.red,Colors.purple,Colors.green,Colors.orange,Colors.yellow,Colors.blue];

  //init function
  init(){
    formatDate();
    _homeBloc = HomeBloc()..add(HomeScreenLoadedEvent(dateTime: todayDate,goalsList: goalsList));
    getAllList();
    addAllList();
  }
  //function to format date
  void formatDate(){
    todayDate = DateFormat('EEE, yyyy, MM, dd').format(DateTime.now());
    log(todayDate);
  }

  //get note list

  void getUrgentList() async {
    List<NotesModel> urgentData = await DatabaseHelper().getNoteList("Urgent");
    urgentList.addAll(urgentData);
  }

  void getGoalList() async {
    List<NotesModel> goalList = await DatabaseHelper().getNoteList("My Goals");
    goalsList.addAll(goalList);
  }

  void getHomeList() async {
    List<NotesModel> homeData = await DatabaseHelper().getNoteList("Home");
    homeList.addAll(homeData);
  }

  void getCollegeList() async {
    List<NotesModel> collegeData = await DatabaseHelper().getNoteList("College");
    collegeList.addAll(collegeData);
  }

  void getMarketList() async {
    List<NotesModel> marketData = await DatabaseHelper().getNoteList("Market");
    marketList.addAll(marketData);
  }

  void getMayBeLaterList() async {
    List<NotesModel> mayBeLaterData = await DatabaseHelper().getNoteList("May be later");
    laterList.addAll(mayBeLaterData);
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

}