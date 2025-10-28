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
        subscriptions!.add(Subscriptions.fromJson(v));
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
    if (subscriptions != null) {
      data['subscriptions'] = subscriptions!.map((v) => v.toJson()).toList();
    }
    if (pageContext != null) {
      data['page_context'] = pageContext!.toJson();
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
  var source;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customerId;
    data['customer_name'] = customerName;
    data['email'] = email;
    data['phone'] = phone;
    data['trial_remaining_days'] = source;
    data['mobile_phone'] = mobilePhone;
    data['plan_name'] = planName;
    data['plan_code'] = planCode;
    data['pricebook_id'] = pricebookId;
    data['name'] = name;
    data['crm_owner_id'] = crmOwnerId;
    data['zcrm_potential_id'] = zcrmPotentialId;
    data['zcrm_potential_name'] = zcrmPotentialName;
    data['sub_total'] = subTotal;
    data['current_term_starts_at'] = currentTermStartsAt;
    data['current_term_ends_at'] = currentTermEndsAt;
    data['interval'] = interval;
    data['interval_unit'] = intervalUnit;
    if (customFieldHash != null) {
      data['custom_field_hash'] = customFieldHash!.toJson();
    }

    data['shipping_interval'] = shippingInterval;
    data['shipping_interval_unit'] = shippingIntervalUnit;
    data['billing_mode'] = billingMode;
    data['auto_collect'] = autoCollect;
    data['salesperson_id'] = salespersonId;
    data['salesperson_name'] = salespersonName;
    data['currency_code'] = currencyCode;
    data['currency_symbol'] = currencySymbol;
    data['coupon_duration'] = couponDuration;
    data['scheduled_cancellation_date'] = scheduledCancellationDate;
    data['subscription_id'] = subscriptionId;
    data['subscription_number'] = subscriptionNumber;
    data['is_metered_billing'] = isMeteredBilling;
    data['created_at'] = createdAt;
    data['activated_at'] = activatedAt;
    data['status'] = status;
    data['expires_at'] = expiresAt;
    data['amount'] = amount;
    data['last_billing_at'] = lastBillingAt;
    data['next_billing_at'] = nextBillingAt;
    data['total_orders'] = totalOrders;
    data['orders_created'] = ordersCreated;
    data['orders_remaining'] = ordersRemaining;
    data['pause_date'] = pauseDate;
    data['resume_date'] = resumeDate;
    data['reference_id'] = referenceId;
    data['next_shipment_at'] = nextShipmentAt;
    data['last_shipment_at'] = lastShipmentAt;
    data['created_time'] = createdTime;
    data['updated_time'] = updatedTime;
    data['next_shipment_day'] = nextShipmentDay;
    data['last_shipment_day'] = lastShipmentDay;
    data['payment_terms'] = paymentTerms;
    data['payment_terms_label'] = paymentTermsLabel;
    data['created_by'] = createdBy;
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
        searchCriteria!.add(SearchCriteria.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['per_page'] = perPage;
    data['has_more_page'] = hasMorePage;
    data['report_name'] = reportName;
    data['applied_filter'] = appliedFilter;
    data['sort_column'] = sortColumn;
    data['sort_order'] = sortOrder;
    if (searchCriteria != null) {
      data['search_criteria'] = searchCriteria!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['column_name'] = columnName;
    data['search_text'] = searchText;
    data['search_text_formatted'] = searchTextFormatted;
    data['comparator'] = comparator;
    return data;
  }
}
