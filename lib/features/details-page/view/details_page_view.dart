import '../../../app/index.dart';

class DetailsPage extends StatefulWidget{
  final Color listColor;
  final String heading;
  final List<NotesModel> notesList;
  const DetailsPage({super.key,required this.heading,required this.notesList,required this.listColor});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>{
  DetailsPageViewModel detailsPageViewmodel = DetailsPageViewModel();
  HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel(homeRepo: HomeRepo());

  @override
  void initState() {
    super.initState();
    detailsPageViewmodel.setDataOfList(paramNotesList: widget.notesList,color: widget.listColor,heading: widget.heading);
    detailsPageViewmodel.init();
  }
  @override
  Widget build(BuildContext context){
    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          title: Text(
            widget.heading,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          leading: InkWell(
               onTap: (){
                 Navigator.pop(context,true);
               },
              child: Icon(Icons.arrow_back_ios)
          ),
        ),
        body: DetailsPageWidget(viewmodel: detailsPageViewmodel,)
      ),
    );
  }
}