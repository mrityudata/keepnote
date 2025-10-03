import 'package:flutter/foundation.dart';
import '../../../app/index.dart';

class HomeScreenViewModel{
  late HomeBloc _homeBloc;
  final HomeRepo homeRepo;
  HomeBloc get  homeBloc => _homeBloc;
  String? todayDate;
  bool isLoading = false;
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

  HomeScreenViewModel({required this.homeRepo})
      : _homeBloc = HomeBloc(homeRepo) {
    _homeBloc.add(HomeScreenLoadedEvent(
      dateTime: DateFormat('EEE, yyyy, MM, dd').format(DateTime.now()),
      allNotesList: allNotesList,
      count: count,
    ));
  }
  //init function
  init() async {
    formatDate();
    await getAllList();
    addAllList();
  }

  clearController(){
    titleController.clear();
    descController.clear();
  }

  //function to format date
  void formatDate(){
    todayDate = DateFormat('EEE, yyyy, MM, dd').format(DateTime.now());
  }

  addNewNote(BuildContext context,HomeScreenViewModel viewModel) async {
    final routeValue = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddNewNote(viewModel: viewModel, homeBloc: _homeBloc,),
      ),
    );
    if(routeValue == true){
      if (kDebugMode) {
        print("Routes value $routeValue");
      }
      listenForAction();
    }
  }

  listenForAction([BuildContext? context]){
    actionSubscription = GlobalActionManager().eventStream.listen( (event){
      if(event is HomeScreenNavigateBackAction){
        if(event.isUpdated){
          if(context!.mounted) {
            updateUI(context);
          }
        }
      }
    } );
  }

  Future<void> updateUI(BuildContext context) async {
    try{
      isLoading = true;
      clearAllList();
      await getAllList();
      addAllList();
      _homeBloc.add(HomeScreenLoadedEvent(dateTime: todayDate ?? DateFormat('EEE, yyyy, MM, dd').format(DateTime.now()),allNotesList: allNotesList,count: count));
      Future.delayed(Duration(seconds: 1),(){
        isLoading = false;
        if(context.mounted) {
          Navigator.pop(context);
        }
      });
    }catch(e){
      debugPrint("Error : $e");
    }
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


  Future<void> getAllList() async {
    urgentList = await DatabaseHelper().getNoteList(Strings.urgent);
    count += urgentList.length;

    goalsList = await DatabaseHelper().getNoteList(Strings.myGoals);
    count += goalsList.length;

    homeList = await DatabaseHelper().getNoteList(Strings.home);
    count += homeList.length;

    collegeList = await DatabaseHelper().getNoteList(Strings.college);
    count += collegeList.length;

    marketList = await DatabaseHelper().getNoteList(Strings.market);
    count += marketList.length;

    laterList = await DatabaseHelper().getNoteList(Strings.mayBeLater);
    count += laterList.length;
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

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  List<String> priorities = [Strings.urgent, Strings.myGoals, Strings.home, Strings.college,Strings.market,Strings.mayBeLater];

  String? selectedPriority = Strings.urgent;

  dispose(){
    titleController.clear();
    descController.clear();
  }

  void setSelectedPriorityValue(String? value){
    selectedPriority = value;
  }

  void showDropDown(context){
    DropdownButton<String>(
      hint: Text(Strings.addTag),
      items: priorities.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );}
      ).toList(),
      onChanged: (String? value) {
      },
    );
  }

  bool validation(){
    if(titleController.text.isNotEmpty && descController.text.isNotEmpty && selectedPriority != null){
      return true;
    }else{
      return false;
    }
  }

  Future<void> setFinalValues(BuildContext context,HomeBloc homeBloc) async {
    final String uniqueId = Uuid().v4();
    Map<String,dynamic> noteMap = NotesModel(
        id: uniqueId,
        tag: selectedPriority!,
        title: titleController.text,
        description: descController.text,
        timeStamp: formatDateAsTimestamp()
    ).toJson();
    homeBloc.add(AddNoteEvent(newNote: noteMap));
  }

  int formatDateAsTimestamp() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  Future<void> refreshUI() async {
    try {
      isLoading = true;
      clearAllList();
      await getAllList();
      addAllList();
      _homeBloc.add(HomeScreenLoadedEvent(dateTime: todayDate ?? DateFormat('EEE, yyyy, MM, dd').format(DateTime.now()), allNotesList: allNotesList, count: count));
    } catch (e) {
      debugPrint("Error refreshing UI: $e");
    } finally {
      isLoading = false; // No delayed pop here
    }
  }

}