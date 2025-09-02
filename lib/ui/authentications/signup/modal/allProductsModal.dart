class AllProductsModal {
  int? code;
  String? message;
  List<Products>? products;

  AllProductsModal({this.code, this.message, this.products});

  AllProductsModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? productId;
  String? name;
  String? description;
  String? emailIds;
  String? redirectUrl;
  String? status;
  String? createdTime;
  String? updatedTime;

  Products(
      {this.productId,
      this.name,
      this.description,
      this.emailIds,
      this.redirectUrl,
      this.status,
      this.createdTime,
      this.updatedTime});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    description = json['description'];
    emailIds = json['email_ids'];
    redirectUrl = json['redirect_url'];
    status = json['status'];
    createdTime = json['created_time'];
    updatedTime = json['updated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['name'] = name;
    data['description'] = description;
    data['email_ids'] = emailIds;
    data['redirect_url'] = redirectUrl;
    data['status'] = status;
    data['created_time'] = createdTime;
    data['updated_time'] = updatedTime;
    return data;
  }
}
