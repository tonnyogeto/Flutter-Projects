class User {
  final String name;
  final String idNumber;
  const User({required this.name, required this.idNumber});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        idNumber = json['id_no'];

  Map<String,dynamic> toJson()=>{
    'name':name,
    'id_no' : idNumber
  };
}
