import 'package:finnoto_app/employeePortal/presentation/core/helper/msc/all_imports.dart';

class Apiconstants {
  //static String kProdMetaBaseURL = dotenv.env['metaProdURL'] ?? '';
  static String kProdMetaBaseURL = '';
  //static String kProdMetaAuthURL = dotenv.env['metaProdAuthURL'] ?? '';
  static String kProdMetaAuthURL = '';
  static String kEndpointForLoginMobileOTP = dotenv.env['kEndpointForLoginMobileOTP'] ?? '';
  static String kEndpointForValidateMobileOTP = dotenv.env['kEndpointForValidateMobileOTP'] ?? '';
  static String kEndpointForResetPassword = dotenv.env['kEndpointForResetPassword'] ?? '';

  static String kbDebug = dotenv.env['bDebug'] ?? '';

  static String kEndpointForBusiness = dotenv.env['kEndpointForBusiness'] ?? '';
  static String kEndpointForBusinessToken(String id) {
    return dotenv.env['kEndpointForBusinessToken']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForValidateToken = dotenv.env['kEndpointForValidateToken'] ?? '';
  static String kEndpointForAuth = dotenv.env['kEndpointForAuth'] ?? '';
  static String kEndpointForDashboardSummary = dotenv.env['kEndpointForDashboardSummary'] ?? '';
  static String kEndpointForMyPendingApprovals = dotenv.env['kEndpointForMyPendingApprovals'] ?? '';
  static String kEndpointForMyTodayApproval = dotenv.env['kEndpointForMyTodayApproval'] ?? '';
  static String kEndpointForMyTodayHold = dotenv.env['kEndpointForMyTodayHold'] ?? '';
  static String kEndpointForMyTodayReject = dotenv.env['kEndpointForMyTodayReject'] ?? '';
  static String kEndpointForReimbursementList = dotenv.env['kEndpointForReimbursementList'] ?? '';
  static String kEndpointForExpenseList = dotenv.env['kEndpointForExpenseList'] ?? '';
  static String kEndpointForAdvanceList = dotenv.env['kEndpointForAdvanceList'] ?? '';

  static String kEndpointForEmployeeAdvanceList = dotenv.env['kEndpointForEmployeeAdvanceList'] ?? '';

  static String kEndpointForMyPaymentList = dotenv.env['kEndpointForMyPaymentList'] ?? '';
  static String kEndpointForEmployeeSelf = dotenv.env['kEndpointForEmployeeSelf'] ?? '';
  static String kEndpointForUser = dotenv.env['kEndpointForUser'] ?? '';
  static String kEndpointForBank = dotenv.env['kEndpointForBank'] ?? '';
  static String kEndpointForSearchDelegated = dotenv.env['kEndpointForSearchDelegated'] ?? '';
  static String kEndpointForRoles = dotenv.env['kEndpointForRoles'] ?? '';
  static String kEndpointForDocumentAnalyse = dotenv.env['kEndpointForDocumentAnalyse'] ?? '';

  static String kEndpointForTDSCategory = dotenv.env['kEndpointForTDSCategory'] ?? '';
  //kEndpointForTDSCategory
  static String kEndpointForGetDocumentAnalyse(String id) {
    return dotenv.env['kEndpointForGetDocumentAnalyse']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForPaymentNote(String id) {
    return dotenv.env['kEndpointForPaymentNote']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForPaymentDocument(String id) {
    return dotenv.env['kEndpointForPaymentDocument']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForBusinessPaymentDetails(String id) {
    return dotenv.env['kEndpointForBusinessPaymentDetails']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForExpenseApprovalWithDepartment(String id) {
    return dotenv.env['kEndpointForExpenseApprovalWithDepartment']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForExpenseOnHold(String id) {
    return dotenv.env['kEndpointForExpenseOnHold']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForExpenseOnHoldComments(String expenseId, String holdId) {
    return dotenv.env['kEndpointForExpenseOnHoldComments']?.replaceFirst('{id}', expenseId).replaceFirst('{id}', holdId) ?? '';
  }

  static String kEndpointForAdvanceOnHold(String id) {
    return dotenv.env['kEndpointForAdvanceOnHold']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForAdvanceOnHoldComments(String expenseId, String holdId) {
    return dotenv.env['kEndpointForAdvanceOnHoldComments']?.replaceFirst('{id}', expenseId).replaceFirst('{id}', holdId) ?? '';
  }

  //**Advance */
  static String kEndpointForDepartmentFindParent = dotenv.env['kEndpointForDepartmentFindParent'] ?? '';
  static String kEndpointForCategoryFind = dotenv.env['kEndpointForCategoryFind'] ?? '';
  static String kEndpointForRaiseAdvance = dotenv.env['kEndpointForRaiseAdvance'] ?? '';
  static String kEndpointForAdvanceDetails(String id) {
    return dotenv.env['kEndpointForAdvanceDetails']?.replaceAll('{id}', id) ?? '';
    // "/employee-advance/$id";
  }

  static String kEndpointForAdvanceApproval(String id) {
    return dotenv.env['kEndpointForAdvanceApproval']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForAdvanceDocuments(String id) {
    return dotenv.env['kEndpointForAdvanceDocuments']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForAdvanceComment(String id) {
    return dotenv.env['kEndpointForAdvanceComment']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForAdvanceReject(String id) {
    return dotenv.env['kEndpointForAdvanceReject']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForAdvanceApprove(String id) {
    return dotenv.env['kEndpointForAdvanceApprove']?.replaceAll('{id}', id) ?? '';
  }

  //**Expense */
  static String kEndpointForBusinessAccountFind = dotenv.env['kEndpointForBusinessAccountFind'] ?? '';
  static String kEndpointForExpensePOC = dotenv.env['kEndpointForExpensePOC'] ?? '';
  static String kEndpointForExpensePayToEmployee = dotenv.env['kEndpointForExpensePayToEmployee'] ?? '';

  static String kEndpointForSearchClient(String id) {
    return dotenv.env['kEndpointForSearchClient']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForExpenseDepartmentFindParent = dotenv.env['kEndpointForExpenseDepartmentFindParent'] ?? '';
  static String kEndpointForExpenseExpenseHeadFindParent = dotenv.env['kEndpointForExpenseExpenseHeadFindParent'] ?? '';
  static String kEndpointForRaiseExpense = dotenv.env['kEndpointForRaiseExpense'] ?? '';
  static String kSentryDSN = dotenv.env['kSentydsn'] ?? '';
  static String kEndpointForExpenseApproval(String id) {
    return dotenv.env['kEndpointForExpenseApproval']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForExpenseDetails(String id) {
    return dotenv.env['kEndpointForExpenseDetails']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForExpenseReject(String id) {
    return dotenv.env['kEndpointForExpenseReject']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForExpenseApprove(String id) {
    return dotenv.env['kEndpointForExpenseApprove']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForExpenseDocuments(String id) {
    return dotenv.env['kEndpointForExpenseDocuments']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForExpenseComments(String id) {
    return dotenv.env['kEndpointForExpenseComments']?.replaceAll('{id}', id) ?? '';
  }

  //**Reimbursement */
  static String kEndpointForReimbursementEmployee = dotenv.env['kEndpointForReimbursementEmployee'] ?? '';
  static String kEndpointForReimbursementBusiness = dotenv.env['kEndpointForReimbursementBusiness'] ?? '';

//** */Custom Field

  static String kEndpointForExpenseCustomField = dotenv.env['kEndpointForExpenseCustomField'] ?? '';

  //**Logout */

  static String kEndpointForMetaLogout = dotenv.env['kEndpointForMetaLogout'] ?? '';
  static String kEndpointForEapiLogout = dotenv.env['kEndpointForEapiLogout'] ?? '';

  //arc
  static String kEndpointForArcCustomer = dotenv.env['kEndpointForArcCustomer'] ?? '';
  static String kEndpointForArcInvoice = dotenv.env['kEndpointForArcInvoice'] ?? '';
  static String kEndpointForArcEmail = dotenv.env['kEndpointForArcEmail'] ?? '';
  static String kEndpointForArcActionCenter = dotenv.env['kEndpointForArcActionCenter'] ?? '';
  static String kEndpointForArcCustomerLedger = dotenv.env['kEndpointForArcCustomerLedger'] ?? '';
  static String kEndpointForArcCustomerDCNoteList = dotenv.env['kEndpointForArcCustomerDCNoteList'] ?? '';
  static String kEndpointForArcCustomerDisputeorTicketList = dotenv.env['kEndpointForArcCustomerDisputeorTicketList'] ?? '';
  static String kEndpointForArcCustomerP2pList = dotenv.env['kEndpointForArcCustomerP2pList'] ?? '';
  static String kEndpointForArcCustomerCallReminderList = dotenv.env['kEndpointForArcCustomerCallReminderList'] ?? '';

  static String kEndpointForArcPayment = dotenv.env['kEndpointForArcPayment'] ?? '';
  static String kEndpointForArcAgeingBucketReportDetail = dotenv.env['kEndpointForArcAgeingBucketReportDetail'] ?? '';

  //

  static String kEndpointForArcCustomerSummary(String id) {
    return dotenv.env['kEndpointForArcCustomerSummary']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForArcTicketDetail(String id) {
    return dotenv.env['kEndpointForArcTicketDetail']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForArcReminderDetail(String id) {
    return dotenv.env['kEndpointForArcReminderDetail']?.replaceAll('{id}', id) ?? '';
  }

  static String kEndpointForArcEmailDetail(String id) {
    return dotenv.env['kEndpointForArcEmailDetail']?.replaceAll('{id}', id) ?? '';
  }

  //
  //
}
