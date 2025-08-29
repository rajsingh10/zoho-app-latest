class PdfViewModal {
  var code;
  String? message;
  Invoice? invoice;

  PdfViewModal({this.code, this.message, this.invoice});

  PdfViewModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    invoice =
        json['invoice'] != null ? new Invoice.fromJson(json['invoice']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.invoice != null) {
      data['invoice'] = this.invoice!.toJson();
    }
    return data;
  }
}

class Invoice {
  String? invoiceId;
  String? unbilledChargesId;
  var exchangeRate;
  String? number;
  String? invoiceNumber;
  String? invoiceDate;
  String? date;
  String? dueDate;
  String? referenceNumber;
  String? zcrmPotentialId;
  String? paymentExpectedDate;
  bool? canSendInvoiceSms;
  bool? stopReminderUntilPaymentExpectedDate;
  String? status;
  bool? canEditItems;
  bool? canSkipPaymentInfo;
  bool? inprocessTransactionPresent;
  var unprocessedPaymentAmount;
  bool? achPaymentInitiated;
  bool? allowPartialPayments;
  String? transactionType;
  String? customerId;
  String? customerName;
  String? vatTreatment;
  String? email;
  String? pricebookId;
  String? currencyId;
  String? currencyCode;
  String? currencySymbol;
  bool? isInclusiveTax;
  String? taxRounding;
  bool? isViewedByClient;
  String? clientViewedTime;
  bool? isViewedInMail;
  String? mailFirstViewedTime;
  String? mailLastViewedTime;
  bool? isReverseChargeApplied;
  List<InvoiceItems>? invoiceItems;
  List<Taxes>? taxes;
  bool? isTaxable;
  String? shippingChargeTaxId;
  String? shippingChargeTaxName;
  String? shippingChargeTaxType;
  String? shippingChargeTaxPercentage;
  String? shippingChargeTaxExemptionId;
  String? shippingChargeTaxExemptionCode;
  String? shippingChargeTax;
  String? bcyShippingChargeTax;
  var shippingChargeExclusiveOfTax;
  var shippingChargeInclusiveOfTax;
  String? shippingChargeTaxFormatted;
  String? shippingChargeExclusiveOfTaxFormatted;
  String? shippingChargeInclusiveOfTaxFormatted;
  String? shippingChargeAccountId;
  String? shippingChargeAccountName;
  var shippingCharge;
  var adjustment;
  var subTotal;
  var taxTotal;
  var discountTotal;
  bool? paymentReminderEnabled;
  bool? autoRemindersConfigured;
  var total;
  var discountPercent;
  var bcyShippingCharge;
  var bcyAdjustment;
  String? adjustmentDescription;
  String? subjectContent;
  var bcySubTotal;
  var bcyDiscountTotal;
  var bcyTaxTotal;
  var bcyTotal;
  var paymentMade;
  var unusedCreditsReceivableAmount;
  var creditsApplied;
  var taxAmountWithheld;
  List<Credits>? credits;
  var pricePrecision;
  var balance;
  var writeOffAmount;
  String? salespersonId;
  String? salespersonName;
  String? submitterId;
  String? approverId;
  String? createdTime;
  String? updatedTime;
  String? createdDate;
  String? createdById;
  String? lastModifiedById;
  String? invoiceUrl;
  String? referenceId;
  BillingAddress? billingAddress;
  BillingAddress? shippingAddress;
  List<Subscriptions>? subscriptions;
  String? templateType;
  String? pageWidth;
  String? templateId;
  String? templateName;
  String? notes;
  String? terms;
  var paymentTerms;
  String? paymentTermsLabel;
  List<Contactpersons>? contactpersons;
  List<ContactPersonsAssociated>? contactPersonsAssociated;
  Contact? contact;
  List<PaymentGateways>? paymentGateways;
  bool? canSendInMail;
  QrCode? qrCode;
  String? tdsCalculationType;
  var totalRetentionAmount;
  String? retentionOverridePreference;
  var roundoffValue;

