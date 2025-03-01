import 'package:keepnote/features/details-page/view/details_page_view.dart';

import '../../../app/index.dart';

class HomeScreenWidget extends StatefulWidget {
  final HomeScreenViewModel viewModel;
  const HomeScreenWidget({super.key,required this.viewModel});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
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
                         top: 15,
                         left: 15,
                         right: 15
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

                             }
                           },
                             child: Icon(Icons.add_task_sharp,size: 30,))
                       ],
                     ),
                   ),
                   Container(
                     margin: EdgeInsets.only( left: 15,top: 60),
                     padding: EdgeInsets.symmetric(horizontal: 20,vertical: 3),
                     decoration: BoxDecoration(
                       border: Border.all(
                         color: Colors.black,
                         width: 1
                       ),
                       borderRadius: BorderRadius.circular(18)
                     ),
                     child: Text(
                       "All (20)"
                     ),
                   ),
                   SizedBox(height: 20,),
                   Expanded(
                     child: Container(
                       margin: EdgeInsets.symmetric(horizontal: 10),
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
                                 Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsPage()));
                               },
                               child: Container(
                                 height: 200,
                                 width: 150,
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
                                        padding: const EdgeInsets.only(left: 10,top:18.0),
                                        child: Text(
                                          widget.viewModel.priorityList[index],
                                          style: TextStyle(
                                            fontSize: 25
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(left: 10,top:18.0),
                                        height: 150,
                                        child : ListView.builder(
                                          itemCount: widget.viewModel.allNotesList[index].length,
                                          itemBuilder: (context,subIndex){
                                            return Text(
                                                widget.viewModel.allNotesList[index][subIndex].title
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
