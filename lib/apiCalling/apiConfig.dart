import 'package:zohosystem/apiCalling/saveUserToken.dart';
import 'package:zohosystem/ui/authentications/login/modal/authTokenModal.dart';
import 'package:zohosystem/ui/authentications/login/modal/sendOtpModal.dart';
import 'package:zohosystem/ui/authentications/login/modal/userDataModal.dart';
import 'package:zohosystem/ui/authentications/signup/modal/allPlansModal.dart';
import 'package:zohosystem/ui/authentications/signup/modal/allProductsModal.dart';
import 'package:zohosystem/ui/authentications/signup/modal/createContractModal.dart';
import 'package:zohosystem/ui/authentications/signup/modal/createSubscriptionModal.dart';
import 'package:zohosystem/ui/manageMembershipScreen/modal/pauseSubscriptionModal.dart';
import 'package:zohosystem/ui/manageMembershipScreen/modal/resumeSubscriptionModal.dart';
import 'package:zohosystem/ui/moreScreen/modal/updateCustomerModal.dart';

import '../ui/adviceTicketsScreen/Modal/AllDeparmentModal.dart';
import '../ui/adviceTicketsScreen/modal/addTicketModal.dart';
import '../ui/adviceTicketsScreen/modal/ticketRepliesModal.dart';
import '../ui/authentications/login/modal/checkIdModal.dart';
import '../ui/authentications/signup/modal/checkEmailModal.dart';
import '../ui/authentications/signup/modal/countriesModal.dart';
import '../ui/authentications/signup/modal/signInModal.dart';
import '../ui/bills&Payments/modal/allInvoiceModal.dart';
import '../ui/bills&Payments/modal/viewPdfModal.dart';
import '../ui/homeScreen/modal/allTicketModal.dart';
import '../ui/homeScreen/modal/getTimeEntryModal.dart';
import '../ui/homeScreen/modal/planDetailsModal.dart';
import '../ui/homeScreen/modal/subscriptionsDateModal.dart';
import '../ui/manageMembershipScreen/modal/cancalSubcariptionModal.dart';
import '../ui/manageMembershipScreen/modal/updateSubscriptionModal.dart';
import '../ui/moreScreen/modal/getCustomerDataModal.dart';

String organizationId = '20092882029';
String testOrganizationId = '20107247529';
bool isTest = true;

getdata() async {
  authtoken = await SaveAuthtokenData.getDataFromLocal();
}

class apiConfig {
  /// Get Authtoken
  static Future<Map<String, String>> getAuthHeader() async {
    await getdata();
    String? token = authtoken?.accessToken ?? 'N/A';

    return {
      'Authorization': 'Zoho-oauthtoken $token',
      'x-com-zoho-subscriptions-organizationid':
          isTest ? testOrganizationId : organizationId,
    };
  }

  static String baseUrl = 'https://api.theadvicecentre.ltd/api/';
  static String zohoBillingBaseUrl = 'https://www.zohoapis.eu/billing/v1/';
  static String zohoDeskBaseUrl = 'https://desk.zoho.eu/api/v1/';
}

AuthtokenModal? authtoken;
SendOtpModal? sendOtp;
UserDataModal? userData;
checkEmailModal? checkEmail;
signInModal? register;
AllProductsModal? allProducts;
AllPlansModal? allPlans;
CreateSubscriptionModal? createSubscription;
allInvoiceModal? allinvoice;
PdfViewModal? pdfview;
CountriesModal? countries;
CreateContractModal? createContract;
UpdateSubscriptionModal? updateSubscription;
SubscriptionsDateModal? subscriptionsDate;
CancelSubscriptionModal? cancelSubscription;
PauseMembershipModal? pauseMembership;
ResumeMembershipModal? resumeMembership;
MyTickitModal? allTicket;
AllDeparmentModal? allDepartment;
AddTicketModal? addTicket;
CheckIdModal? checkidmodal;
PlanDetailsModal? planDetails;
GetTimeEntryModal? getTimeEntry;
GetCustomerDataModal? getCustomer;
UpdateCustomerModal? updateCustomer;
TicketRepliesModal? ticketReplies;