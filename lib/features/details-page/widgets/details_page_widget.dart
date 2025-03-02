import 'package:keepnote/utils/common_widgets/screen_size.dart';

import '../../../app/index.dart';

class DetailsPageWidget extends StatefulWidget{
  final DetailsPageViewmodel viewmodel;
  const DetailsPageWidget({super.key,required this.viewmodel});

  @override
  State<DetailsPageWidget> createState() => _DetailsPageWidget();

}

class _DetailsPageWidget extends State<DetailsPageWidget>{
  @override
  Widget build(BuildContext context){
    return BlocProvider<DetailsBloc>(
        create: (_) => widget.viewmodel.detailsBloc,
        child: BlocBuilder<DetailsBloc,DetailsPageState>(
            builder: (context, state){
              if(state is DetailsPageLoadingState){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }else if(state is DetailsPageLoadState){
                return state.noteList.isNotEmpty ?
                  ListView.builder(
                    padding: EdgeInsets.only(top: ScreenSize.height(context) * 0.015),
                  itemCount: state.noteList.length,
                    itemBuilder: (context,index){
                      return Container(
                        height: ScreenSize.height(context) * 0.20,
                        margin: EdgeInsets.symmetric(horizontal: ScreenSize.width(context) * 0.05,vertical: ScreenSize.height(context) * 0.012),
                        decoration: BoxDecoration(
                          color: state.color,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white,width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.noteList[index].title,
                                style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),),
                              Text(
                                  state.noteList[index].description,
                                  softWrap: true,
                                  maxLines: 4,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  )
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: (){
                                      widget.viewmodel.isEditValue(context,state.noteList[index]);
                                    },
                                    child: Icon(Icons.edit,size: 20,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      );
                    }) : Center(
                  child: Text(Strings.noItemsHere,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                );
              }else{
                return SizedBox.shrink();
              }
            }
        ),
    );
  }
}