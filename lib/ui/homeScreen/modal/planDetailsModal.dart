class PlanDetailsModal {
  var code;
  String? message;
  List<Plans>? plans;
  PageContext? pageContext;

  PlanDetailsModal({this.code, this.message, this.plans, this.pageContext});

  PlanDetailsModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(Plans.fromJson(v));
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
    if (plans != null) {
      data['plans'] = plans!.map((v) => v.toJson()).toList();
    }
    if (pageContext != null) {
      data['page_context'] = pageContext!.toJson();
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
  String? taxId;
  String? taxName;
  var taxPercentage;
  String? taxType;
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
  List<CustomFields>? customFields;

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
      this.taxId,
      this.taxName,
      this.taxPercentage,
      this.taxType,
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
      this.updatedTimeFormatted,
      this.customFields});

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
    taxId = json['tax_id'];
    taxName = json['tax_name'];
    taxPercentage = json['tax_percentage'];
    taxType = json['tax_type'];
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
        priceBrackets!.add(PriceBrackets.fromJson(v));
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
    if (json['custom_fields'] != null) {
      customFields = <CustomFields>[];
      json['custom_fields'].forEach((v) {
        customFields!.add(CustomFields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plan_code'] = planCode;
    data['plan_id'] = planId;
    data['name'] = name;
    data['product_name'] = productName;
    data['billing_mode'] = billingMode;
    data['description'] = description;
    data['status'] = status;
    data['status_formatted'] = statusFormatted;
    data['product_id'] = productId;
    data['tax_id'] = taxId;
    data['tax_name'] = taxName;
    data['tax_percentage'] = taxPercentage;
    data['tax_type'] = taxType;
    data['trial_period'] = trialPeriod;
    data['setup_fee'] = setupFee;
    data['setup_fee_account_id'] = setupFeeAccountId;
    data['setup_fee_account_name'] = setupFeeAccountName;
    data['account_id'] = accountId;
    data['account'] = account;
    data['recurring_price'] = recurringPrice;
    data['pricing_scheme'] = pricingScheme;
    data['pricing_scheme_formatted'] = pricingSchemeFormatted;
    if (priceBrackets != null) {
      data['price_brackets'] = priceBrackets!.map((v) => v.toJson()).toList();
    }
    data['unit'] = unit;
    data['interval'] = interval;
    data['interval_unit'] = intervalUnit;
    data['interval_unit_formatted'] = intervalUnitFormatted;
    data['is_usage_enabled'] = isUsageEnabled;
    data['billing_cycles'] = billingCycles;
    data['product_type'] = productType;
    data['show_in_widget'] = showInWidget;
    data['store_description'] = storeDescription;
    data['store_markup_description'] = storeMarkupDescription;
    data['url'] = url;
    data['image_id'] = imageId;
    data['shipping_interval'] = shippingInterval;
    data['shipping_interval_unit'] = shippingIntervalUnit;
    data['group_name'] = groupName;
    data['internal_name'] = internalName;
    data['is_free_plan'] = isFreePlan;
    data['created_time'] = createdTime;
    data['created_time_formatted'] = createdTimeFormatted;
    data['created_at'] = createdAt;
    data['created_at_formatted'] = createdAtFormatted;
    data['updated_time'] = updatedTime;
    data['updated_time_formatted'] = updatedTimeFormatted;
    if (customFields != null) {
      data['custom_fields'] = customFields!.map((v) => v.toJson()).toList();
    }
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    return data;
  }
}

class CustomFields {
  String? fieldId;
  String? customfieldId;
  bool? showInStore;
  bool? showInPortal;
  bool? isActive;
  var index;
  String? label;
  bool? showOnPdf;
  bool? editOnPortal;
  bool? editOnStore;
  String? apiName;
  bool? showInAllPdf;
  String? valueFormatted;
  String? searchEntity;
  String? dataType;
  String? placeholder;
  String? value;
  bool? isDependentField;

  CustomFields(
      {this.fieldId,
      this.customfieldId,
      this.showInStore,
      this.showInPortal,
      this.isActive,
      this.index,
      this.label,
      this.showOnPdf,
      this.editOnPortal,
      this.editOnStore,
      this.apiName,
      this.showInAllPdf,
      this.valueFormatted,
      this.searchEntity,
      this.dataType,
      this.placeholder,
      this.value,
      this.isDependentField});

  CustomFields.fromJson(Map<String, dynamic> json) {
    fieldId = json['field_id'];
    customfieldId = json['customfield_id'];
    showInStore = json['show_in_store'];
    showInPortal = json['show_in_portal'];
    isActive = json['is_active'];
    index = json['index'];
    label = json['label'];
    showOnPdf = json['show_on_pdf'];
    editOnPortal = json['edit_on_portal'];
    editOnStore = json['edit_on_store'];
    apiName = json['api_name'];
    showInAllPdf = json['show_in_all_pdf'];
    valueFormatted = json['value_formatted'];
    searchEntity = json['search_entity'];
    dataType = json['data_type'];
    placeholder = json['placeholder'];
    value = json['value'];
    isDependentField = json['is_dependent_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['field_id'] = fieldId;
    data['customfield_id'] = customfieldId;
    data['show_in_store'] = showInStore;
    data['show_in_portal'] = showInPortal;
    data['is_active'] = isActive;
    data['index'] = index;
    data['label'] = label;
    data['show_on_pdf'] = showOnPdf;
    data['edit_on_portal'] = editOnPortal;
    data['edit_on_store'] = editOnStore;
    data['api_name'] = apiName;
    data['show_in_all_pdf'] = showInAllPdf;
    data['value_formatted'] = valueFormatted;
    data['search_entity'] = searchEntity;
    data['data_type'] = dataType;
    data['placeholder'] = placeholder;
    data['value'] = value;
    data['is_dependent_field'] = isDependentField;
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
  List<SearchCriteria>? searchCriteria;

  PageContext(
      {this.page,
      this.perPage,
      this.hasMorePage,
      this.appliedFilter,
      this.sortColumn,
      this.sortOrder,
      this.searchCriteria});

  PageContext.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    hasMorePage = json['has_more_page'];
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
