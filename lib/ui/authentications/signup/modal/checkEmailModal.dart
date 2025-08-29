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
        customers!.add(new Customers.fromJson(v));
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
    if (this.customers != null) {
      data['customers'] = this.customers!.map((v) => v.toJson()).toList();
    }
    if (this.pageContext != null) {
      data['page_context'] = this.pageContext!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_name'] = this.customerName;
    data['display_name'] = this.displayName;
    data['is_primary_associated'] = this.isPrimaryAssociated;
    data['is_backup_associated'] = this.isBackupAssociated;
    data['customer_id'] = this.customerId;
    data['contact_id'] = this.contactId;
    data['currency_code'] = this.currencyCode;
    data['currency_symbol'] = this.currencySymbol;
    data['status'] = this.status;
    data['company_name'] = this.companyName;
    data['unused_credits'] = this.unusedCredits;
    data['outstanding_receivable_amount'] = this.outstandingReceivableAmount;
    data['unused_credits_receivable_amount_bcy'] =
        this.unusedCreditsReceivableAmountBcy;
    data['outstanding_receivable_amount_bcy'] =
        this.outstandingReceivableAmountBcy;
    data['outstanding'] = this.outstanding;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['mobile'] = this.mobile;
    data['website'] = this.website;
    data['is_gapps_customer'] = this.isGappsCustomer;
    data['created_time'] = this.createdTime;
    data['updated_time'] = this.updatedTime;
    data['is_portal_invitation_accepted'] = this.isPortalInvitationAccepted;
    data['payment_terms_label'] = this.paymentTermsLabel;
    data['payment_terms'] = this.paymentTerms;
    data['created_by'] = this.createdBy;
    data['has_attachment'] = this.hasAttachment;
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
