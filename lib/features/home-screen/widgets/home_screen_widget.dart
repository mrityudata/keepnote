import '../../../app/index.dart';

class HomeScreenWidget extends StatefulWidget {
  final HomeScreenViewModel viewModel;
  const HomeScreenWidget({super.key,required this.viewModel});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {

  late StreamSubscription<dynamic> actionSubscription;

  @override
  void initState() {
    super.initState();
  }

  _listenForAction(){
    log("called");
    actionSubscription = GlobalActionManager().eventStream.listen( (event){
      log("isUpdated-1 ${event is HomeScreenAction}");
      if(event is HomeScreenAction){
        log("isUpdated0 ${event.isUpdated}");
        if(event.isUpdated){
          log("isUpdated1 ${event.isUpdated}");
          widget.viewModel.updateUI();
        }
      }
    } );
  }

  @override
  Widget build(BuildContext context) {
    return
       BlocProvider<HomeBloc>(
         create: (_) => widget.viewModel.homeBloc,
         child : BlocBuilder<HomeBloc, HomeState>(
           builder: (context,state) {
             if(state is HomeScreenLoadingState){
               return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,));
             }
             else if(state is HomeScreenLoadedState){
               return Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: EdgeInsets.only(
                         top: ScreenSize.height(context) * 0.018,
                         left: ScreenSize.width(context) * 0.04,
                         right: ScreenSize.width(context) * 0.04
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               "Hi Amit!",
                               style: TextStyle(
                                   fontSize: 34
                               ),
                             ),
                             Text(
                               state.dateTime,
                               style: TextStyle(
                                   fontSize: 15
                               ),
                             ),
                           ],
                         ),
                         InkWell(
                           onTap: () async {
                             final result = await Navigator.pushNamed(context, AppRoutes.addNewNote);
                             if(result == true){
                               log("rrr $result");
                               _listenForAction();
                             }
                           },
                             child: Icon(Icons.add_task_sharp,size: 30,))
                       ],
                     ),
                   ),
                   Container(
                     margin: EdgeInsets.only(left: ScreenSize.width(context) * 0.04,top: ScreenSize.height(context) * 0.07),
                     padding: EdgeInsets.symmetric(horizontal: ScreenSize.width(context) * 0.05,vertical: ScreenSize.height(context) * 0.003),
                     decoration: BoxDecoration(
                       border: Border.all(
                         color: Colors.black,
                         width: 1
                       ),
                       borderRadius: BorderRadius.circular(18)
                     ),
                     child: Text(
                       "${Strings.allWithSpace}(${widget.viewModel.count})"
                     ),
                   ),
                   SizedBox(height: ScreenSize.height(context) * 0.025,),
                   Expanded(
                     child: Container(
                       margin: EdgeInsets.symmetric(horizontal: ScreenSize.width(context) * 0.026),
                       child: GridView.builder(
                         physics: BouncingScrollPhysics(),
                         itemCount: 6,
                         scrollDirection: Axis.vertical,
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 2,
                           crossAxisSpacing: 15,
                           mainAxisSpacing: 20,
                           childAspectRatio: 0.75,
                         ),
                         itemBuilder: (BuildContext context, int index) {
                             return InkWell(
                               onTap: (){
                                 Navigator.push(context, MaterialPageRoute(
                                     builder: (_) => DetailsPage(listColor: widget.viewModel.colorListAccordingToPriority[index],heading:  widget.viewModel.priorityList[index],notesList: widget.viewModel.allNotesList[index],)
                                 )
                                 );
                               },
                               child: Container(
                                 height: ScreenSize.height(context) * 0.24,
                                 width: ScreenSize.width(context) * 0.4,
                                 decoration: BoxDecoration(
                                     color:  widget.viewModel.colorListAccordingToPriority[index],
                                     borderRadius: BorderRadius.circular(25),
                                     boxShadow: [
                                       BoxShadow(
                                         color: widget.viewModel.colorListAccordingToPriority[index],
                                         blurRadius: 1
                                       )
                                     ]
                                 ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: ScreenSize.width(context) * 0.025, top: ScreenSize.height(context) * 0.022),
                                        child: Text(widget.viewModel.priorityList[index],
                                          style: TextStyle(
                                            fontSize: 25
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: ScreenSize.width(context) * 0.03, top: ScreenSize.height(context) * 0.022),
                                        height: ScreenSize.height(context) * 0.220,
                                        child : ListView.builder(
                                          itemCount: state.allNotesList![index].length,
                                          itemBuilder: (context,subIndex){
                                            return Text(state.allNotesList![index][subIndex].title
                                            );
                                          },
                                        )
                                      )
                                    ],
                                  ),
                               ),
                             );
                         },),
                     ),
                   )
                 ],
               );
             }else{
               return SizedBox.shrink();
             }
           }
         )
       );
  }
}
