class SubscriptionsDateModal {
  var code;
  String? message;
  List<Subscriptions>? subscriptions;
  PageContext? pageContext;

  SubscriptionsDateModal(
      {this.code, this.message, this.subscriptions, this.pageContext});

  SubscriptionsDateModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['subscriptions'] != null) {
      subscriptions = <Subscriptions>[];
      json['subscriptions'].forEach((v) {
        subscriptions!.add(new Subscriptions.fromJson(v));
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
    if (this.subscriptions != null) {
      data['subscriptions'] =
          this.subscriptions!.map((v) => v.toJson()).toList();
    }
    if (this.pageContext != null) {
      data['page_context'] = this.pageContext!.toJson();
    }
    return data;
  }
}

class Subscriptions {
  String? customerId;
  String? customerName;
  String? email;
  String? phone;
  String? mobilePhone;
  String? planName;
  String? planCode;
  String? pricebookId;
  String? name;
  String? crmOwnerId;
  String? zcrmPotentialId;
  String? zcrmPotentialName;
  var subTotal;
  String? currentTermStartsAt;
  String? currentTermEndsAt;
  var interval;
  String? intervalUnit;
  var shippingInterval;
  String? shippingIntervalUnit;
  String? billingMode;
  bool? autoCollect;
  String? salespersonId;
  String? salespersonName;
  String? currencyCode;
  String? currencySymbol;
  String? couponDuration;
  String? scheduledCancellationDate;
  String? subscriptionId;
  String? subscriptionNumber;
  bool? isMeteredBilling;
  String? createdAt;
  String? activatedAt;
  String? trialendsat;
  String? status;
  String? expiresAt;
  var amount;
  String? lastBillingAt;
  String? nextBillingAt;
  String? totalOrders;
  String? ordersCreated;
  String? ordersRemaining;
  String? pauseDate;
  int? source;
  String? resumeDate;
  String? referenceId;
  String? nextShipmentAt;
  String? lastShipmentAt;
  String? createdTime;
  String? updatedTime;
  String? nextShipmentDay;
  String? lastShipmentDay;
  var paymentTerms;
  String? paymentTermsLabel;
  String? createdBy;
  CustomFieldHash? customFieldHash;

  Subscriptions(
      {this.customerId,
      this.customerName,
      this.email,
      this.phone,
      this.mobilePhone,
      this.planName,
      this.planCode,
      this.pricebookId,
      this.name,
      this.crmOwnerId,
      this.source,
      this.zcrmPotentialId,
      this.zcrmPotentialName,
      this.subTotal,
      this.currentTermStartsAt,
      this.currentTermEndsAt,
      this.interval,
      this.intervalUnit,
      this.shippingInterval,
      this.shippingIntervalUnit,
      this.billingMode,
      this.autoCollect,
      this.salespersonId,
      this.salespersonName,
      this.currencyCode,
      this.currencySymbol,
      this.couponDuration,
      this.scheduledCancellationDate,
      this.subscriptionId,
      this.subscriptionNumber,
      this.isMeteredBilling,
      this.createdAt,
      this.activatedAt,
      this.trialendsat,
      this.status,
      this.expiresAt,
      this.amount,
      this.lastBillingAt,
      this.nextBillingAt,
      this.totalOrders,
      this.ordersCreated,
      this.ordersRemaining,
      this.pauseDate,
      this.resumeDate,
      this.referenceId,
      this.nextShipmentAt,
      this.lastShipmentAt,
      this.createdTime,
      this.updatedTime,
      this.nextShipmentDay,
      this.lastShipmentDay,
      this.paymentTerms,
      this.paymentTermsLabel,
      this.customFieldHash,
      this.createdBy});

  Subscriptions.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    email = json['email'];
    customFieldHash = json['custom_field_hash'] != null
        ? CustomFieldHash.fromJson(json['custom_field_hash'])
        : null;

    phone = json['phone'];
    mobilePhone = json['mobile_phone'];
    planName = json['plan_name'];
    planCode = json['plan_code'];
    pricebookId = json['pricebook_id'];
    name = json['name'];
    source = json['trial_remaining_days'];
    crmOwnerId = json['crm_owner_id'];
    zcrmPotentialId = json['zcrm_potential_id'];
    zcrmPotentialName = json['zcrm_potential_name'];
    subTotal = json['sub_total'];
    currentTermStartsAt = json['current_term_starts_at'];
    currentTermEndsAt = json['current_term_ends_at'];
    interval = json['interval'];
    intervalUnit = json['interval_unit'];
    shippingInterval = json['shipping_interval'];
    shippingIntervalUnit = json['shipping_interval_unit'];
    billingMode = json['billing_mode'];
    autoCollect = json['auto_collect'];
    salespersonId = json['salesperson_id'];
    salespersonName = json['salesperson_name'];
    currencyCode = json['currency_code'];
    currencySymbol = json['currency_symbol'];
    couponDuration = json['coupon_duration'];
    scheduledCancellationDate = json['scheduled_cancellation_date'];
    subscriptionId = json['subscription_id'];
    subscriptionNumber = json['subscription_number'];
    isMeteredBilling = json['is_metered_billing'];
    createdAt = json['created_at'];
    activatedAt = json['activated_at'];
    trialendsat = json['trial_ends_at'];
    status = json['status'];
    expiresAt = json['expires_at'];
    amount = json['amount'];
    lastBillingAt = json['last_billing_at'];
    nextBillingAt = json['next_billing_at'];
    totalOrders = json['total_orders'];
    ordersCreated = json['orders_created'];
    ordersRemaining = json['orders_remaining'];
    pauseDate = json['pause_date'];
    resumeDate = json['resume_date'];
    referenceId = json['reference_id'];
    nextShipmentAt = json['next_shipment_at'];
    lastShipmentAt = json['last_shipment_at'];
    createdTime = json['created_time'];
    updatedTime = json['updated_time'];
    nextShipmentDay = json['next_shipment_day'];
    lastShipmentDay = json['last_shipment_day'];
    paymentTerms = json['payment_terms'];
    paymentTermsLabel = json['payment_terms_label'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['trial_remaining_days'] = this.source;
    data['mobile_phone'] = this.mobilePhone;
    data['plan_name'] = this.planName;
    data['plan_code'] = this.planCode;
    data['pricebook_id'] = this.pricebookId;
    data['name'] = this.name;
    data['crm_owner_id'] = this.crmOwnerId;
    data['zcrm_potential_id'] = this.zcrmPotentialId;
    data['zcrm_potential_name'] = this.zcrmPotentialName;
    data['sub_total'] = this.subTotal;
    data['current_term_starts_at'] = this.currentTermStartsAt;
    data['current_term_ends_at'] = this.currentTermEndsAt;
    data['interval'] = this.interval;
    data['interval_unit'] = this.intervalUnit;
    if (customFieldHash != null) {
      data['custom_field_hash'] = customFieldHash!.toJson();
    }

    data['shipping_interval'] = this.shippingInterval;
    data['shipping_interval_unit'] = this.shippingIntervalUnit;
    data['billing_mode'] = this.billingMode;
    data['auto_collect'] = this.autoCollect;
    data['salesperson_id'] = this.salespersonId;
    data['salesperson_name'] = this.salespersonName;
    data['currency_code'] = this.currencyCode;
    data['currency_symbol'] = this.currencySymbol;
    data['coupon_duration'] = this.couponDuration;
    data['scheduled_cancellation_date'] = this.scheduledCancellationDate;
    data['subscription_id'] = this.subscriptionId;
    data['subscription_number'] = this.subscriptionNumber;
    data['is_metered_billing'] = this.isMeteredBilling;
    data['created_at'] = this.createdAt;
    data['activated_at'] = this.activatedAt;
    data['status'] = this.status;
    data['expires_at'] = this.expiresAt;
    data['amount'] = this.amount;
    data['last_billing_at'] = this.lastBillingAt;
    data['next_billing_at'] = this.nextBillingAt;
    data['total_orders'] = this.totalOrders;
    data['orders_created'] = this.ordersCreated;
    data['orders_remaining'] = this.ordersRemaining;
    data['pause_date'] = this.pauseDate;
    data['resume_date'] = this.resumeDate;
    data['reference_id'] = this.referenceId;
    data['next_shipment_at'] = this.nextShipmentAt;
    data['last_shipment_at'] = this.lastShipmentAt;
    data['created_time'] = this.createdTime;
    data['updated_time'] = this.updatedTime;
    data['next_shipment_day'] = this.nextShipmentDay;
    data['last_shipment_day'] = this.lastShipmentDay;
    data['payment_terms'] = this.paymentTerms;
    data['payment_terms_label'] = this.paymentTermsLabel;
    data['created_by'] = this.createdBy;
    return data;
  }
}

class CustomFieldHash {
  String? cfStartDateTime;
  String? cfStartDateTimeUnformatted;

  CustomFieldHash({this.cfStartDateTime, this.cfStartDateTimeUnformatted});

  CustomFieldHash.fromJson(Map<String, dynamic> json) {
    cfStartDateTime = json['cf_start_date_time'];
    cfStartDateTimeUnformatted = json['cf_start_date_time_unformatted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cf_start_date_time'] = cfStartDateTime;
    data['cf_start_date_time_unformatted'] = cfStartDateTimeUnformatted;
    return data;
  }
}

class PageContext {
  var page;
  var perPage;
  bool? hasMorePage;
  String? reportName;
  String? appliedFilter;
  String? sortColumn;
  String? sortOrder;
  List<SearchCriteria>? searchCriteria;

  PageContext(
      {this.page,
      this.perPage,
      this.hasMorePage,
      this.reportName,
      this.appliedFilter,
      this.sortColumn,
      this.sortOrder,
      this.searchCriteria});

  PageContext.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    hasMorePage = json['has_more_page'];
    reportName = json['report_name'];
    appliedFilter = json['applied_filter'];
    sortColumn = json['sort_column'];
    sortOrder = json['sort_order'];
    if (json['search_criteria'] != null) {
      searchCriteria = <SearchCriteria>[];
      json['search_criteria'].forEach((v) {
        searchCriteria!.add(new SearchCriteria.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['has_more_page'] = this.hasMorePage;
    data['report_name'] = this.reportName;
    data['applied_filter'] = this.appliedFilter;
    data['sort_column'] = this.sortColumn;
    data['sort_order'] = this.sortOrder;
    if (this.searchCriteria != null) {
      data['search_criteria'] =
          this.searchCriteria!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchCriteria {
  String? columnName;
  String? searchText;
  String? searchTextFormatted;
  String? comparator;

  SearchCriteria(
      {this.columnName,
      this.searchText,
      this.searchTextFormatted,
      this.comparator});

  SearchCriteria.fromJson(Map<String, dynamic> json) {
    columnName = json['column_name'];
    searchText = json['search_text'];
    searchTextFormatted = json['search_text_formatted'];
    comparator = json['comparator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['column_name'] = this.columnName;
    data['search_text'] = this.searchText;
    data['search_text_formatted'] = this.searchTextFormatted;
    data['comparator'] = this.comparator;
    return data;
  }
}
