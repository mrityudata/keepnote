import '../../../app/index.dart';

class AddNewNoteWidget extends StatefulWidget {
  final HomeScreenViewModel viewModel;
  const AddNewNoteWidget({super.key,required this.viewModel});

  @override
  State<AddNewNoteWidget> createState() => _AddNewNoteWidgetState();
}


class _AddNewNoteWidgetState extends State<AddNewNoteWidget> {

  @override
  void initState() {
    super.initState();
    widget.viewModel.clearController();
    widget.viewModel.selectedPriority = Strings.urgent;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,width: Dim.dim_1.r),
                  borderRadius: BorderRadius.circular(18)
                ),
                padding: EdgeInsets.only(
                    left: Dim.dim_15.w,
                  right: Dim.dim_15.w,
                ),
                margin: EdgeInsets.only(
                left: Dim.dim_15.w,
                right: Dim.dim_25.w,
                top: Dim.dim_25.h,
                ),
                child: DropdownButton<String>(
                  underline: Container(),
                  dropdownColor: Theme.of(context).primaryColor,
                hint: Text(Strings.addTag),
                  value: widget.viewModel.selectedPriority,
                  items: widget.viewModel.priorities.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );}
                ).toList(),
                onChanged: (String? value) {
                  setState(() {
                    widget.viewModel.setSelectedPriorityValue(value);
                  });
                },
                          ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(top: Dim.dim_25.h,left: Dim.dim_25.w,right: Dim.dim_25.w,),
            child: TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(25)
              ],
              decoration: InputDecoration(
                hintText: Strings.title,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontSize: Dim.dim_32.sp,
                )
              ),
              controller: widget.viewModel.titleController,
              style: TextStyle(
                fontSize: Dim.dim_32.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Dim.dim_25.h,left: Dim.dim_25.w,right: Dim.dim_25.w,),
            child: TextField(
              maxLines: 100,
              decoration: InputDecoration(
                  hintText: Strings.description,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: Dim.dim_23.sp,
                  )
              ),
              controller: widget.viewModel.descController,
              style: TextStyle(
                fontSize: Dim.dim_18.sp,
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1000)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
