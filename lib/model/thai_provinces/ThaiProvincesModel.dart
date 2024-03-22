/// id : 1
/// name_th : "กรุงเทพมหานคร"
/// name_en : "Bangkok"
/// geography_id : 2
/// created_at : "9/8/2019 03:33:09"
/// updated_at : "16/5/2022 06:31:03"
/// deleted_at : null

class ThaiProvincesModel {
  ThaiProvincesModel({
      num? id, 
      String? nameTh, 
      String? nameEn, 
      num? geographyId, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt,}){
    _id = id;
    _nameTh = nameTh;
    _nameEn = nameEn;
    _geographyId = geographyId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
}

  ThaiProvincesModel.fromJson(dynamic json) {
    _id = json['id'];
    _nameTh = json['name_th'];
    _nameEn = json['name_en'];
    _geographyId = json['geography_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }
  num? _id;
  String? _nameTh;
  String? _nameEn;
  num? _geographyId;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
ThaiProvincesModel copyWith({  num? id,
  String? nameTh,
  String? nameEn,
  num? geographyId,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
}) => ThaiProvincesModel(  id: id ?? _id,
  nameTh: nameTh ?? _nameTh,
  nameEn: nameEn ?? _nameEn,
  geographyId: geographyId ?? _geographyId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
);
  num? get id => _id;
  String? get nameTh => _nameTh;
  String? get nameEn => _nameEn;
  num? get geographyId => _geographyId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name_th'] = _nameTh;
    map['name_en'] = _nameEn;
    map['geography_id'] = _geographyId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}