import 'package:flutter/services.dart';
import '../../../app/index.dart';

class AddNewNoteWidget extends StatefulWidget {
  final AddNewNoteViewModel viewModel;
  const AddNewNoteWidget({super.key,required this.viewModel});

  @override
  State<AddNewNoteWidget> createState() => _AddNewNoteWidgetState();
}

class _AddNewNoteWidgetState extends State<AddNewNoteWidget> {
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
                  border: Border.all(color: Colors.black,width: 1),
                  borderRadius: BorderRadius.circular(18)
                ),
                padding: EdgeInsets.only(
                    left: 15,
                  right: 10
                ),
                margin: EdgeInsets.only(
                left: 15,
                right: 25,
                top: 25
                ),
                child: DropdownButton<String>(
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
            padding: EdgeInsets.only(top: 25.0,left: 25,right: 25),
            child: TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(25)
              ],
              decoration: InputDecoration(
                hintText: Strings.title,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontSize: 32,
                )
              ),
              controller: widget.viewModel.titleController,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0,left: 25,right: 25),
            child: TextField(
              maxLines: 100,
              decoration: InputDecoration(
                  hintText: "Description",
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 23,
                  )
              ),
              controller: widget.viewModel.descController,
              style: TextStyle(
                fontSize: 18,
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
