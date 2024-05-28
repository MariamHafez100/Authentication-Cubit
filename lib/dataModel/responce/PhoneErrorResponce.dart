/// errors : {"value":"0101070070","msg":"accept only egypt phone numbers","param":"phone","location":"body"}

class PhoneErrorResponce {
  PhoneErrorResponce({
      this.errors,});

  PhoneErrorResponce.fromJson(dynamic json) {
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }
  Errors? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    return map;
  }

}

/// value : "0101070070"
/// msg : "accept only egypt phone numbers"
/// param : "phone"
/// location : "body"

class Errors {
  Errors({
      this.value, 
      this.msg, 
      this.param, 
      this.location,});

  Errors.fromJson(dynamic json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }
  String? value;
  String? msg;
  String? param;
  String? location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['msg'] = msg;
    map['param'] = param;
    map['location'] = location;
    return map;
  }

}