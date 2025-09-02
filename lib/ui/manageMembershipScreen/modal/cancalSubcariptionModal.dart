class CancelSubscriptionModal {
  var code;
  String? message;
  Subscription? subscription;

  CancelSubscriptionModal({this.code, this.message, this.subscription});

  CancelSubscriptionModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    subscription = json['subscription'] != null
        ? Subscription.fromJson(json['subscription'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (subscription != null) {
      data['subscription'] = subscription!.toJson();
    }
    return data;
  }
}

class Subscription {
  String? subscriptionId;
  String? name;
  String? crmOwnerId;
  String? zcrmPotentialId;
  String? zcrmPotentialName;
  String? subscriptionNumber;
  bool? isMeteredBilling;
  String? status;
  String? source;
  var subTotal;
  var amount;
  String? createdAt;
  String? activatedAt;
  String? currentTermStartsAt;
  String? currentTermEndsAt;
  String? lastBillingAt;
  String? cancelledAt;
  String? expiresAt;
  var interval;
  String? intervalUnit;
  var shippingInterval;
  String? shippingIntervalUnit;
  String? billingMode;
  var totalOrders;
  var ordersCreated;
  var ordersRemaining;
  String? lastShipmentAt;
  String? lastShipmentDay;
  bool? autoCollect;
  String? createdTime;
  String? updatedTime;
  String? referenceId;
  String? salespersonId;
  String? salespersonName;
  String? childInvoiceId;
  String? currencyCode;
  String? currencySymbol;
  String? couponDuration;
  bool? isItemSubscriptions;
  var trialExtendedCount;
  bool? endOfTerm;
  var remainingBillingCycles;
  String? productId;
  String? productName;
  String? pricebookId;
  String? channelSource;
  String? channelReferenceId;
  String? cancelReason;
  bool? canProrate;
  bool? canInvoiceProratedAmount;
  List<LineItems>? lineItems;
  Plan? plan;
  var discountTotal;
  var discountPercent;
  var discount;
  var discountAppliedOnAmount;
  String? discountType;
  bool? isDiscountBeforeTax;
  var bcyDiscountTotal;
  var exchangeRate;
  bool? isInclusiveTax;
  String? taxRounding;
  var roundoffValue;
  String? transactionRoundingType;
  var paymentTerms;
  String? paymentTermsLabel;
  String? templateId;
  bool? canAddBankAccount;
  String? createdById;
  String? lastModifiedById;
  String? createdDate;
  String? startDate;
  String? customerId;
  Customer? customer;
  String? invoiceNotes;
  String? reactivateDate;
  List<Contactpersons>? contactpersons;
  List<ContactPersonsAssociated>? contactPersonsAssociated;
  Card? card;
  bool? allowPartialPayments;
  List<PaymentGateways>? paymentGateways;
  bool? isAdvanceInvoicePresent;
  String? applyChangesOn;
  bool? isScheduledUpdate;
  bool? allowInTermReactivation;
  String? lastChildInvBalance;
  String? lastChildInvStatus;
  bool? isInTermReactivationScheduled;
  String? maxDateForInTerm;

  Subscription(
      {this.subscriptionId,
      this.name,
      this.crmOwnerId,
      this.zcrmPotentialId,
      this.zcrmPotentialName,
      this.subscriptionNumber,
      this.isMeteredBilling,
      this.status,
      this.source,
      this.subTotal,
      this.amount,
      this.createdAt,
      this.activatedAt,
      this.currentTermStartsAt,
      this.currentTermEndsAt,
      this.lastBillingAt,
      this.cancelledAt,
      this.expiresAt,
      this.interval,
      this.intervalUnit,
      this.shippingInterval,
      this.shippingIntervalUnit,
      this.billingMode,
      this.totalOrders,
      this.ordersCreated,
      this.ordersRemaining,
      this.lastShipmentAt,
      this.lastShipmentDay,
      this.autoCollect,
      this.createdTime,
      this.updatedTime,
      this.referenceId,
      this.salespersonId,
      this.salespersonName,
      this.childInvoiceId,
      this.currencyCode,
      this.currencySymbol,
      this.couponDuration,
      this.isItemSubscriptions,
      this.trialExtendedCount,
      this.endOfTerm,
      this.remainingBillingCycles,
      this.productId,
      this.productName,
      this.pricebookId,
      this.channelSource,
      this.channelReferenceId,
      this.cancelReason,
      this.canProrate,
      this.canInvoiceProratedAmount,
      this.lineItems,
      this.plan,
      this.discountTotal,
      this.discountPercent,
      this.discount,
      this.discountAppliedOnAmount,
      this.discountType,
      this.isDiscountBeforeTax,
      this.bcyDiscountTotal,
      this.exchangeRate,
      this.isInclusiveTax,
      this.taxRounding,
      this.roundoffValue,
      this.transactionRoundingType,
      this.paymentTerms,
      this.paymentTermsLabel,
      this.templateId,
      this.canAddBankAccount,
      this.createdById,
      this.lastModifiedById,
      this.createdDate,
      this.startDate,
      this.customerId,
      this.customer,
      this.invoiceNotes,
      this.reactivateDate,
      this.contactpersons,
      this.contactPersonsAssociated,
      this.card,
      this.allowPartialPayments,
      this.paymentGateways,
      this.isAdvanceInvoicePresent,
      this.applyChangesOn,
      this.isScheduledUpdate,
      this.allowInTermReactivation,
      this.lastChildInvBalance,
      this.lastChildInvStatus,
      this.isInTermReactivationScheduled,
      this.maxDateForInTerm});

  Subscription.fromJson(Map<String, dynamic> json) {
    subscriptionId = json['subscription_id'];
    name = json['name'];
    crmOwnerId = json['crm_owner_id'];
    zcrmPotentialId = json['zcrm_potential_id'];
    zcrmPotentialName = json['zcrm_potential_name'];
    subscriptionNumber = json['subscription_number'];
    isMeteredBilling = json['is_metered_billing'];
    status = json['status'];
    source = json['source'];
    subTotal = json['sub_total'];
    amount = json['amount'];
    createdAt = json['created_at'];
    activatedAt = json['activated_at'];
    currentTermStartsAt = json['current_term_starts_at'];
    currentTermEndsAt = json['current_term_ends_at'];
    lastBillingAt = json['last_billing_at'];
    cancelledAt = json['cancelled_at'];
    expiresAt = json['expires_at'];
    interval = json['interval'];
    intervalUnit = json['interval_unit'];
    shippingInterval = json['shipping_interval'];
    shippingIntervalUnit = json['shipping_interval_unit'];
    billingMode = json['billing_mode'];
    totalOrders = json['total_orders'];
    ordersCreated = json['orders_created'];
    ordersRemaining = json['orders_remaining'];
    lastShipmentAt = json['last_shipment_at'];
    lastShipmentDay = json['last_shipment_day'];
    autoCollect = json['auto_collect'];
    createdTime = json['created_time'];
    updatedTime = json['updated_time'];
    referenceId = json['reference_id'];
    salespersonId = json['salesperson_id'];
    salespersonName = json['salesperson_name'];
    childInvoiceId = json['child_invoice_id'];
    currencyCode = json['currency_code'];
    currencySymbol = json['currency_symbol'];
    couponDuration = json['coupon_duration'];
    isItemSubscriptions = json['is_item_subscriptions'];
    trialExtendedCount = json['trial_extended_count'];
    endOfTerm = json['end_of_term'];
    remainingBillingCycles = json['remaining_billing_cycles'];
    productId = json['product_id'];
    productName = json['product_name'];
    pricebookId = json['pricebook_id'];
    channelSource = json['channel_source'];
    channelReferenceId = json['channel_reference_id'];
    cancelReason = json['cancel_reason'];
    canProrate = json['can_prorate'];
    canInvoiceProratedAmount = json['can_invoice_prorated_amount'];
    if (json['line_items'] != null) {
      lineItems = <LineItems>[];
      json['line_items'].forEach((v) {
        lineItems!.add(LineItems.fromJson(v));
      });
    }
    plan = json['plan'] != null ? Plan.fromJson(json['plan']) : null;
    discountTotal = json['discount_total'];
    discountPercent = json['discount_percent'];
    discount = json['discount'];
    discountAppliedOnAmount = json['discount_applied_on_amount'];
    discountType = json['discount_type'];
    isDiscountBeforeTax = json['is_discount_before_tax'];
    bcyDiscountTotal = json['bcy_discount_total'];
    exchangeRate = json['exchange_rate'];
    isInclusiveTax = json['is_inclusive_tax'];
    taxRounding = json['tax_rounding'];
    roundoffValue = json['roundoff_value'];
    transactionRoundingType = json['transaction_rounding_type'];
    paymentTerms = json['payment_terms'];
    paymentTermsLabel = json['payment_terms_label'];
    templateId = json['template_id'];
    canAddBankAccount = json['can_add_bank_account'];
    createdById = json['created_by_id'];
    lastModifiedById = json['last_modified_by_id'];
    createdDate = json['created_date'];
    startDate = json['start_date'];
    customerId = json['customer_id'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    invoiceNotes = json['invoice_notes'];
    reactivateDate = json['reactivate_date'];
    if (json['contactpersons'] != null) {
      contactpersons = <Contactpersons>[];
      json['contactpersons'].forEach((v) {
        contactpersons!.add(Contactpersons.fromJson(v));
      });
    }
    if (json['contact_persons_associated'] != null) {
      contactPersonsAssociated = <ContactPersonsAssociated>[];
      json['contact_persons_associated'].forEach((v) {
        contactPersonsAssociated!.add(ContactPersonsAssociated.fromJson(v));
      });
    }
    card = json['card'] != null ? Card.fromJson(json['card']) : null;
    allowPartialPayments = json['allow_partial_payments'];
    if (json['payment_gateways'] != null) {
      paymentGateways = <PaymentGateways>[];
      json['payment_gateways'].forEach((v) {
        paymentGateways!.add(PaymentGateways.fromJson(v));
      });
    }
    isAdvanceInvoicePresent = json['is_advance_invoice_present'];
    applyChangesOn = json['apply_changes_on'];
    isScheduledUpdate = json['is_scheduled_update'];
    allowInTermReactivation = json['allow_in_term_reactivation'];
    lastChildInvBalance = json['last_child_inv_balance'];
    lastChildInvStatus = json['last_child_inv_status'];
    isInTermReactivationScheduled = json['is_in_term_reactivation_scheduled'];
    maxDateForInTerm = json['max_date_for_in_term'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subscription_id'] = subscriptionId;
    data['name'] = name;
    data['crm_owner_id'] = crmOwnerId;
    data['zcrm_potential_id'] = zcrmPotentialId;
    data['zcrm_potential_name'] = zcrmPotentialName;
    data['subscription_number'] = subscriptionNumber;
    data['is_metered_billing'] = isMeteredBilling;
    data['status'] = status;
    data['source'] = source;
    data['sub_total'] = subTotal;
    data['amount'] = amount;
    data['created_at'] = createdAt;
    data['activated_at'] = activatedAt;
    data['current_term_starts_at'] = currentTermStartsAt;
    data['current_term_ends_at'] = currentTermEndsAt;
    data['last_billing_at'] = lastBillingAt;
    data['cancelled_at'] = cancelledAt;
    data['expires_at'] = expiresAt;
    data['interval'] = interval;
    data['interval_unit'] = intervalUnit;
    data['shipping_interval'] = shippingInterval;
    data['shipping_interval_unit'] = shippingIntervalUnit;
    data['billing_mode'] = billingMode;
    data['total_orders'] = totalOrders;
    data['orders_created'] = ordersCreated;
    data['orders_remaining'] = ordersRemaining;
    data['last_shipment_at'] = lastShipmentAt;
    data['last_shipment_day'] = lastShipmentDay;
    data['auto_collect'] = autoCollect;
    data['created_time'] = createdTime;
    data['updated_time'] = updatedTime;
    data['reference_id'] = referenceId;
    data['salesperson_id'] = salespersonId;
    data['salesperson_name'] = salespersonName;
    data['child_invoice_id'] = childInvoiceId;
    data['currency_code'] = currencyCode;
    data['currency_symbol'] = currencySymbol;
    data['coupon_duration'] = couponDuration;
    data['is_item_subscriptions'] = isItemSubscriptions;
    data['trial_extended_count'] = trialExtendedCount;
    data['end_of_term'] = endOfTerm;
    data['remaining_billing_cycles'] = remainingBillingCycles;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['pricebook_id'] = pricebookId;
    data['channel_source'] = channelSource;
    data['channel_reference_id'] = channelReferenceId;
    data['cancel_reason'] = cancelReason;
    data['can_prorate'] = canProrate;
    data['can_invoice_prorated_amount'] = canInvoiceProratedAmount;
    if (lineItems != null) {
      data['line_items'] = lineItems!.map((v) => v.toJson()).toList();
    }
    if (plan != null) {
      data['plan'] = plan!.toJson();
    }
    data['discount_total'] = discountTotal;
    data['discount_percent'] = discountPercent;
    data['discount'] = discount;
    data['discount_applied_on_amount'] = discountAppliedOnAmount;
    data['discount_type'] = discountType;
    data['is_discount_before_tax'] = isDiscountBeforeTax;
    data['bcy_discount_total'] = bcyDiscountTotal;
    data['exchange_rate'] = exchangeRate;
    data['is_inclusive_tax'] = isInclusiveTax;
    data['tax_rounding'] = taxRounding;
    data['roundoff_value'] = roundoffValue;
    data['transaction_rounding_type'] = transactionRoundingType;
    data['payment_terms'] = paymentTerms;
    data['payment_terms_label'] = paymentTermsLabel;
    data['template_id'] = templateId;
    data['can_add_bank_account'] = canAddBankAccount;
    data['created_by_id'] = createdById;
    data['last_modified_by_id'] = lastModifiedById;
    data['created_date'] = createdDate;
    data['start_date'] = startDate;
    data['customer_id'] = customerId;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    data['invoice_notes'] = invoiceNotes;
    data['reactivate_date'] = reactivateDate;
    if (contactpersons != null) {
      data['contactpersons'] = contactpersons!.map((v) => v.toJson()).toList();
    }
    if (contactPersonsAssociated != null) {
      data['contact_persons_associated'] =
          contactPersonsAssociated!.map((v) => v.toJson()).toList();
    }
    if (card != null) {
      data['card'] = card!.toJson();
    }
    data['allow_partial_payments'] = allowPartialPayments;
    if (paymentGateways != null) {
      data['payment_gateways'] =
          paymentGateways!.map((v) => v.toJson()).toList();
    }
    data['is_advance_invoice_present'] = isAdvanceInvoicePresent;
    data['apply_changes_on'] = applyChangesOn;
    data['is_scheduled_update'] = isScheduledUpdate;
    data['allow_in_term_reactivation'] = allowInTermReactivation;
    data['last_child_inv_balance'] = lastChildInvBalance;
    data['last_child_inv_status'] = lastChildInvStatus;
    data['is_in_term_reactivation_scheduled'] = isInTermReactivationScheduled;
    data['max_date_for_in_term'] = maxDateForInTerm;
    return data;
  }
}

class LineItems {
  String? lineItemId;
  String? itemId;
  String? code;
  var itemOrder;
  String? name;
  String? internalName;
  String? description;
  var type;
  String? unit;
  var quantity;
  var discountAmount;
  var discount;
  var bcyRate;
  var rate;
  String? accountId;
  String? accountName;
  String? headerId;
  String? headerName;
  String? pricebookId;
  String? taxId;
  String? taxName;
  String? taxType;
  var taxPercentage;
  var itemTotal;
  String? pricingScheme;
  String? expenseId;
  String? itemType;
  String? expenseReceiptName;
  String? salesorderItemId;
  var costAmount;
  var markupPercent;

  LineItems(
      {this.lineItemId,
      this.itemId,
      this.code,
      this.itemOrder,
      this.name,
      this.internalName,
      this.description,
      this.type,
      this.unit,
      this.quantity,
      this.discountAmount,
      this.discount,
      this.bcyRate,
      this.rate,
      this.accountId,
      this.accountName,
      this.headerId,
      this.headerName,
      this.pricebookId,
      this.taxId,
      this.taxName,
      this.taxType,
      this.taxPercentage,
      this.itemTotal,
      this.pricingScheme,
      this.expenseId,
      this.itemType,
      this.expenseReceiptName,
      this.salesorderItemId,
      this.costAmount,
      this.markupPercent});

  LineItems.fromJson(Map<String, dynamic> json) {
    lineItemId = json['line_item_id'];
    itemId = json['item_id'];
    code = json['code'];
    itemOrder = json['item_order'];
    name = json['name'];
    internalName = json['internal_name'];
    description = json['description'];
    type = json['type'];
    unit = json['unit'];
    quantity = json['quantity'];
    discountAmount = json['discount_amount'];
    discount = json['discount'];
    bcyRate = json['bcy_rate'];
    rate = json['rate'];
    accountId = json['account_id'];
    accountName = json['account_name'];
    headerId = json['header_id'];
    headerName = json['header_name'];
    pricebookId = json['pricebook_id'];
    taxId = json['tax_id'];
    taxName = json['tax_name'];
    taxType = json['tax_type'];
    taxPercentage = json['tax_percentage'];
    itemTotal = json['item_total'];
    pricingScheme = json['pricing_scheme'];
    expenseId = json['expense_id'];
    itemType = json['item_type'];
    expenseReceiptName = json['expense_receipt_name'];
    salesorderItemId = json['salesorder_item_id'];
    costAmount = json['cost_amount'];
    markupPercent = json['markup_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['line_item_id'] = lineItemId;
    data['item_id'] = itemId;
    data['code'] = code;
    data['item_order'] = itemOrder;
    data['name'] = name;
    data['internal_name'] = internalName;
    data['description'] = description;
    data['type'] = type;
    data['unit'] = unit;
    data['quantity'] = quantity;
    data['discount_amount'] = discountAmount;
    data['discount'] = discount;
    data['bcy_rate'] = bcyRate;
    data['rate'] = rate;
    data['account_id'] = accountId;
    data['account_name'] = accountName;
    data['header_id'] = headerId;
    data['header_name'] = headerName;
    data['pricebook_id'] = pricebookId;
    data['tax_id'] = taxId;
    data['tax_name'] = taxName;
    data['tax_type'] = taxType;
    data['tax_percentage'] = taxPercentage;
    data['item_total'] = itemTotal;
    data['pricing_scheme'] = pricingScheme;
    data['expense_id'] = expenseId;
    data['item_type'] = itemType;
    data['expense_receipt_name'] = expenseReceiptName;
    data['salesorder_item_id'] = salesorderItemId;
    data['cost_amount'] = costAmount;
    data['markup_percent'] = markupPercent;
    return data;
  }
}

class Plan {
  String? planId;
  String? planCode;
  String? name;
  String? internalName;
  String? description;
  var price;
  var quantity;
  String? discountFormatted;
  var discountAmount;
  var discount;
  var total;
  var setupFee;
  String? taxId;
  String? taxName;
  var taxPercentage;
  String? taxType;
  String? setupFeeTaxId;
  String? setupFeeTaxName;
  String? setupFeeTaxPercentage;
  String? setupFeeTaxType;
  String? unit;
  String? pricingScheme;

  Plan(
      {this.planId,
      this.planCode,
      this.name,
      this.internalName,
      this.description,
      this.price,
      this.quantity,
      this.discountFormatted,
      this.discountAmount,
      this.discount,
      this.total,
      this.setupFee,
      this.taxId,
      this.taxName,
      this.taxPercentage,
      this.taxType,
      this.setupFeeTaxId,
      this.setupFeeTaxName,
      this.setupFeeTaxPercentage,
      this.setupFeeTaxType,
      this.unit,
      this.pricingScheme});

  Plan.fromJson(Map<String, dynamic> json) {
    planId = json['plan_id'];
    planCode = json['plan_code'];
    name = json['name'];
    internalName = json['internal_name'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
    discountFormatted = json['discount_formatted'];
    discountAmount = json['discount_amount'];
    discount = json['discount'];
    total = json['total'];
    setupFee = json['setup_fee'];
    taxId = json['tax_id'];
    taxName = json['tax_name'];
    taxPercentage = json['tax_percentage'];
    taxType = json['tax_type'];
    setupFeeTaxId = json['setup_fee_tax_id'];
    setupFeeTaxName = json['setup_fee_tax_name'];
    setupFeeTaxPercentage = json['setup_fee_tax_percentage'];
    setupFeeTaxType = json['setup_fee_tax_type'];
    unit = json['unit'];
    pricingScheme = json['pricing_scheme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plan_id'] = planId;
    data['plan_code'] = planCode;
    data['name'] = name;
    data['internal_name'] = internalName;
    data['description'] = description;
    data['price'] = price;
    data['quantity'] = quantity;
    data['discount_formatted'] = discountFormatted;
    data['discount_amount'] = discountAmount;
    data['discount'] = discount;
    data['total'] = total;
    data['setup_fee'] = setupFee;
    data['tax_id'] = taxId;
    data['tax_name'] = taxName;
    data['tax_percentage'] = taxPercentage;
    data['tax_type'] = taxType;
    data['setup_fee_tax_id'] = setupFeeTaxId;
    data['setup_fee_tax_name'] = setupFeeTaxName;
    data['setup_fee_tax_percentage'] = setupFeeTaxPercentage;
    data['setup_fee_tax_type'] = setupFeeTaxType;
    data['unit'] = unit;
    data['pricing_scheme'] = pricingScheme;
    return data;
  }
}

class Customer {
  String? customerId;
  String? displayName;
  String? companyName;
  String? firstName;
  String? lastName;
  String? salutation;
  String? email;
  String? website;
  String? ipAddress;
  String? zcrmAccountId;
  String? zcrmContactId;
  BillingAddress? billingAddress;
  BillingAddress? shippingAddress;
  var paymentTerms;
  String? paymentTermsLabel;
  List<CustomFields>? customFields;
  String? cfEmailAddress;
  String? cfEmailAddressUnformatted;
  CustomFieldHash? customFieldHash;
  String? channelReferenceId;
  String? channelCustomerId;

  Customer(
      {this.customerId,
      this.displayName,
      this.companyName,
      this.firstName,
      this.lastName,
      this.salutation,
      this.email,
      this.website,
      this.ipAddress,
      this.zcrmAccountId,
      this.zcrmContactId,
      this.billingAddress,
      this.shippingAddress,
      this.paymentTerms,
      this.paymentTermsLabel,
      this.customFields,
      this.cfEmailAddress,
      this.cfEmailAddressUnformatted,
      this.customFieldHash,
      this.channelReferenceId,
      this.channelCustomerId});

  Customer.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    displayName = json['display_name'];
    companyName = json['company_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    salutation = json['salutation'];
    email = json['email'];
    website = json['website'];
    ipAddress = json['ip_address'];
    zcrmAccountId = json['zcrm_account_id'];
    zcrmContactId = json['zcrm_contact_id'];
    billingAddress = json['billing_address'] != null
        ? BillingAddress.fromJson(json['billing_address'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ? BillingAddress.fromJson(json['shipping_address'])
        : null;
    paymentTerms = json['payment_terms'];
    paymentTermsLabel = json['payment_terms_label'];
    if (json['custom_fields'] != null) {
      customFields = <CustomFields>[];
      json['custom_fields'].forEach((v) {
        customFields!.add(CustomFields.fromJson(v));
      });
    }
    cfEmailAddress = json['cf_email_address'];
    cfEmailAddressUnformatted = json['cf_email_address_unformatted'];
    customFieldHash = json['custom_field_hash'] != null
        ? CustomFieldHash.fromJson(json['custom_field_hash'])
        : null;
    channelReferenceId = json['channel_reference_id'];
    channelCustomerId = json['channel_customer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customerId;
    data['display_name'] = displayName;
    data['company_name'] = companyName;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['salutation'] = salutation;
    data['email'] = email;
    data['website'] = website;
    data['ip_address'] = ipAddress;
    data['zcrm_account_id'] = zcrmAccountId;
    data['zcrm_contact_id'] = zcrmContactId;
    if (billingAddress != null) {
      data['billing_address'] = billingAddress!.toJson();
    }
    if (shippingAddress != null) {
      data['shipping_address'] = shippingAddress!.toJson();
    }
    data['payment_terms'] = paymentTerms;
    data['payment_terms_label'] = paymentTermsLabel;
    if (customFields != null) {
      data['custom_fields'] = customFields!.map((v) => v.toJson()).toList();
    }
    data['cf_email_address'] = cfEmailAddress;
    data['cf_email_address_unformatted'] = cfEmailAddressUnformatted;
    if (customFieldHash != null) {
      data['custom_field_hash'] = customFieldHash!.toJson();
    }
    data['channel_reference_id'] = channelReferenceId;
    data['channel_customer_id'] = channelCustomerId;
    return data;
  }
}

class BillingAddress {
  String? street;
  String? street2;
  String? city;
  String? state;
  String? zip;
  String? country;
  String? fax;
  String? phone;
  String? attention;

  BillingAddress(
      {this.street,
      this.street2,
      this.city,
      this.state,
      this.zip,
      this.country,
      this.fax,
      this.phone,
      this.attention});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    street2 = json['street2'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    country = json['country'];
    fax = json['fax'];
    phone = json['phone'];
    attention = json['attention'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['street2'] = street2;
    data['city'] = city;
    data['state'] = state;
    data['zip'] = zip;
    data['country'] = country;
    data['fax'] = fax;
    data['phone'] = phone;
    data['attention'] = attention;
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
  String? cfEmailAddressUnformatted;

  CustomFieldHash({this.cfEmailAddress, this.cfEmailAddressUnformatted});

  CustomFieldHash.fromJson(Map<String, dynamic> json) {
    cfEmailAddress = json['cf_email_address'];
    cfEmailAddressUnformatted = json['cf_email_address_unformatted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cf_email_address'] = cfEmailAddress;
    data['cf_email_address_unformatted'] = cfEmailAddressUnformatted;
    return data;
  }
}

class Contactpersons {
  String? contactpersonId;
  String? email;
  String? firstName;
  String? lastName;
  String? phone;
  String? mobile;
  String? zcrmContactId;

  Contactpersons(
      {this.contactpersonId,
      this.email,
      this.firstName,
      this.lastName,
      this.phone,
      this.mobile,
      this.zcrmContactId});

  Contactpersons.fromJson(Map<String, dynamic> json) {
    contactpersonId = json['contactperson_id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    mobile = json['mobile'];
    zcrmContactId = json['zcrm_contact_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contactperson_id'] = contactpersonId;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['mobile'] = mobile;
    data['zcrm_contact_id'] = zcrmContactId;
    return data;
  }
}

class ContactPersonsAssociated {
  String? contactPersonId;
  String? contactPersonName;
  String? firstName;
  String? lastName;
  String? contactPersonEmail;
  String? phone;
  String? mobile;
  String? zcrmContactId;
  CommunicationPreference? communicationPreference;

  ContactPersonsAssociated(
      {this.contactPersonId,
      this.contactPersonName,
      this.firstName,
      this.lastName,
      this.contactPersonEmail,
      this.phone,
      this.mobile,
      this.zcrmContactId,
      this.communicationPreference});

  ContactPersonsAssociated.fromJson(Map<String, dynamic> json) {
    contactPersonId = json['contact_person_id'];
    contactPersonName = json['contact_person_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    contactPersonEmail = json['contact_person_email'];
    phone = json['phone'];
    mobile = json['mobile'];
    zcrmContactId = json['zcrm_contact_id'];
    communicationPreference = json['communication_preference'] != null
        ? CommunicationPreference.fromJson(json['communication_preference'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contact_person_id'] = contactPersonId;
    data['contact_person_name'] = contactPersonName;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['contact_person_email'] = contactPersonEmail;
    data['phone'] = phone;
    data['mobile'] = mobile;
    data['zcrm_contact_id'] = zcrmContactId;
    if (communicationPreference != null) {
      data['communication_preference'] = communicationPreference!.toJson();
    }
    return data;
  }
}

class CommunicationPreference {
  bool? isEmailEnabled;

  CommunicationPreference({this.isEmailEnabled});

  CommunicationPreference.fromJson(Map<String, dynamic> json) {
    isEmailEnabled = json['is_email_enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_email_enabled'] = isEmailEnabled;
    return data;
  }
}

class Card {
  String? cardId;
  String? lastFourDigits;
  var expiryMonth;
  var expiryYear;
  bool? isPrimary;
  bool? isBackup;
  String? funding;
  String? cardType;
  String? paymentGateway;
  String? gatewayCardId;
  String? gatewayCustomerId;

  Card(
      {this.cardId,
      this.lastFourDigits,
      this.expiryMonth,
      this.expiryYear,
      this.isPrimary,
      this.isBackup,
      this.funding,
      this.cardType,
      this.paymentGateway,
      this.gatewayCardId,
      this.gatewayCustomerId});

  Card.fromJson(Map<String, dynamic> json) {
    cardId = json['card_id'];
    lastFourDigits = json['last_four_digits'];
    expiryMonth = json['expiry_month'];
    expiryYear = json['expiry_year'];
    isPrimary = json['is_primary'];
    isBackup = json['is_backup'];
    funding = json['funding'];
    cardType = json['card_type'];
    paymentGateway = json['payment_gateway'];
    gatewayCardId = json['gateway_card_id'];
    gatewayCustomerId = json['gateway_customer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['card_id'] = cardId;
    data['last_four_digits'] = lastFourDigits;
    data['expiry_month'] = expiryMonth;
    data['expiry_year'] = expiryYear;
    data['is_primary'] = isPrimary;
    data['is_backup'] = isBackup;
    data['funding'] = funding;
    data['card_type'] = cardType;
    data['payment_gateway'] = paymentGateway;
    data['gateway_card_id'] = gatewayCardId;
    data['gateway_customer_id'] = gatewayCustomerId;
    return data;
  }
}

class PaymentGateways {
  String? paymentGateway;
  String? gatewayName;

  PaymentGateways({this.paymentGateway, this.gatewayName});

  PaymentGateways.fromJson(Map<String, dynamic> json) {
    paymentGateway = json['payment_gateway'];
    gatewayName = json['gateway_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_gateway'] = paymentGateway;
    data['gateway_name'] = gatewayName;
    return data;
  }
}