  Invoice(
      {this.invoiceId,
      this.unbilledChargesId,
      this.exchangeRate,
      this.number,
      this.invoiceNumber,
      this.invoiceDate,
      this.date,
      this.dueDate,
      this.referenceNumber,
      this.zcrmPotentialId,
      this.paymentExpectedDate,
      this.canSendInvoiceSms,
      this.stopReminderUntilPaymentExpectedDate,
      this.status,
      this.canEditItems,
      this.canSkipPaymentInfo,
      this.inprocessTransactionPresent,
      this.unprocessedPaymentAmount,
      this.achPaymentInitiated,
      this.allowPartialPayments,
      this.transactionType,
      this.customerId,
      this.customerName,
      this.vatTreatment,
      this.email,
      this.pricebookId,
      this.currencyId,
      this.currencyCode,
      this.currencySymbol,
      this.isInclusiveTax,
      this.taxRounding,
      this.isViewedByClient,
      this.clientViewedTime,
      this.isViewedInMail,
      this.mailFirstViewedTime,
      this.mailLastViewedTime,
      this.isReverseChargeApplied,
      this.invoiceItems,
      this.taxes,
      this.isTaxable,
      this.shippingChargeTaxId,
      this.shippingChargeTaxName,
      this.shippingChargeTaxType,
      this.shippingChargeTaxPercentage,
      this.shippingChargeTaxExemptionId,
      this.shippingChargeTaxExemptionCode,
      this.shippingChargeTax,
      this.bcyShippingChargeTax,
      this.shippingChargeExclusiveOfTax,
      this.shippingChargeInclusiveOfTax,
      this.shippingChargeTaxFormatted,
      this.shippingChargeExclusiveOfTaxFormatted,
      this.shippingChargeInclusiveOfTaxFormatted,
      this.shippingChargeAccountId,
      this.shippingChargeAccountName,
      this.shippingCharge,
      this.adjustment,
      this.subTotal,
      this.taxTotal,
      this.discountTotal,
      this.paymentReminderEnabled,
      this.autoRemindersConfigured,
      this.total,
      this.discountPercent,
      this.bcyShippingCharge,
      this.bcyAdjustment,
      this.adjustmentDescription,
      this.subjectContent,
      this.bcySubTotal,
      this.bcyDiscountTotal,
      this.bcyTaxTotal,
      this.bcyTotal,
      this.paymentMade,
      this.unusedCreditsReceivableAmount,
      this.creditsApplied,
      this.taxAmountWithheld,
      this.credits,
      this.pricePrecision,
      this.balance,
      this.writeOffAmount,
      this.salespersonId,
      this.salespersonName,
      this.submitterId,
      this.approverId,
      this.createdTime,
      this.updatedTime,
      this.createdDate,
      this.createdById,
      this.lastModifiedById,
      this.invoiceUrl,
      this.referenceId,
      this.billingAddress,
      this.shippingAddress,
      this.subscriptions,
      this.templateType,
      this.pageWidth,
      this.templateId,
      this.templateName,
      this.notes,
      this.terms,
      this.paymentTerms,
      this.paymentTermsLabel,
      this.contactpersons,
      this.contactPersonsAssociated,
      this.contact,
      this.paymentGateways,
      this.canSendInMail,
      this.qrCode,
      this.tdsCalculationType,
      this.totalRetentionAmount,
      this.retentionOverridePreference,
      this.roundoffValue});

