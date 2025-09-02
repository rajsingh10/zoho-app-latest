class GetCustomerDataModal {
  var code;
  String? message;
  Customer? customer;

  GetCustomerDataModal({this.code, this.message, this.customer});

  GetCustomerDataModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (customer != null) {
      data['customer'] = customer!.toJson();
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
  var billingDay;
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
  List<CustomFields>? customFields;
  String? cfEmailAddress;
  String? cfCountryCode;
  CustomFieldHash? customFieldHash;
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
      this.customFields,
      this.cfEmailAddress,
      this.cfCountryCode,
      this.customFieldHash,
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
    if (json['custom_fields'] != null) {
      customFields = <CustomFields>[];
      json['custom_fields'].forEach((v) {
        customFields!.add(CustomFields.fromJson(v));
      });
    }
    cfEmailAddress = json['cf_email_address'];
    cfCountryCode = json['cf_country_code'];
    customFieldHash = json['custom_field_hash'] != null
        ? CustomFieldHash.fromJson(json['custom_field_hash'])
        : null;
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
        ? EncryptionKeyMap.fromJson(json['encryption_key_map'])
        : null;
    entityAddressId = json['entity_address_id'];
    billingAddress = json['billing_address'] != null
        ? BillingAddress.fromJson(json['billing_address'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ? BillingAddress.fromJson(json['shipping_address'])
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
        ? DefaultTemplates.fromJson(json['default_templates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['display_name'] = displayName;
    data['company_name'] = companyName;
    data['customer_id'] = customerId;
    data['contact_name'] = contactName;
    data['contact_id'] = contactId;
    data['status'] = status;
    data['customer_sub_type'] = customerSubType;
    data['currency_id'] = currencyId;
    data['is_client_review_asked'] = isClientReviewAsked;
    data['is_client_review_settings_enabled'] = isClientReviewSettingsEnabled;
    data['source'] = source;
    data['payment_reminder_enabled'] = paymentReminderEnabled;
    data['language_code'] = languageCode;
    data['portal_status'] = portalStatus;
    data['owner_id'] = ownerId;
    data['language_code_formatted'] = languageCodeFormatted;
    data['is_added_in_portal'] = isAddedInPortal;
    data['can_invite'] = canInvite;
    data['billing_day'] = billingDay;
    data['currency_code'] = currencyCode;
    data['currency_symbol'] = currencySymbol;
    data['price_precision'] = pricePrecision;
    data['unused_credits'] = unusedCredits;
    data['outstanding_receivable_amount'] = outstandingReceivableAmount;
    data['outstanding'] = outstanding;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['mobile'] = mobile;
    data['salutation'] = salutation;
    data['contact_salutation'] = contactSalutation;
    data['ip_address'] = ipAddress;
    data['twitter'] = twitter;
    data['facebook'] = facebook;
    data['department'] = department;
    data['designation'] = designation;
    data['skype'] = skype;
    data['fax'] = fax;
    data['is_portal_invitation_accepted'] = isPortalInvitationAccepted;
    data['website'] = website;
    data['pricebook_id'] = pricebookId;
    data['zcrm_account_id'] = zcrmAccountId;
    data['zcrm_contact_id'] = zcrmContactId;
    data['is_sms_enabled'] = isSmsEnabled;
    if (customFields != null) {
      data['custom_fields'] = customFields!.map((v) => v.toJson()).toList();
    }
    data['cf_email_address'] = cfEmailAddress;
    data['cf_country_code'] = cfCountryCode;
    if (customFieldHash != null) {
      data['custom_field_hash'] = customFieldHash!.toJson();
    }
    data['payment_terms'] = paymentTerms;
    data['payment_terms_label'] = paymentTermsLabel;
    data['is_gapps_customer'] = isGappsCustomer;
    data['unused_credits_receivable_amount'] = unusedCreditsReceivableAmount;
    data['unused_credits_receivable_amount_bcy'] =
        unusedCreditsReceivableAmountBcy;
    data['unused_credits_payable_amount'] = unusedCreditsPayableAmount;
    data['unused_credits_payable_amount_bcy'] = unusedCreditsPayableAmountBcy;
    data['is_linked_with_zohocrm'] = isLinkedWithZohocrm;
    data['photo_url'] = photoUrl;
    data['category'] = category;
    data['is_consent_agreed'] = isConsentAgreed;
    data['consent_date'] = consentDate;
    data['customer_consolidation_preference'] = customerConsolidationPreference;
    data['customer_consolidation_applicable'] = customerConsolidationApplicable;
    data['channel_customer_id'] = channelCustomerId;
    data['channel_source'] = channelSource;
    if (encryptionKeyMap != null) {
      data['encryption_key_map'] = encryptionKeyMap!.toJson();
    }
    data['entity_address_id'] = entityAddressId;
    if (billingAddress != null) {
      data['billing_address'] = billingAddress!.toJson();
    }
    if (shippingAddress != null) {
      data['shipping_address'] = shippingAddress!.toJson();
    }
    data['ach_supported'] = achSupported;
    data['primary_contactperson_id'] = primaryContactpersonId;
    data['can_add_card'] = canAddCard;
    data['can_add_bank_account'] = canAddBankAccount;
    data['company_id'] = companyId;
    data['label_for_company_id'] = labelForCompanyId;
    data['notes'] = notes;
    data['created_time'] = createdTime;
    data['updated_time'] = updatedTime;
    if (defaultTemplates != null) {
      data['default_templates'] = defaultTemplates!.toJson();
    }
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

class CustomFieldHash {
  String? cfEmailAddress;
  String? cfCountryCode;

  CustomFieldHash({this.cfEmailAddress, this.cfCountryCode});

  CustomFieldHash.fromJson(Map<String, dynamic> json) {
    cfEmailAddress = json['cf_email_address'];
    cfCountryCode = json['cf_country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cf_email_address'] = cfEmailAddress;
    data['cf_country_code'] = cfCountryCode;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['modulus'] = modulus;
    data['exponent'] = exponent;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressId;
    data['street'] = street;
    data['address'] = address;
    data['street2'] = street2;
    data['city'] = city;
    data['state'] = state;
    data['zip'] = zip;
    data['country'] = country;
    data['fax'] = fax;
    data['state_code'] = stateCode;
    data['country_code'] = countryCode;
    data['phone'] = phone;
    data['attention'] = attention;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['invoice_template_id'] = invoiceTemplateId;
    data['creditnote_template_id'] = creditnoteTemplateId;
    return data;
  }
}
