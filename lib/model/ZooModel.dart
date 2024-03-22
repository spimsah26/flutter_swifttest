/// id : 1
/// name : "Elephant"
/// age : 50

class ZooModel {
  ZooModel({
      num? id, 
      String? name, 
      num? age,}){
    _id = id;
    _name = name;
    _age = age;
}

  ZooModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _age = json['age'];
  }
  num? _id;
  String? _name;
  num? _age;
ZooModel copyWith({  num? id,
  String? name,
  num? age,
}) => ZooModel(  id: id ?? _id,
  name: name ?? _name,
  age: age ?? _age,
);
  num? get id => _id;
  String? get name => _name;
  num? get age => _age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['age'] = _age;
    return map;
  }

}