  Invoice.fromJson(Map<String, dynamic> json) {
    invoiceId = json['invoice_id'];
    unbilledChargesId = json['unbilled_charges_id'];
    exchangeRate = json['exchange_rate'];
    number = json['number'];
    invoiceNumber = json['invoice_number'];
    invoiceDate = json['invoice_date'];
    date = json['date'];
    dueDate = json['due_date'];
    referenceNumber = json['reference_number'];
    zcrmPotentialId = json['zcrm_potential_id'];
    paymentExpectedDate = json['payment_expected_date'];
    canSendInvoiceSms = json['can_send_invoice_sms'];
    stopReminderUntilPaymentExpectedDate =
        json['stop_reminder_until_payment_expected_date'];
    status = json['status'];
    canEditItems = json['can_edit_items'];
    canSkipPaymentInfo = json['can_skip_payment_info'];
    inprocessTransactionPresent = json['inprocess_transaction_present'];
    unprocessedPaymentAmount = json['unprocessed_payment_amount'];
    achPaymentInitiated = json['ach_payment_initiated'];
    allowPartialPayments = json['allow_partial_payments'];
    transactionType = json['transaction_type'];
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    vatTreatment = json['vat_treatment'];
    email = json['email'];
    pricebookId = json['pricebook_id'];
    currencyId = json['currency_id'];
    currencyCode = json['currency_code'];
    currencySymbol = json['currency_symbol'];
    isInclusiveTax = json['is_inclusive_tax'];
    taxRounding = json['tax_rounding'];
    isViewedByClient = json['is_viewed_by_client'];
    clientViewedTime = json['client_viewed_time'];
    isViewedInMail = json['is_viewed_in_mail'];
    mailFirstViewedTime = json['mail_first_viewed_time'];
    mailLastViewedTime = json['mail_last_viewed_time'];
    isReverseChargeApplied = json['is_reverse_charge_applied'];
    if (json['invoice_items'] != null) {
      invoiceItems = <InvoiceItems>[];
      json['invoice_items'].forEach((v) {
        invoiceItems!.add(new InvoiceItems.fromJson(v));
      });
    }
    if (json['taxes'] != null) {
      taxes = <Taxes>[];
      json['taxes'].forEach((v) {
        taxes!.add(new Taxes.fromJson(v));
      });
    }
    isTaxable = json['is_taxable'];
    shippingChargeTaxId = json['shipping_charge_tax_id'];
    shippingChargeTaxName = json['shipping_charge_tax_name'];
    shippingChargeTaxType = json['shipping_charge_tax_type'];
    shippingChargeTaxPercentage = json['shipping_charge_tax_percentage'];
    shippingChargeTaxExemptionId = json['shipping_charge_tax_exemption_id'];
    shippingChargeTaxExemptionCode = json['shipping_charge_tax_exemption_code'];
    shippingChargeTax = json['shipping_charge_tax'];
    bcyShippingChargeTax = json['bcy_shipping_charge_tax'];
    shippingChargeExclusiveOfTax = json['shipping_charge_exclusive_of_tax'];
    shippingChargeInclusiveOfTax = json['shipping_charge_inclusive_of_tax'];
    shippingChargeTaxFormatted = json['shipping_charge_tax_formatted'];
    shippingChargeExclusiveOfTaxFormatted =
        json['shipping_charge_exclusive_of_tax_formatted'];
    shippingChargeInclusiveOfTaxFormatted =
        json['shipping_charge_inclusive_of_tax_formatted'];
    shippingChargeAccountId = json['shipping_charge_account_id'];
    shippingChargeAccountName = json['shipping_charge_account_name'];
    shippingCharge = json['shipping_charge'];
    adjustment = json['adjustment'];
    subTotal = json['sub_total'];
    taxTotal = json['tax_total'];
    discountTotal = json['discount_total'];
    paymentReminderEnabled = json['payment_reminder_enabled'];
    autoRemindersConfigured = json['auto_reminders_configured'];
    total = json['total'];
    discountPercent = json['discount_percent'];
    bcyShippingCharge = json['bcy_shipping_charge'];
    bcyAdjustment = json['bcy_adjustment'];
    adjustmentDescription = json['adjustment_description'];
    subjectContent = json['subject_content'];
    bcySubTotal = json['bcy_sub_total'];
    bcyDiscountTotal = json['bcy_discount_total'];
    bcyTaxTotal = json['bcy_tax_total'];
    bcyTotal = json['bcy_total'];
    paymentMade = json['payment_made'];
    unusedCreditsReceivableAmount = json['unused_credits_receivable_amount'];
    creditsApplied = json['credits_applied'];
    taxAmountWithheld = json['tax_amount_withheld'];
    if (json['credits'] != null) {
      credits = <Credits>[];
      json['credits'].forEach((v) {
        credits!.add(new Credits.fromJson(v));
      });
    }
    pricePrecision = json['price_precision'];
    balance = json['balance'];
    writeOffAmount = json['write_off_amount'];
    salespersonId = json['salesperson_id'];
    salespersonName = json['salesperson_name'];
    submitterId = json['submitter_id'];
    approverId = json['approver_id'];
    createdTime = json['created_time'];
    updatedTime = json['updated_time'];
    createdDate = json['created_date'];
    createdById = json['created_by_id'];
    lastModifiedById = json['last_modified_by_id'];
    invoiceUrl = json['invoice_url'];
    referenceId = json['reference_id'];
    billingAddress = json['billing_address'] != null
        ? new BillingAddress.fromJson(json['billing_address'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ? new BillingAddress.fromJson(json['shipping_address'])
        : null;
    if (json['subscriptions'] != null) {
      subscriptions = <Subscriptions>[];
      json['subscriptions'].forEach((v) {
        subscriptions!.add(new Subscriptions.fromJson(v));
      });
    }
    templateType = json['template_type'];
    pageWidth = json['page_width'];
    templateId = json['template_id'];
    templateName = json['template_name'];
    notes = json['notes'];
    terms = json['terms'];
    paymentTerms = json['payment_terms'];
    paymentTermsLabel = json['payment_terms_label'];
    if (json['contactpersons'] != null) {
      contactpersons = <Contactpersons>[];
      json['contactpersons'].forEach((v) {
        contactpersons!.add(new Contactpersons.fromJson(v));
      });
    }
    if (json['contact_persons_associated'] != null) {
      contactPersonsAssociated = <ContactPersonsAssociated>[];
      json['contact_persons_associated'].forEach((v) {
        contactPersonsAssociated!.add(new ContactPersonsAssociated.fromJson(v));
      });
    }
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    if (json['payment_gateways'] != null) {
      paymentGateways = <PaymentGateways>[];
      json['payment_gateways'].forEach((v) {
        paymentGateways!.add(new PaymentGateways.fromJson(v));
      });
    }
    canSendInMail = json['can_send_in_mail'];
    qrCode =
        json['qr_code'] != null ? new QrCode.fromJson(json['qr_code']) : null;
    tdsCalculationType = json['tds_calculation_type'];
    totalRetentionAmount = json['total_retention_amount'];
    retentionOverridePreference = json['retention_override_preference'];
    roundoffValue = json['roundoff_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoice_id'] = this.invoiceId;
    data['unbilled_charges_id'] = this.unbilledChargesId;
    data['exchange_rate'] = this.exchangeRate;
    data['number'] = this.number;
    data['invoice_number'] = this.invoiceNumber;
    data['invoice_date'] = this.invoiceDate;
    data['date'] = this.date;
    data['due_date'] = this.dueDate;
    data['reference_number'] = this.referenceNumber;
    data['zcrm_potential_id'] = this.zcrmPotentialId;
    data['payment_expected_date'] = this.paymentExpectedDate;
    data['can_send_invoice_sms'] = this.canSendInvoiceSms;
    data['stop_reminder_until_payment_expected_date'] =
        this.stopReminderUntilPaymentExpectedDate;
    data['status'] = this.status;
    data['can_edit_items'] = this.canEditItems;
    data['can_skip_payment_info'] = this.canSkipPaymentInfo;
    data['inprocess_transaction_present'] = this.inprocessTransactionPresent;
    data['unprocessed_payment_amount'] = this.unprocessedPaymentAmount;
    data['ach_payment_initiated'] = this.achPaymentInitiated;
    data['allow_partial_payments'] = this.allowPartialPayments;
    data['transaction_type'] = this.transactionType;
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['vat_treatment'] = this.vatTreatment;
    data['email'] = this.email;
    data['pricebook_id'] = this.pricebookId;
    data['currency_id'] = this.currencyId;
    data['currency_code'] = this.currencyCode;
    data['currency_symbol'] = this.currencySymbol;
    data['is_inclusive_tax'] = this.isInclusiveTax;
    data['tax_rounding'] = this.taxRounding;
    data['is_viewed_by_client'] = this.isViewedByClient;
    data['client_viewed_time'] = this.clientViewedTime;
    data['is_viewed_in_mail'] = this.isViewedInMail;
    data['mail_first_viewed_time'] = this.mailFirstViewedTime;
    data['mail_last_viewed_time'] = this.mailLastViewedTime;
    data['is_reverse_charge_applied'] = this.isReverseChargeApplied;
    if (this.invoiceItems != null) {
      data['invoice_items'] =
          this.invoiceItems!.map((v) => v.toJson()).toList();
    }
    if (this.taxes != null) {
      data['taxes'] = this.taxes!.map((v) => v.toJson()).toList();
    }
    data['is_taxable'] = this.isTaxable;
    data['shipping_charge_tax_id'] = this.shippingChargeTaxId;
    data['shipping_charge_tax_name'] = this.shippingChargeTaxName;
    data['shipping_charge_tax_type'] = this.shippingChargeTaxType;
    data['shipping_charge_tax_percentage'] = this.shippingChargeTaxPercentage;
    data['shipping_charge_tax_exemption_id'] =
        this.shippingChargeTaxExemptionId;
    data['shipping_charge_tax_exemption_code'] =
        this.shippingChargeTaxExemptionCode;
    data['shipping_charge_tax'] = this.shippingChargeTax;
    data['bcy_shipping_charge_tax'] = this.bcyShippingChargeTax;
    data['shipping_charge_exclusive_of_tax'] =
        this.shippingChargeExclusiveOfTax;
    data['shipping_charge_inclusive_of_tax'] =
        this.shippingChargeInclusiveOfTax;
    data['shipping_charge_tax_formatted'] = this.shippingChargeTaxFormatted;
    data['shipping_charge_exclusive_of_tax_formatted'] =
        this.shippingChargeExclusiveOfTaxFormatted;
    data['shipping_charge_inclusive_of_tax_formatted'] =
        this.shippingChargeInclusiveOfTaxFormatted;
    data['shipping_charge_account_id'] = this.shippingChargeAccountId;
    data['shipping_charge_account_name'] = this.shippingChargeAccountName;
    data['shipping_charge'] = this.shippingCharge;
    data['adjustment'] = this.adjustment;
    data['sub_total'] = this.subTotal;
    data['tax_total'] = this.taxTotal;
    data['discount_total'] = this.discountTotal;
    data['payment_reminder_enabled'] = this.paymentReminderEnabled;
    data['auto_reminders_configured'] = this.autoRemindersConfigured;
    data['total'] = this.total;
    data['discount_percent'] = this.discountPercent;
    data['bcy_shipping_charge'] = this.bcyShippingCharge;
    data['bcy_adjustment'] = this.bcyAdjustment;
    data['adjustment_description'] = this.adjustmentDescription;
    data['subject_content'] = this.subjectContent;
    data['bcy_sub_total'] = this.bcySubTotal;
    data['bcy_discount_total'] = this.bcyDiscountTotal;
    data['bcy_tax_total'] = this.bcyTaxTotal;
    data['bcy_total'] = this.bcyTotal;
    data['payment_made'] = this.paymentMade;
    data['unused_credits_receivable_amount'] =
        this.unusedCreditsReceivableAmount;
    data['credits_applied'] = this.creditsApplied;
    data['tax_amount_withheld'] = this.taxAmountWithheld;
    if (this.credits != null) {
      data['credits'] = this.credits!.map((v) => v.toJson()).toList();
    }
    data['price_precision'] = this.pricePrecision;
    data['balance'] = this.balance;
    data['write_off_amount'] = this.writeOffAmount;
    data['salesperson_id'] = this.salespersonId;
    data['salesperson_name'] = this.salespersonName;
    data['submitter_id'] = this.submitterId;
    data['approver_id'] = this.approverId;
    data['created_time'] = this.createdTime;
    data['updated_time'] = this.updatedTime;
    data['created_date'] = this.createdDate;
    data['created_by_id'] = this.createdById;
    data['last_modified_by_id'] = this.lastModifiedById;
    data['invoice_url'] = this.invoiceUrl;
    data['reference_id'] = this.referenceId;
    if (this.billingAddress != null) {
      data['billing_address'] = this.billingAddress!.toJson();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    if (this.subscriptions != null) {
      data['subscriptions'] =
          this.subscriptions!.map((v) => v.toJson()).toList();
    }
    data['template_type'] = this.templateType;
    data['page_width'] = this.pageWidth;
    data['template_id'] = this.templateId;
    data['template_name'] = this.templateName;
    data['notes'] = this.notes;
    data['terms'] = this.terms;
    data['payment_terms'] = this.paymentTerms;
    data['payment_terms_label'] = this.paymentTermsLabel;
    if (this.contactpersons != null) {
      data['contactpersons'] =
          this.contactpersons!.map((v) => v.toJson()).toList();
    }
    if (this.contactPersonsAssociated != null) {
      data['contact_persons_associated'] =
          this.contactPersonsAssociated!.map((v) => v.toJson()).toList();
    }
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    if (this.paymentGateways != null) {
      data['payment_gateways'] =
          this.paymentGateways!.map((v) => v.toJson()).toList();
    }
    data['can_send_in_mail'] = this.canSendInMail;
    if (this.qrCode != null) {
      data['qr_code'] = this.qrCode!.toJson();
    }
    data['tds_calculation_type'] = this.tdsCalculationType;
    data['total_retention_amount'] = this.totalRetentionAmount;
    data['retention_override_preference'] = this.retentionOverridePreference;
    data['roundoff_value'] = this.roundoffValue;
    return data;
  }
}

class InvoiceItems {
  String? projectId;
  String? itemId;
  String? productId;
  String? name;
  String? description;
  String? unit;
  String? code;
  String? subscriptionId;
  String? accountId;
  String? accountName;
  var price;
  var quantity;
  var discountAmount;
  var itemTotal;
  String? taxName;
  String? taxType;
  var taxPercentage;
  String? taxId;
  String? productType;

  InvoiceItems(
      {this.projectId,
      this.itemId,
      this.productId,
      this.name,
      this.description,
      this.unit,
      this.code,
      this.subscriptionId,
      this.accountId,
      this.accountName,
      this.price,
      this.quantity,
      this.discountAmount,
      this.itemTotal,
      this.taxName,
      this.taxType,
      this.taxPercentage,
      this.taxId,
      this.productType});

  InvoiceItems.fromJson(Map<String, dynamic> json) {
    projectId = json['project_id'];
    itemId = json['item_id'];
    productId = json['product_id'];
    name = json['name'];
    description = json['description'];
    unit = json['unit'];
    code = json['code'];
    subscriptionId = json['subscription_id'];
    accountId = json['account_id'];
    accountName = json['account_name'];
    price = json['price'];
    quantity = json['quantity'];
    discountAmount = json['discount_amount'];
    itemTotal = json['item_total'];
    taxName = json['tax_name'];
    taxType = json['tax_type'];
    taxPercentage = json['tax_percentage'];
    taxId = json['tax_id'];
    productType = json['product_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project_id'] = this.projectId;
    data['item_id'] = this.itemId;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['unit'] = this.unit;
    data['code'] = this.code;
    data['subscription_id'] = this.subscriptionId;
    data['account_id'] = this.accountId;
    data['account_name'] = this.accountName;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['discount_amount'] = this.discountAmount;
    data['item_total'] = this.itemTotal;
    data['tax_name'] = this.taxName;
    data['tax_type'] = this.taxType;
    data['tax_percentage'] = this.taxPercentage;
    data['tax_id'] = this.taxId;
    data['product_type'] = this.productType;
    return data;
  }
}

class Taxes {
  String? taxName;
  var taxAmount;

  Taxes({this.taxName, this.taxAmount});

  Taxes.fromJson(Map<String, dynamic> json) {
    taxName = json['tax_name'];
    taxAmount = json['tax_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tax_name'] = this.taxName;
    data['tax_amount'] = this.taxAmount;
    return data;
  }
}

class Credits {
  String? creditnoteId;
  String? creditnotesInvoiceId;
  String? creditnotesNumber;
  String? invoiceId;
  String? creditedDate;
  var creditedAmount;

  Credits(
      {this.creditnoteId,
      this.creditnotesInvoiceId,
      this.creditnotesNumber,
      this.invoiceId,
      this.creditedDate,
      this.creditedAmount});

  Credits.fromJson(Map<String, dynamic> json) {
    creditnoteId = json['creditnote_id'];
    creditnotesInvoiceId = json['creditnotes_invoice_id'];
    creditnotesNumber = json['creditnotes_number'];
    invoiceId = json['invoice_id'];
    creditedDate = json['credited_date'];
    creditedAmount = json['credited_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creditnote_id'] = this.creditnoteId;
    data['creditnotes_invoice_id'] = this.creditnotesInvoiceId;
    data['creditnotes_number'] = this.creditnotesNumber;
    data['invoice_id'] = this.invoiceId;
    data['credited_date'] = this.creditedDate;
    data['credited_amount'] = this.creditedAmount;
    return data;
  }
}

class BillingAddress {
  String? street;
  String? address;
  String? street2;
  String? city;
  String? state;
  String? zip;
  String? country;
  String? countryCode;
  String? fax;
  String? phone;
  String? attention;

  BillingAddress(
      {this.street,
      this.address,
      this.street2,
      this.city,
      this.state,
      this.zip,
      this.country,
      this.countryCode,
      this.fax,
      this.phone,
      this.attention});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    address = json['address'];
    street2 = json['street2'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    country = json['country'];
    countryCode = json['country_code'];
    fax = json['fax'];
    phone = json['phone'];
    attention = json['attention'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['address'] = this.address;
    data['street2'] = this.street2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    data['fax'] = this.fax;
    data['phone'] = this.phone;
    data['attention'] = this.attention;
    return data;
  }
}

class Subscriptions {
  String? subscriptionId;
  String? subscriptionStatus;

  Subscriptions({this.subscriptionId, this.subscriptionStatus});

  Subscriptions.fromJson(Map<String, dynamic> json) {
    subscriptionId = json['subscription_id'];
    subscriptionStatus = json['subscription_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subscription_id'] = this.subscriptionId;
    data['subscription_status'] = this.subscriptionStatus;
    return data;
  }
}

class Contactpersons {
  String? contactpersonId;
  String? email;
  String? phone;
  String? mobile;
  String? zcrmContactId;

  Contactpersons(
      {this.contactpersonId,
      this.email,
      this.phone,
      this.mobile,
      this.zcrmContactId});

  Contactpersons.fromJson(Map<String, dynamic> json) {
    contactpersonId = json['contactperson_id'];
    email = json['email'];
    phone = json['phone'];
    mobile = json['mobile'];
    zcrmContactId = json['zcrm_contact_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contactperson_id'] = this.contactpersonId;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['mobile'] = this.mobile;
    data['zcrm_contact_id'] = this.zcrmContactId;
    return data;
  }
}

class ContactPersonsAssociated {
  String? contactPersonId;
  String? firstName;
  String? lastName;
  String? contactPersonEmail;
  String? mobile;
  CommunicationPreference? communicationPreference;

  ContactPersonsAssociated(
      {this.contactPersonId,
      this.firstName,
      this.lastName,
      this.contactPersonEmail,
      this.mobile,
      this.communicationPreference});

  ContactPersonsAssociated.fromJson(Map<String, dynamic> json) {
    contactPersonId = json['contact_person_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    contactPersonEmail = json['contact_person_email'];
    mobile = json['mobile'];
    communicationPreference = json['communication_preference'] != null
        ? new CommunicationPreference.fromJson(json['communication_preference'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_person_id'] = this.contactPersonId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['contact_person_email'] = this.contactPersonEmail;
    data['mobile'] = this.mobile;
    if (this.communicationPreference != null) {
      data['communication_preference'] = this.communicationPreference!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_email_enabled'] = this.isEmailEnabled;
    return data;
  }
}

class Contact {
  var customerBalance;
  var creditLimit;
  var unusedCustomerCredits;
  bool? isCreditLimitMigrationCompleted;

  Contact(
      {this.customerBalance,
      this.creditLimit,
      this.unusedCustomerCredits,
      this.isCreditLimitMigrationCompleted});

  Contact.fromJson(Map<String, dynamic> json) {
    customerBalance = json['customer_balance'];
    creditLimit = json['credit_limit'];
    unusedCustomerCredits = json['unused_customer_credits'];
    isCreditLimitMigrationCompleted =
        json['is_credit_limit_migration_completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_balance'] = this.customerBalance;
    data['credit_limit'] = this.creditLimit;
    data['unused_customer_credits'] = this.unusedCustomerCredits;
    data['is_credit_limit_migration_completed'] =
        this.isCreditLimitMigrationCompleted;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_gateway'] = this.paymentGateway;
    data['gateway_name'] = this.gatewayName;
    return data;
  }
}

class QrCode {
  String? qrSource;
  bool? isQrEnabled;
  String? qrValue;
  String? qrDescription;

  QrCode({this.qrSource, this.isQrEnabled, this.qrValue, this.qrDescription});

  QrCode.fromJson(Map<String, dynamic> json) {
    qrSource = json['qr_source'];
    isQrEnabled = json['is_qr_enabled'];
    qrValue = json['qr_value'];
    qrDescription = json['qr_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qr_source'] = this.qrSource;
    data['is_qr_enabled'] = this.isQrEnabled;
    data['qr_value'] = this.qrValue;
    data['qr_description'] = this.qrDescription;
    return data;
  }
}
