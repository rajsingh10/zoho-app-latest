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
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['email_ids'] = this.emailIds;
    data['redirect_url'] = this.redirectUrl;
    data['status'] = this.status;
    data['created_time'] = this.createdTime;
    data['updated_time'] = this.updatedTime;
    return data;
  }
}
