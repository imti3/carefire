class NoteModel{

  String? id;
  String? title;
  String? description;

  NoteModel({this.id,this.title,this.description});

  factory NoteModel.fromJson(Map<String, dynamic> json)
  {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],

    );
  }

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'title':title,
      'description':description,

    };
  }

}