class checkEmailModal {
  var code;
  String? message;
  List<Customers>? customers;
  PageContext? pageContext;

  checkEmailModal({this.code, this.message, this.customers, this.pageContext});

  checkEmailModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['customers'] != null) {
      customers = <Customers>[];
      json['customers'].forEach((v) {
        customers!.add(Customers.fromJson(v));
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
    if (customers != null) {
      data['customers'] = customers!.map((v) => v.toJson()).toList();
    }
    if (pageContext != null) {
      data['page_context'] = pageContext!.toJson();
    }
    return data;
  }
}

class Customers {
  String? customerName;
  String? displayName;
  bool? isPrimaryAssociated;
  bool? isBackupAssociated;
  String? customerId;
  String? contactId;
  String? currencyCode;
  String? currencySymbol;
  String? status;
  String? companyName;
  var unusedCredits;
  var outstandingReceivableAmount;
  var unusedCreditsReceivableAmountBcy;
  var outstandingReceivableAmountBcy;
  var outstanding;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? mobile;
  String? website;
  bool? isGappsCustomer;
  String? createdTime;
  String? updatedTime;
  bool? isPortalInvitationAccepted;
  String? paymentTermsLabel;
  var paymentTerms;
  String? createdBy;
  bool? hasAttachment;

  // List<Null>? tags;

  Customers({
    this.customerName,
    this.displayName,
    this.isPrimaryAssociated,
    this.isBackupAssociated,
    this.customerId,
    this.contactId,
    this.currencyCode,
    this.currencySymbol,
    this.status,
    this.companyName,
    this.unusedCredits,
    this.outstandingReceivableAmount,
    this.unusedCreditsReceivableAmountBcy,
    this.outstandingReceivableAmountBcy,
    this.outstanding,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.mobile,
    this.website,
    this.isGappsCustomer,
    this.createdTime,
    this.updatedTime,
    this.isPortalInvitationAccepted,
    this.paymentTermsLabel,
    this.paymentTerms,
    this.createdBy,
    this.hasAttachment,
    // this.tags
  });

  Customers.fromJson(Map<String, dynamic> json) {
    customerName = json['customer_name'];
    displayName = json['display_name'];
    isPrimaryAssociated = json['is_primary_associated'];
    isBackupAssociated = json['is_backup_associated'];
    customerId = json['customer_id'];
    contactId = json['contact_id'];
    currencyCode = json['currency_code'];
    currencySymbol = json['currency_symbol'];
    status = json['status'];
    companyName = json['company_name'];
    unusedCredits = json['unused_credits'];
    outstandingReceivableAmount = json['outstanding_receivable_amount'];
    unusedCreditsReceivableAmountBcy =
        json['unused_credits_receivable_amount_bcy'];
    outstandingReceivableAmountBcy = json['outstanding_receivable_amount_bcy'];
    outstanding = json['outstanding'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    mobile = json['mobile'];
    website = json['website'];
    isGappsCustomer = json['is_gapps_customer'];
    createdTime = json['created_time'];
    updatedTime = json['updated_time'];
    isPortalInvitationAccepted = json['is_portal_invitation_accepted'];
    paymentTermsLabel = json['payment_terms_label'];
    paymentTerms = json['payment_terms'];
    createdBy = json['created_by'];
    hasAttachment = json['has_attachment'];
    // if (json['tags'] != null) {
    //   tags = <Null>[];
    //   json['tags'].forEach((v) {
    //     tags!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_name'] = customerName;
    data['display_name'] = displayName;
    data['is_primary_associated'] = isPrimaryAssociated;
    data['is_backup_associated'] = isBackupAssociated;
    data['customer_id'] = customerId;
    data['contact_id'] = contactId;
    data['currency_code'] = currencyCode;
    data['currency_symbol'] = currencySymbol;
    data['status'] = status;
    data['company_name'] = companyName;
    data['unused_credits'] = unusedCredits;
    data['outstanding_receivable_amount'] = outstandingReceivableAmount;
    data['unused_credits_receivable_amount_bcy'] =
        unusedCreditsReceivableAmountBcy;
    data['outstanding_receivable_amount_bcy'] = outstandingReceivableAmountBcy;
    data['outstanding'] = outstanding;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['mobile'] = mobile;
    data['website'] = website;
    data['is_gapps_customer'] = isGappsCustomer;
    data['created_time'] = createdTime;
    data['updated_time'] = updatedTime;
    data['is_portal_invitation_accepted'] = isPortalInvitationAccepted;
    data['payment_terms_label'] = paymentTermsLabel;
    data['payment_terms'] = paymentTerms;
    data['created_by'] = createdBy;
    data['has_attachment'] = hasAttachment;
    // if (this.tags != null) {
    //   data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    // }
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
