class GetCardModal {
  int? code;
  String? message;
  List<Cards>? cards;
  PageContext? pageContext;

  GetCardModal({this.code, this.message, this.cards, this.pageContext});

  GetCardModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['cards'] != null) {
      cards = <Cards>[];
      json['cards'].forEach((v) {
        cards!.add(new Cards.fromJson(v));
      });
    }
    pageContext = json['page_context'] != null
        ? new PageContext.fromJson(json['page_context'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.cards != null) {
      data['cards'] = this.cards!.map((v) => v.toJson()).toList();
    }
    if (this.pageContext != null) {
      data['page_context'] = this.pageContext!.toJson();
    }
    return data;
  }
}

class Cards {
  String? cardId;
  String? customerId;
  String? status;
  String? lastFourDigits;
  int? expiryMonth;
  int? expiryYear;
  String? funding;
  String? paymentGateway;
  String? createdTime;
  String? updatedTime;
  bool? isPrimary;
  bool? isBackup;

  Cards(
      {this.cardId,
      this.customerId,
      this.status,
      this.lastFourDigits,
      this.expiryMonth,
      this.expiryYear,
      this.funding,
      this.paymentGateway,
      this.createdTime,
      this.updatedTime,
      this.isPrimary,
      this.isBackup});

  Cards.fromJson(Map<String, dynamic> json) {
    cardId = json['card_id'];
    customerId = json['customer_id'];
    status = json['status'];
    lastFourDigits = json['last_four_digits'];
    expiryMonth = json['expiry_month'];
    expiryYear = json['expiry_year'];
    funding = json['funding'];
    paymentGateway = json['payment_gateway'];
    createdTime = json['created_time'];
    updatedTime = json['updated_time'];
    isPrimary = json['is_primary'];
    isBackup = json['is_backup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['card_id'] = this.cardId;
    data['customer_id'] = this.customerId;
    data['status'] = this.status;
    data['last_four_digits'] = this.lastFourDigits;
    data['expiry_month'] = this.expiryMonth;
    data['expiry_year'] = this.expiryYear;
    data['funding'] = this.funding;
    data['payment_gateway'] = this.paymentGateway;
    data['created_time'] = this.createdTime;
    data['updated_time'] = this.updatedTime;
    data['is_primary'] = this.isPrimary;
    data['is_backup'] = this.isBackup;
    return data;
  }
}

class PageContext {
  int? page;
  int? perPage;
  bool? hasMorePage;
  String? sortColumn;
  String? sortOrder;

  PageContext(
      {this.page,
      this.perPage,
      this.hasMorePage,
      this.sortColumn,
      this.sortOrder});

  PageContext.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    hasMorePage = json['has_more_page'];
    sortColumn = json['sort_column'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['has_more_page'] = this.hasMorePage;
    data['sort_column'] = this.sortColumn;
    data['sort_order'] = this.sortOrder;
    return data;
  }
}
