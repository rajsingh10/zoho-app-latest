class SingleDepartmentModal {
  String? id;
  String? name;
  String? description;
  bool? isDefault;

  SingleDepartmentModal({this.id, this.name, this.description, this.isDefault});

  SingleDepartmentModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['isDefault'] = this.isDefault;
    return data;
  }
}
