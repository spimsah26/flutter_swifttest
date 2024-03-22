
class UserModel {
  final int? id;
  final String name;
  final String surname;
  final int age;
  final double weight;
  final double height;
  final String address;
  final String province;
  final String aumpher;
  final String tumbon;
  final String postcode;

//<editor-fold desc="Data Methods">
  const UserModel({
    this.id,
    required this.name,
    required this.surname,
    required this.age,
    required this.weight,
    required this.height,
    required this.address,
    required this.province,
    required this.aumpher,
    required this.tumbon,
    required this.postcode,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          surname == other.surname &&
          age == other.age &&
          weight == other.weight &&
          height == other.height &&
          address == other.address &&
          province == other.province &&
          aumpher == other.aumpher &&
          tumbon == other.tumbon &&
          postcode == other.postcode);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      surname.hashCode ^
      age.hashCode ^
      weight.hashCode ^
      height.hashCode ^
      address.hashCode ^
      province.hashCode ^
      aumpher.hashCode ^
      tumbon.hashCode ^
      postcode.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
     ' id: $id,' +
      
        ' name: $name,' +
        ' surname: $surname,' +
        ' age: $age,' +
        ' weight: $weight,' +
        ' height: $height,' +
        ' address: $address,' +
        ' province: $province,' +
        ' aumpher: $aumpher,' +
        ' tumbon: $tumbon,' +
        ' postcode: $postcode,' +
        '}';
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? surname,
    int? age,
    double? weight,
    double? height,
    String? address,
    String? province,
    String? aumpher,
    String? tumbon,
    String? postcode,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      address: address ?? this.address,
      province: province ?? this.province,
      aumpher: aumpher ?? this.aumpher,
      tumbon: tumbon ?? this.tumbon,
      postcode: postcode ?? this.postcode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'surname': this.surname,
      'age': this.age,
      'weight': this.weight,
      'height': this.height,
      'address': this.address,
      'province': this.province,
      'aumpher': this.aumpher,
      'tumbon': this.tumbon,
      'postcode': this.postcode,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      surname: map['surname'] as String,
      age: map['age'] as int,
      weight: map['weight'] as double,
      height: map['height'] as double,
      address: map['address'] as String,
      province: map['province'] as String,
      aumpher: map['aumpher'] as String,
      tumbon: map['tumbon'] as String,
      postcode: map['postcode'] as String,
    );
  }

//</editor-fold>
}