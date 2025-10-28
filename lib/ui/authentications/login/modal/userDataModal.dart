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
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
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
    return data;
  }
}
