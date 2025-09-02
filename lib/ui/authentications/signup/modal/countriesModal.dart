class CountriesModal {
  String? msg;
  List<Data>? data;

  CountriesModal({this.msg, this.data});

  CountriesModal.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? iso2;
  String? iso3;
  String? country;
  List<String>? cities;

  Data({this.iso2, this.iso3, this.country, this.cities});

  Data.fromJson(Map<String, dynamic> json) {
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    country = json['country'];
    cities = json['cities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso2'] = iso2;
    data['iso3'] = iso3;
    data['country'] = country;
    data['cities'] = cities;
    return data;
  }
}
