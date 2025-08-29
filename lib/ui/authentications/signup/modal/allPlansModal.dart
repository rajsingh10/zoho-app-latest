class AllPlansModal {
  var code;
  String? message;
  List<Plans>? plans;
  PageContext? pageContext;

  AllPlansModal({this.code, this.message, this.plans, this.pageContext});

  AllPlansModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(new Plans.fromJson(v));
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
    if (this.plans != null) {
      data['plans'] = this.plans!.map((v) => v.toJson()).toList();
    }
    if (this.pageContext != null) {
      data['page_context'] = this.pageContext!.toJson();
    }
    return data;
  }
}

class Plans {
  String? planCode;
  String? planId;
  String? name;
  String? productName;
  String? billingMode;
  String? description;
  String? status;
  String? statusFormatted;
  String? productId;
  bool? isTaxable;
  String? taxExemptionId;
  String? taxExemptionCode;
  var trialPeriod;
  var setupFee;
  String? setupFeeAccountId;
  String? setupFeeAccountName;
  String? accountId;
  String? account;
  var recurringPrice;
  String? pricingScheme;
  String? pricingSchemeFormatted;
  List<PriceBrackets>? priceBrackets;
  String? unit;
  var interval;
  String? intervalUnit;
  String? intervalUnitFormatted;
  bool? isUsageEnabled;
  var billingCycles;
  String? productType;
  bool? showInWidget;
  String? storeDescription;
  String? storeMarkupDescription;
  String? url;
  String? imageId;
  var shippingInterval;
  String? shippingIntervalUnit;
  String? groupName;
  String? internalName;
  bool? isFreePlan;
  String? createdTime;
  String? createdTimeFormatted;
  String? createdAt;
  String? createdAtFormatted;
  String? updatedTime;
  String? updatedTimeFormatted;

  Plans(
      {this.planCode,
      this.planId,
      this.name,
      this.productName,
      this.billingMode,
      this.description,
      this.status,
      this.statusFormatted,
      this.productId,
      this.isTaxable,
      this.taxExemptionId,
      this.taxExemptionCode,
      this.trialPeriod,
      this.setupFee,
      this.setupFeeAccountId,
      this.setupFeeAccountName,
      this.accountId,
      this.account,
      this.recurringPrice,
      this.pricingScheme,
      this.pricingSchemeFormatted,
      this.priceBrackets,
      this.unit,
      this.interval,
      this.intervalUnit,
      this.intervalUnitFormatted,
      this.isUsageEnabled,
      this.billingCycles,
      this.productType,
      this.showInWidget,
      this.storeDescription,
      this.storeMarkupDescription,
      this.url,
      this.imageId,
      this.shippingInterval,
      this.shippingIntervalUnit,
      this.groupName,
      this.internalName,
      this.isFreePlan,
      this.createdTime,
      this.createdTimeFormatted,
      this.createdAt,
      this.createdAtFormatted,
      this.updatedTime,
      this.updatedTimeFormatted});

