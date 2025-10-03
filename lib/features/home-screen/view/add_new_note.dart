import '../../../app/index.dart';

class AddNewNote extends StatefulWidget {
  final HomeScreenViewModel viewModel;
  final HomeBloc homeBloc;
  const AddNewNote({super.key,required this.viewModel,required this.homeBloc});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          Strings.addNewNote,
          style: TextStyle(
              fontSize: Dim.dim_20.sp,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: AddNewNoteWidget(viewModel: widget.viewModel,),
      floatingActionButton: BlocProvider.value(
        value: widget.viewModel.homeBloc,
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.check, size: Dim.dim_24,color: Colors.black,),
            onPressed: ()  {
              if (widget.viewModel.validation()) {
                widget.viewModel.setFinalValues(context,widget.viewModel.homeBloc);
              } else {
                  showCommonBottomSheet(context, Strings.pleaseFillRequire);
                }
              },
        ),
      ),
    );
  }
}

