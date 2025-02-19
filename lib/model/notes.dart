class NotesModel{
  String? id;
  String tag;
  String title;
  String description;
  int timeStamp;

  NotesModel({
    this.id,
    required this.tag,
    required this.title,
    required this.description,
    required this.timeStamp
  });

  factory NotesModel.fromJson(Map<String, dynamic> json){
    return NotesModel(
      id: json['id'],
      tag: json['tag'],
      title: json['title'],
      description: json['description'],
      timeStamp: json['timeStamp'] ?? DateTime.now().millisecondsSinceEpoch,
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'tag': tag,
      'title': title,
      'description' : description,
      'timeStamp': timeStamp
    };
  }

}