  Plans.fromJson(Map<String, dynamic> json) {
    planCode = json['plan_code'];
    planId = json['plan_id'];
    name = json['name'];
    productName = json['product_name'];
    billingMode = json['billing_mode'];
    description = json['description'];
    status = json['status'];
    statusFormatted = json['status_formatted'];
    productId = json['product_id'];
    isTaxable = json['is_taxable'];
    taxExemptionId = json['tax_exemption_id'];
    taxExemptionCode = json['tax_exemption_code'];
    trialPeriod = json['trial_period'];
    setupFee = json['setup_fee'];
    setupFeeAccountId = json['setup_fee_account_id'];
    setupFeeAccountName = json['setup_fee_account_name'];
    accountId = json['account_id'];
    account = json['account'];
    recurringPrice = json['recurring_price'];
    pricingScheme = json['pricing_scheme'];
    pricingSchemeFormatted = json['pricing_scheme_formatted'];
    if (json['price_brackets'] != null) {
      priceBrackets = <PriceBrackets>[];
      json['price_brackets'].forEach((v) {
        priceBrackets!.add(new PriceBrackets.fromJson(v));
      });
    }
    unit = json['unit'];
    interval = json['interval'];
    intervalUnit = json['interval_unit'];
    intervalUnitFormatted = json['interval_unit_formatted'];
    isUsageEnabled = json['is_usage_enabled'];
    billingCycles = json['billing_cycles'];
    productType = json['product_type'];
    showInWidget = json['show_in_widget'];
    storeDescription = json['store_description'];
    storeMarkupDescription = json['store_markup_description'];
    url = json['url'];
    imageId = json['image_id'];
    shippingInterval = json['shipping_interval'];
    shippingIntervalUnit = json['shipping_interval_unit'];
    groupName = json['group_name'];
    internalName = json['internal_name'];
    isFreePlan = json['is_free_plan'];
    createdTime = json['created_time'];
    createdTimeFormatted = json['created_time_formatted'];
    createdAt = json['created_at'];
    createdAtFormatted = json['created_at_formatted'];
    updatedTime = json['updated_time'];
    updatedTimeFormatted = json['updated_time_formatted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_code'] = this.planCode;
    data['plan_id'] = this.planId;
    data['name'] = this.name;
    data['product_name'] = this.productName;
    data['billing_mode'] = this.billingMode;
    data['description'] = this.description;
    data['status'] = this.status;
    data['status_formatted'] = this.statusFormatted;
    data['product_id'] = this.productId;
    data['is_taxable'] = this.isTaxable;
    data['tax_exemption_id'] = this.taxExemptionId;
    data['tax_exemption_code'] = this.taxExemptionCode;
    data['trial_period'] = this.trialPeriod;
    data['setup_fee'] = this.setupFee;
    data['setup_fee_account_id'] = this.setupFeeAccountId;
    data['setup_fee_account_name'] = this.setupFeeAccountName;
    data['account_id'] = this.accountId;
    data['account'] = this.account;
    data['recurring_price'] = this.recurringPrice;
    data['pricing_scheme'] = this.pricingScheme;
    data['pricing_scheme_formatted'] = this.pricingSchemeFormatted;
    if (this.priceBrackets != null) {
      data['price_brackets'] =
          this.priceBrackets!.map((v) => v.toJson()).toList();
    }
    data['unit'] = this.unit;
    data['interval'] = this.interval;
    data['interval_unit'] = this.intervalUnit;
    data['interval_unit_formatted'] = this.intervalUnitFormatted;
    data['is_usage_enabled'] = this.isUsageEnabled;
    data['billing_cycles'] = this.billingCycles;
    data['product_type'] = this.productType;
    data['show_in_widget'] = this.showInWidget;
    data['store_description'] = this.storeDescription;
    data['store_markup_description'] = this.storeMarkupDescription;
    data['url'] = this.url;
    data['image_id'] = this.imageId;
    data['shipping_interval'] = this.shippingInterval;
    data['shipping_interval_unit'] = this.shippingIntervalUnit;
    data['group_name'] = this.groupName;
    data['internal_name'] = this.internalName;
    data['is_free_plan'] = this.isFreePlan;
    data['created_time'] = this.createdTime;
    data['created_time_formatted'] = this.createdTimeFormatted;
    data['created_at'] = this.createdAt;
    data['created_at_formatted'] = this.createdAtFormatted;
    data['updated_time'] = this.updatedTime;
    data['updated_time_formatted'] = this.updatedTimeFormatted;
    return data;
  }
}

class PriceBrackets {
  var price;

  PriceBrackets({this.price});

  PriceBrackets.fromJson(Map<String, dynamic> json) {
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    return data;
  }
}

class PageContext {
  var page;
  var perPage;
  bool? hasMorePage;
  String? appliedFilter;
  String? sortColumn;
  String? sortOrder;

  PageContext(
      {this.page,
      this.perPage,
      this.hasMorePage,
      this.appliedFilter,
      this.sortColumn,
      this.sortOrder});

  PageContext.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    hasMorePage = json['has_more_page'];
    appliedFilter = json['applied_filter'];
    sortColumn = json['sort_column'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['has_more_page'] = this.hasMorePage;
    data['applied_filter'] = this.appliedFilter;
    data['sort_column'] = this.sortColumn;
    data['sort_order'] = this.sortOrder;
    return data;
  }
}
