class WorkStation {
  int id;
  String name;
  String status;
  String type;
  Student student;
  DateTime updatedAt;

  WorkStation( 
      {required this.id,
      required this.name,
      required this.status,
      required this.type,
      required this.student,
      required this.updatedAt});
}

class Student {
  int id;
  String name;
  String registration;

  Student({required this.id, required this.name, required this.registration});
}
