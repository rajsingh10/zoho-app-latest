import 'apiConfig.dart';

class apiEndpoints {
  static String baseUrl = apiConfig.baseUrl;
  static String zohoBillingBaseUrl = apiConfig.zohoBillingBaseUrl;
  static String zohoDeskBaseUrl = apiConfig.zohoDeskBaseUrl;
  static String sendOtp = "${baseUrl}sign-in";
  static String verifyOtp = "${baseUrl}verify-otp";
  static String refreshToken = "${baseUrl}get-access-token";
  static String registerApi = "${zohoBillingBaseUrl}customers";
  static String createSubscriptionApi =
      "${zohoBillingBaseUrl}hostedpages/newsubscription";
  static String plansApi = "${zohoBillingBaseUrl}plans";
  static String planDetailsApi = "${zohoBillingBaseUrl}plans?plan_code=";
  static String viewinvoiceapi =
      "${zohoBillingBaseUrl}invoices?customer_id=${userData?.data?[0].customerId ?? ""}&page=1&per_page=10";
  static String singleInvoiceApi = "${zohoBillingBaseUrl}invoices/";
  static String subscriptionsCustomeridApi =
      "${zohoBillingBaseUrl}subscriptions?customer_id=";
  static String subscriptionsApi = "${zohoBillingBaseUrl}subscriptions/";
  static String updateSubscription =
      "${zohoBillingBaseUrl}hostedpages/updatesubscription";
  static String alltikit = "${zohoDeskBaseUrl}tickets";
  static String departments = "${zohoDeskBaseUrl}departments?limit=200&from=0";
  static String ticketsviw = "${zohoDeskBaseUrl}tickets/";
  static String chachak = "${zohoDeskBaseUrl}contacts/search?email=";
  static String tickets = "${zohoDeskBaseUrl}tickets";
  static String fetchCountries =
      "https://countriesnow.space/api/v0.1/countries";
  static String contract = "${zohoDeskBaseUrl}contacts";
  static String updatePaymentMethod =
      "${zohoBillingBaseUrl}hostedpages/updatepaymentmethod";
  static String fetchNotify = "${baseUrl}get-notifications-for-customer";
  static String marketingOptIn = "${baseUrl}update-promotional-notification";
  static String fetchMarketingOptIn = "${baseUrl}get-promotional-notification";
  static String fetchTickets =
      "${zohoDeskBaseUrl}tickets/search?customField1=cf_plan_id:";
  static String therdapi = "${zohoDeskBaseUrl}tickets/";
  static String updateData = "${baseUrl}updateUserEmailMobileno";
}
