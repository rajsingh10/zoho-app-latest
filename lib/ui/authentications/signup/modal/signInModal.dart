class signInModal {
  var code;
  String? message;
  Customer? customer;

  signInModal({this.code, this.message, this.customer});

  signInModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Customer {
  String? displayName;
  String? companyName;
  String? customerId;
  String? contactName;
  String? contactId;
  String? status;
  String? customerSubType;
  String? currencyId;
  bool? isClientReviewAsked;
  bool? isClientReviewSettingsEnabled;
  String? source;
  bool? paymentReminderEnabled;
  String? languageCode;
  String? portalStatus;
  String? ownerId;
  String? languageCodeFormatted;
  bool? isAddedInPortal;
  bool? canInvite;
  String? billingDay;
  bool? isTaxable;
  String? taxId;
  String? taxName;
  String? taxPercentage;
  String? vatTreatment;
  String? currencyCode;
  String? currencySymbol;
  var pricePrecision;
  var unusedCredits;
  var outstandingReceivableAmount;
  var outstanding;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? mobile;
  String? salutation;
  String? contactSalutation;
  String? ipAddress;
  String? twitter;
  String? facebook;
  String? department;
  String? designation;
  String? skype;
  String? fax;
  bool? isPortalInvitationAccepted;
  String? website;
  String? pricebookId;
  String? zcrmAccountId;
  String? zcrmContactId;
  bool? isSmsEnabled;
  var paymentTerms;
  String? paymentTermsLabel;
  bool? isGappsCustomer;
  var unusedCreditsReceivableAmount;
  var unusedCreditsReceivableAmountBcy;
  var unusedCreditsPayableAmount;
  var unusedCreditsPayableAmountBcy;
  bool? isLinkedWithZohocrm;
  String? photoUrl;
  String? category;
  bool? isConsentAgreed;
  String? consentDate;
  bool? customerConsolidationPreference;
  bool? customerConsolidationApplicable;
  String? channelCustomerId;
  String? channelSource;
  EncryptionKeyMap? encryptionKeyMap;
  String? entityAddressId;
  BillingAddress? billingAddress;
  BillingAddress? shippingAddress;
  bool? achSupported;
  String? primaryContactpersonId;
  bool? canAddCard;
  bool? canAddBankAccount;
  String? companyId;
  String? labelForCompanyId;
  String? notes;
  String? createdTime;
  String? updatedTime;
  DefaultTemplates? defaultTemplates;

  Customer(
      {this.displayName,
      this.companyName,
      this.customerId,
      this.contactName,
      this.contactId,
      this.status,
      this.customerSubType,
      this.currencyId,
      this.isClientReviewAsked,
      this.isClientReviewSettingsEnabled,
      this.source,
      this.paymentReminderEnabled,
      this.languageCode,
      this.portalStatus,
      this.ownerId,
      this.languageCodeFormatted,
      this.isAddedInPortal,
      this.canInvite,
      this.billingDay,
      this.isTaxable,
      this.taxId,
      this.taxName,
      this.taxPercentage,
      this.vatTreatment,
      this.currencyCode,
      this.currencySymbol,
      this.pricePrecision,
      this.unusedCredits,
      this.outstandingReceivableAmount,
      this.outstanding,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.mobile,
      this.salutation,
      this.contactSalutation,
      this.ipAddress,
      this.twitter,
      this.facebook,
      this.department,
      this.designation,
      this.skype,
      this.fax,
      this.isPortalInvitationAccepted,
      this.website,
      this.pricebookId,
      this.zcrmAccountId,
      this.zcrmContactId,
      this.isSmsEnabled,
      this.paymentTerms,
      this.paymentTermsLabel,
      this.isGappsCustomer,
      this.unusedCreditsReceivableAmount,
      this.unusedCreditsReceivableAmountBcy,
      this.unusedCreditsPayableAmount,
      this.unusedCreditsPayableAmountBcy,
      this.isLinkedWithZohocrm,
      this.photoUrl,
      this.category,
      this.isConsentAgreed,
      this.consentDate,
      this.customerConsolidationPreference,
      this.customerConsolidationApplicable,
      this.channelCustomerId,
      this.channelSource,
      this.encryptionKeyMap,
      this.entityAddressId,
      this.billingAddress,
      this.shippingAddress,
      this.achSupported,
      this.primaryContactpersonId,
      this.canAddCard,
      this.canAddBankAccount,
      this.companyId,
      this.labelForCompanyId,
      this.notes,
      this.createdTime,
      this.updatedTime,
      this.defaultTemplates});

  Customer.fromJson(Map<String, dynamic> json) {
    displayName = json['display_name'];
    companyName = json['company_name'];
    customerId = json['customer_id'];
    contactName = json['contact_name'];
    contactId = json['contact_id'];
    status = json['status'];
    customerSubType = json['customer_sub_type'];
    currencyId = json['currency_id'];
    isClientReviewAsked = json['is_client_review_asked'];
    isClientReviewSettingsEnabled = json['is_client_review_settings_enabled'];
    source = json['source'];
    paymentReminderEnabled = json['payment_reminder_enabled'];
    languageCode = json['language_code'];
    portalStatus = json['portal_status'];
    ownerId = json['owner_id'];
    languageCodeFormatted = json['language_code_formatted'];
    isAddedInPortal = json['is_added_in_portal'];
    canInvite = json['can_invite'];
    billingDay = json['billing_day'];
    isTaxable = json['is_taxable'];
    taxId = json['tax_id'];
    taxName = json['tax_name'];
    taxPercentage = json['tax_percentage'];
    vatTreatment = json['vat_treatment'];
    currencyCode = json['currency_code'];
    currencySymbol = json['currency_symbol'];
    pricePrecision = json['price_precision'];
    unusedCredits = json['unused_credits'];
    outstandingReceivableAmount = json['outstanding_receivable_amount'];
    outstanding = json['outstanding'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    mobile = json['mobile'];
    salutation = json['salutation'];
    contactSalutation = json['contact_salutation'];
    ipAddress = json['ip_address'];
    twitter = json['twitter'];
    facebook = json['facebook'];
    department = json['department'];
    designation = json['designation'];
    skype = json['skype'];
    fax = json['fax'];
    isPortalInvitationAccepted = json['is_portal_invitation_accepted'];
    website = json['website'];
    pricebookId = json['pricebook_id'];
    zcrmAccountId = json['zcrm_account_id'];
    zcrmContactId = json['zcrm_contact_id'];
    isSmsEnabled = json['is_sms_enabled'];
    paymentTerms = json['payment_terms'];
    paymentTermsLabel = json['payment_terms_label'];
    isGappsCustomer = json['is_gapps_customer'];
    unusedCreditsReceivableAmount = json['unused_credits_receivable_amount'];
    unusedCreditsReceivableAmountBcy =
        json['unused_credits_receivable_amount_bcy'];
    unusedCreditsPayableAmount = json['unused_credits_payable_amount'];
    unusedCreditsPayableAmountBcy = json['unused_credits_payable_amount_bcy'];
    isLinkedWithZohocrm = json['is_linked_with_zohocrm'];
    photoUrl = json['photo_url'];
    category = json['category'];
    isConsentAgreed = json['is_consent_agreed'];
    consentDate = json['consent_date'];
    customerConsolidationPreference = json['customer_consolidation_preference'];
    customerConsolidationApplicable = json['customer_consolidation_applicable'];
    channelCustomerId = json['channel_customer_id'];
    channelSource = json['channel_source'];
    encryptionKeyMap = json['encryption_key_map'] != null
        ? new EncryptionKeyMap.fromJson(json['encryption_key_map'])
        : null;
    entityAddressId = json['entity_address_id'];
    billingAddress = json['billing_address'] != null
        ? new BillingAddress.fromJson(json['billing_address'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ? new BillingAddress.fromJson(json['shipping_address'])
        : null;
    achSupported = json['ach_supported'];
    primaryContactpersonId = json['primary_contactperson_id'];
    canAddCard = json['can_add_card'];
    canAddBankAccount = json['can_add_bank_account'];
    companyId = json['company_id'];
    labelForCompanyId = json['label_for_company_id'];
    notes = json['notes'];
    createdTime = json['created_time'];
    updatedTime = json['updated_time'];
    defaultTemplates = json['default_templates'] != null
        ? new DefaultTemplates.fromJson(json['default_templates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_name'] = this.displayName;
    data['company_name'] = this.companyName;
    data['customer_id'] = this.customerId;
    data['contact_name'] = this.contactName;
    data['contact_id'] = this.contactId;
    data['status'] = this.status;
    data['customer_sub_type'] = this.customerSubType;
    data['currency_id'] = this.currencyId;
    data['is_client_review_asked'] = this.isClientReviewAsked;
    data['is_client_review_settings_enabled'] =
        this.isClientReviewSettingsEnabled;
    data['source'] = this.source;
    data['payment_reminder_enabled'] = this.paymentReminderEnabled;
    data['language_code'] = this.languageCode;
    data['portal_status'] = this.portalStatus;
    data['owner_id'] = this.ownerId;
    data['language_code_formatted'] = this.languageCodeFormatted;
    data['is_added_in_portal'] = this.isAddedInPortal;
    data['can_invite'] = this.canInvite;
    data['billing_day'] = this.billingDay;
    data['is_taxable'] = this.isTaxable;
    data['tax_id'] = this.taxId;
    data['tax_name'] = this.taxName;
    data['tax_percentage'] = this.taxPercentage;
    data['vat_treatment'] = this.vatTreatment;
    data['currency_code'] = this.currencyCode;
    data['currency_symbol'] = this.currencySymbol;
    data['price_precision'] = this.pricePrecision;
    data['unused_credits'] = this.unusedCredits;
    data['outstanding_receivable_amount'] = this.outstandingReceivableAmount;
    data['outstanding'] = this.outstanding;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['mobile'] = this.mobile;
    data['salutation'] = this.salutation;
    data['contact_salutation'] = this.contactSalutation;
    data['ip_address'] = this.ipAddress;
    data['twitter'] = this.twitter;
    data['facebook'] = this.facebook;
    data['department'] = this.department;
    data['designation'] = this.designation;
    data['skype'] = this.skype;
    data['fax'] = this.fax;
    data['is_portal_invitation_accepted'] = this.isPortalInvitationAccepted;
    data['website'] = this.website;
    data['pricebook_id'] = this.pricebookId;
    data['zcrm_account_id'] = this.zcrmAccountId;
    data['zcrm_contact_id'] = this.zcrmContactId;
    data['is_sms_enabled'] = this.isSmsEnabled;
    data['payment_terms'] = this.paymentTerms;
    data['payment_terms_label'] = this.paymentTermsLabel;
    data['is_gapps_customer'] = this.isGappsCustomer;
    data['unused_credits_receivable_amount'] =
        this.unusedCreditsReceivableAmount;
    data['unused_credits_receivable_amount_bcy'] =
        this.unusedCreditsReceivableAmountBcy;
    data['unused_credits_payable_amount'] = this.unusedCreditsPayableAmount;
    data['unused_credits_payable_amount_bcy'] =
        this.unusedCreditsPayableAmountBcy;
    data['is_linked_with_zohocrm'] = this.isLinkedWithZohocrm;
    data['photo_url'] = this.photoUrl;
    data['category'] = this.category;
    data['is_consent_agreed'] = this.isConsentAgreed;
    data['consent_date'] = this.consentDate;
    data['customer_consolidation_preference'] =
        this.customerConsolidationPreference;
    data['customer_consolidation_applicable'] =
        this.customerConsolidationApplicable;
    data['channel_customer_id'] = this.channelCustomerId;
    data['channel_source'] = this.channelSource;
    if (this.encryptionKeyMap != null) {
      data['encryption_key_map'] = this.encryptionKeyMap!.toJson();
    }
    data['entity_address_id'] = this.entityAddressId;
    if (this.billingAddress != null) {
      data['billing_address'] = this.billingAddress!.toJson();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    data['ach_supported'] = this.achSupported;
    data['primary_contactperson_id'] = this.primaryContactpersonId;
    data['can_add_card'] = this.canAddCard;
    data['can_add_bank_account'] = this.canAddBankAccount;
    data['company_id'] = this.companyId;
    data['label_for_company_id'] = this.labelForCompanyId;
    data['notes'] = this.notes;
    data['created_time'] = this.createdTime;
    data['updated_time'] = this.updatedTime;
    if (this.defaultTemplates != null) {
      data['default_templates'] = this.defaultTemplates!.toJson();
    }
    return data;
  }
}

class EncryptionKeyMap {
  String? modulus;
  String? exponent;

  EncryptionKeyMap({this.modulus, this.exponent});

  EncryptionKeyMap.fromJson(Map<String, dynamic> json) {
    modulus = json['modulus'];
    exponent = json['exponent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['modulus'] = this.modulus;
    data['exponent'] = this.exponent;
    return data;
  }
}

class BillingAddress {
  String? addressId;
  String? street;
  String? address;
  String? street2;
  String? city;
  String? state;
  String? zip;
  String? country;
  String? fax;
  String? stateCode;
  String? countryCode;
  String? phone;
  String? attention;

  BillingAddress(
      {this.addressId,
      this.street,
      this.address,
      this.street2,
      this.city,
      this.state,
      this.zip,
      this.country,
      this.fax,
      this.stateCode,
      this.countryCode,
      this.phone,
      this.attention});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    street = json['street'];
    address = json['address'];
    street2 = json['street2'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    country = json['country'];
    fax = json['fax'];
    stateCode = json['state_code'];
    countryCode = json['country_code'];
    phone = json['phone'];
    attention = json['attention'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['street'] = this.street;
    data['address'] = this.address;
    data['street2'] = this.street2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    data['country'] = this.country;
    data['fax'] = this.fax;
    data['state_code'] = this.stateCode;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['attention'] = this.attention;
    return data;
  }
}

class DefaultTemplates {
  String? invoiceTemplateId;
  String? creditnoteTemplateId;

  DefaultTemplates({this.invoiceTemplateId, this.creditnoteTemplateId});

  DefaultTemplates.fromJson(Map<String, dynamic> json) {
    invoiceTemplateId = json['invoice_template_id'];
    creditnoteTemplateId = json['creditnote_template_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoice_template_id'] = this.invoiceTemplateId;
    data['creditnote_template_id'] = this.creditnoteTemplateId;
    return data;
  }
}
