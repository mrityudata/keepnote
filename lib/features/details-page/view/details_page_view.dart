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
  DetailsPageViewmodel detailsPageViewmodel = DetailsPageViewmodel();

  @override
  void initState() {
    super.initState();
    detailsPageViewmodel.setDataOfList(paramNotesList: widget.notesList,color: widget.listColor);
    detailsPageViewmodel.init();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          widget.heading,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: DetailsPageWidget(viewmodel: detailsPageViewmodel,)
    );
  }
}