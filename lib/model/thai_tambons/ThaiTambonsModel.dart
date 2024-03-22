/// id : 100101
/// zip_code : 10200
/// name_th : "พระบรมมหาราชวัง"
/// name_en : "Phra Borom Maha Ratchawang"
/// amphure_id : 1001
/// created_at : "9/8/2019 03:33:09"
/// updated_at : "16/5/2022 06:31:31"
/// deleted_at : null

class ThaiTambonsModel {
  ThaiTambonsModel({
      num? id, 
      num? zipCode, 
      String? nameTh, 
      String? nameEn, 
      num? amphureId, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt,}){
    _id = id;
    _zipCode = zipCode;
    _nameTh = nameTh;
    _nameEn = nameEn;
    _amphureId = amphureId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
}

  ThaiTambonsModel.fromJson(dynamic json) {
    _id = json['id'];
    _zipCode = json['zip_code'];
    _nameTh = json['name_th'];
    _nameEn = json['name_en'];
    _amphureId = json['amphure_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }
  num? _id;
  num? _zipCode;
  String? _nameTh;
  String? _nameEn;
  num? _amphureId;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
ThaiTambonsModel copyWith({  num? id,
  num? zipCode,
  String? nameTh,
  String? nameEn,
  num? amphureId,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
}) => ThaiTambonsModel(  id: id ?? _id,
  zipCode: zipCode ?? _zipCode,
  nameTh: nameTh ?? _nameTh,
  nameEn: nameEn ?? _nameEn,
  amphureId: amphureId ?? _amphureId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
);
  num? get id => _id;
  num? get zipCode => _zipCode;
  String? get nameTh => _nameTh;
  String? get nameEn => _nameEn;
  num? get amphureId => _amphureId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['zip_code'] = _zipCode;
    map['name_th'] = _nameTh;
    map['name_en'] = _nameEn;
    map['amphure_id'] = _amphureId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}