class allInvoiceModal {
  var code;
  String? message;
  List<Invoices>? invoices;
  PageContext? pageContext;

  allInvoiceModal({this.code, this.message, this.invoices, this.pageContext});

  allInvoiceModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['invoices'] != null) {
      invoices = <Invoices>[];
      json['invoices'].forEach((v) {
        invoices!.add(new Invoices.fromJson(v));
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
    if (this.invoices != null) {
      data['invoices'] = this.invoices!.map((v) => v.toJson()).toList();
    }
    if (this.pageContext != null) {
      data['page_context'] = this.pageContext!.toJson();
    }
    return data;
  }
}

class Invoices {
  String? invoiceId;
  bool? achPaymentInitiated;
  String? number;
  String? invoiceNumber;
  String? customerId;
  String? customerName;
  String? email;
  String? projectName;
  String? referenceNumber;
  String? invoiceDate;
  String? dueDate;
  String? currencyCode;
  String? currencySymbol;
  var total;
  var balance;
  String? status;
  String? transactionType;
  String? createdTime;
  String? updatedTime;
  String? createdBy;
  String? paymentExpectedDate;
  String? salesperson;
  String? salespersonName;
  String? country;
  String? phone;
  BillingAddress? billingAddress;
  BillingAddress? shippingAddress;
  String? billingStreet;
  String? billingStreet2;
  String? billingCity;
  String? billingState;
  String? billingZipcode;
  String? billingCountry;
  String? billingPhone;
  String? shippingStreet;
  String? shippingStreet2;
  String? shippingCity;
  String? shippingState;
  String? shippingZipcode;
  String? shippingCountry;
  String? shippingPhone;
  bool? isViewedByClient;
  String? clientViewedTime;
  bool? hasAttachment;
  bool? isViewedInMail;
  String? mailFirstViewedTime;
  String? mailLastViewedTime;

  Invoices(
      {this.invoiceId,
      this.achPaymentInitiated,
      this.number,
      this.invoiceNumber,
      this.customerId,
      this.customerName,
      this.email,
      this.projectName,
      this.referenceNumber,
      this.invoiceDate,
      this.dueDate,
      this.currencyCode,
      this.currencySymbol,
      this.total,
      this.balance,
      this.status,
      this.transactionType,
      this.createdTime,
      this.updatedTime,
      this.createdBy,
      this.paymentExpectedDate,
      this.salesperson,
      this.salespersonName,
      this.country,
      this.phone,
      this.billingAddress,
      this.shippingAddress,
      this.billingStreet,
      this.billingStreet2,
      this.billingCity,
      this.billingState,
      this.billingZipcode,
      this.billingCountry,
      this.billingPhone,
      this.shippingStreet,
      this.shippingStreet2,
      this.shippingCity,
      this.shippingState,
      this.shippingZipcode,
      this.shippingCountry,
      this.shippingPhone,
      this.isViewedByClient,
      this.clientViewedTime,
      this.hasAttachment,
      this.isViewedInMail,
      this.mailFirstViewedTime,
      this.mailLastViewedTime});

  Invoices.fromJson(Map<String, dynamic> json) {
    invoiceId = json['invoice_id'];
    achPaymentInitiated = json['ach_payment_initiated'];
    number = json['number'];
    invoiceNumber = json['invoice_number'];
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    email = json['email'];
    projectName = json['project_name'];
    referenceNumber = json['reference_number'];
    invoiceDate = json['invoice_date'];
    dueDate = json['due_date'];
    currencyCode = json['currency_code'];
    currencySymbol = json['currency_symbol'];
    total = json['total'];
    balance = json['balance'];
    status = json['status'];
    transactionType = json['transaction_type'];
    createdTime = json['created_time'];
    updatedTime = json['updated_time'];
    createdBy = json['created_by'];
    paymentExpectedDate = json['payment_expected_date'];
    salesperson = json['salesperson'];
    salespersonName = json['salesperson_name'];
    country = json['country'];
    phone = json['phone'];
    billingAddress = json['billing_address'] != null
        ? new BillingAddress.fromJson(json['billing_address'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ? new BillingAddress.fromJson(json['shipping_address'])
        : null;
    billingStreet = json['billing_street'];
    billingStreet2 = json['billing_street2'];
    billingCity = json['billing_city'];
    billingState = json['billing_state'];
    billingZipcode = json['billing_zipcode'];
    billingCountry = json['billing_country'];
    billingPhone = json['billing_phone'];
    shippingStreet = json['shipping_street'];
    shippingStreet2 = json['shipping_street2'];
    shippingCity = json['shipping_city'];
    shippingState = json['shipping_state'];
    shippingZipcode = json['shipping_zipcode'];
    shippingCountry = json['shipping_country'];
    shippingPhone = json['shipping_phone'];
    isViewedByClient = json['is_viewed_by_client'];
    clientViewedTime = json['client_viewed_time'];
    hasAttachment = json['has_attachment'];
    isViewedInMail = json['is_viewed_in_mail'];
    mailFirstViewedTime = json['mail_first_viewed_time'];
    mailLastViewedTime = json['mail_last_viewed_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoice_id'] = this.invoiceId;
    data['ach_payment_initiated'] = this.achPaymentInitiated;
    data['number'] = this.number;
    data['invoice_number'] = this.invoiceNumber;
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['email'] = this.email;
    data['project_name'] = this.projectName;
    data['reference_number'] = this.referenceNumber;
    data['invoice_date'] = this.invoiceDate;
    data['due_date'] = this.dueDate;
    data['currency_code'] = this.currencyCode;
    data['currency_symbol'] = this.currencySymbol;
    data['total'] = this.total;
    data['balance'] = this.balance;
    data['status'] = this.status;
    data['transaction_type'] = this.transactionType;
    data['created_time'] = this.createdTime;
    data['updated_time'] = this.updatedTime;
    data['created_by'] = this.createdBy;
    data['payment_expected_date'] = this.paymentExpectedDate;
    data['salesperson'] = this.salesperson;
    data['salesperson_name'] = this.salespersonName;
    data['country'] = this.country;
    data['phone'] = this.phone;
    if (this.billingAddress != null) {
      data['billing_address'] = this.billingAddress!.toJson();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    data['billing_street'] = this.billingStreet;
    data['billing_street2'] = this.billingStreet2;
    data['billing_city'] = this.billingCity;
    data['billing_state'] = this.billingState;
    data['billing_zipcode'] = this.billingZipcode;
    data['billing_country'] = this.billingCountry;
    data['billing_phone'] = this.billingPhone;
    data['shipping_street'] = this.shippingStreet;
    data['shipping_street2'] = this.shippingStreet2;
    data['shipping_city'] = this.shippingCity;
    data['shipping_state'] = this.shippingState;
    data['shipping_zipcode'] = this.shippingZipcode;
    data['shipping_country'] = this.shippingCountry;
    data['shipping_phone'] = this.shippingPhone;
    data['is_viewed_by_client'] = this.isViewedByClient;
    data['client_viewed_time'] = this.clientViewedTime;
    data['has_attachment'] = this.hasAttachment;
    data['is_viewed_in_mail'] = this.isViewedInMail;
    data['mail_first_viewed_time'] = this.mailFirstViewedTime;
    data['mail_last_viewed_time'] = this.mailLastViewedTime;
    return data;
  }
}

class BillingAddress {
  String? street;
  String? street2;
  String? city;
  String? state;
  String? zipcode;
  String? country;
  String? phone;
  String? fax;
  String? attention;

  BillingAddress(
      {this.street,
      this.street2,
      this.city,
      this.state,
      this.zipcode,
      this.country,
      this.phone,
      this.fax,
      this.attention});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    street2 = json['street2'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
    country = json['country'];
    phone = json['phone'];
    fax = json['fax'];
    attention = json['attention'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['street2'] = this.street2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipcode'] = this.zipcode;
    data['country'] = this.country;
    data['phone'] = this.phone;
    data['fax'] = this.fax;
    data['attention'] = this.attention;
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
