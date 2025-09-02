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
        cards!.add(Cards.fromJson(v));
      });
    }
    pageContext = json['page_context'] != null
        ? PageContext.fromJson(json['page_context'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (cards != null) {
      data['cards'] = cards!.map((v) => v.toJson()).toList();
    }
    if (pageContext != null) {
      data['page_context'] = pageContext!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['card_id'] = cardId;
    data['customer_id'] = customerId;
    data['status'] = status;
    data['last_four_digits'] = lastFourDigits;
    data['expiry_month'] = expiryMonth;
    data['expiry_year'] = expiryYear;
    data['funding'] = funding;
    data['payment_gateway'] = paymentGateway;
    data['created_time'] = createdTime;
    data['updated_time'] = updatedTime;
    data['is_primary'] = isPrimary;
    data['is_backup'] = isBackup;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['per_page'] = perPage;
    data['has_more_page'] = hasMorePage;
    data['sort_column'] = sortColumn;
    data['sort_order'] = sortOrder;
    return data;
  }
}
