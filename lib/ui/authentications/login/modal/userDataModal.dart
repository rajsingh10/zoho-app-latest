class UserDataModal {
  bool? status;
  String? message;
  List<Data>? data;

  UserDataModal({this.status, this.message, this.data});

  UserDataModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
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
  int? unusedCredits;
  int? outstandingReceivableAmount;
  int? unusedCreditsReceivableAmountBcy;
  int? outstandingReceivableAmountBcy;
  int? outstanding;
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
  int? paymentTerms;
  String? createdBy;
  bool? hasAttachment;

  Data(
      {this.customerName,
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
      this.hasAttachment});

  Data.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
