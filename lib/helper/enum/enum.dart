// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:finnoto_app/arcPortal/presentation/core/color/arc_color.dart';
import 'package:finnoto_app/employeePortal/presentation/core/helper/msc/all_imports.dart';

class ApprovalTypeEnum {
  static const int VERIFICATION = 1054;
  static const int FINOPS = 1055;
  static const int PAYMENT = 1056;
  static const int ADVANCE = 1057;
}

class CustomFieldColumnType {
  static const int textArea = 1039;
  static const int date = 1040;
  static const int dateTime = 1041;
  static const int boolean = 1042;
  static const int number = 1043;
  static const int choiceList = 1044;
}

// enum CustomFieldColumnType {
//   TEXT_AREA(1039),
//   DATE(1040),
//   DATE_TIME(1041),
//   BOOLEAN(1042),
//   NUMBER(1043),
//   CHOICE_LIST(1044),
// }

class VerificationStatusTypeEnum {
  static const int SUBMITTED = 1015;
  static const int PENDING_APPROVAL = 1016;
  static const int APPROVED = 1017;
  static const int REJECTED = 1018;
  static const int ON_HOLD = 1019;
  static const int OPEN = 1020;
}

class ApprovalStepTypeEnum {
  static const int INDIVIDUAL = 1075;
  static const int USER_GROUP = 1076;
  static const int DEPARTMENT_HEAD = 1078;
  static const int MANAGERIAL = 1077;
  static const int REPORTING_MANAGER = 2046;
  static const int DEPARTMENT_MANAGER = 2047;
  static const int EXPENSE_HEAD_MANAGER = 2048;
  static const int EXPENSE_HEAD_HEAD = 2049;
  static const int CATEGORY_MANAGER = 2050;
  static const int CATEGORY_HEAD = 2051;
  static const int APPROVAL_MANAGER = 2052;
}

class ApprovalActivityTypeEnum {
  static const int APPROVE = 1072;
  static const int REJECT = 1073;
  static const int WORKFLOW = 1074;
}

class PaymentModeTypeEnum {
  static const int CASH = 1085;
  static const int CHEQUE = 1086;
  static const int DD = 1087;
  static const int LEDGER = 1088;
  static const int OFFLINE_BANK = 1089;
  static const int BANK = 1090;
  static const int OFFLINE_BANK_PAYOUT = 2063;
  static const int ADVANCE_ADJUSTMENT = 2071;
  static const int CC_ADJUSTMENT = 2088;
  static const int SHORT_AND_EXCESS = 2084;

  static const Map<int, String> _typeToText = {
    CASH: "Cash",
    CHEQUE: "Cheque",
    DD: "Demand Draft",
    LEDGER: "Ledger",
    OFFLINE_BANK: "Offline Bank",
    BANK: "Bank",
    OFFLINE_BANK_PAYOUT: "CMS Bank Payout",
    ADVANCE_ADJUSTMENT: "Advance Adjustment",
    CC_ADJUSTMENT: "Credit Card Adjustment",
    SHORT_AND_EXCESS: "Short and Excess",
  };

  static String getText(int typeId) {
    return _typeToText[typeId] ?? "Unknown";
  }
}

class ArcInvoiceStatusEnum {
  static const int FULLY_PAID = 1009;
  static const int DISPUTED = 1008;
  static const int PARTIALLY_PAID = 1011;
  static const int OVERDUE = 1007;
  static const int OPEN = 1006;

  static const Map<int, String> _typeToText = {
    FULLY_PAID: "Fully Paid",
    DISPUTED: "Disputed",
    PARTIALLY_PAID: "Partially Paid",
    OVERDUE: "Overdue",
    OPEN: "Open",
  };

  static const Map<int, Color> _typeToColor = {
    FULLY_PAID: ARCColorsConstant.ff006443,
    DISPUTED: ARCColorsConstant.ffB3261E,
    PARTIALLY_PAID: Colors.orange,
    OVERDUE: ARCColorsConstant.ffB3261E,
    OPEN: Colors.blue,
  };

  static String getText(int statusID) {
    return _typeToText[statusID] ?? "--";
  }

  static Color getColor(int statusID) {
    return _typeToColor[statusID] ?? Colors.grey;
  }

  static Map<String, dynamic> getTextAndColor(int statusID) {
    return {
      'text': getText(statusID),
      'color': getColor(statusID),
    };
  }
}

class ArcTicketStatusEnum {
  static const int HOLD = 1047;
  static const int CLOSE = 1046;
  static const int OPEN = 1045;

  static const Map<int, String> _typeToText = {
    HOLD: "Hold",
    CLOSE: "Close",
    OPEN: "Open",
  };

  static const Map<int, Color> _typeToColor = {
    OPEN: ARCColorsConstant.ff29AE6E,
    CLOSE: ARCColorsConstant.ffB3261E,
    HOLD: Colors.orange,
  };

  static String getText(int statusID) {
    return _typeToText[statusID] ?? "--";
  }

  static Color getColor(int statusID) {
    return _typeToColor[statusID] ?? Colors.grey;
  }

  static Map<String, dynamic> getTextAndColor(int statusID) {
    return {
      'text': getText(statusID),
      'color': getColor(statusID),
    };
  }
}

class SourceHashTypeEnum {
  static const String vendor = '07e0457f473af2e6c6ca5ec1c978b066';
  static const String business = 'd6d2e31a0f603594295feb7db9d3d8d9';
  static const String employee = '87dc4f00a76c9e9890277907e51305f0';
  static const String expense = '9ff68c2947fabaef5b67608904595189';
  static const String billing = 'cddd4d780c3ba0b0c070c06125dc8cd7';
  static const String billingDocument = '74df8c0c797bb8698a65738e936d46e0';
  static const String billingBank = 'd72c21db4cce0217e5672d23779956ee';
  static const String vendorBusiness = 'ec2fbbb843de9e28355c8b1ba15d39c4';
  static const String vendorAccount = 'ace89f30dd7932e8cb28f09298357f5e';
  static const String bankAccount = '251535b8cc6f309d6ca8ef895f84ded4';
  static const String businessAccount = 'e8c231ff5a4e23349e79eb09ba447c25';
  static const String businessVendor = '6a104ccdaa89cef882365b58eaf2a9d7';
  static const String designation = 'c74571fff23abb75ff2d80a5bae48f72';
  static const String department = 'd2656c612d54c18ef2bf0ad00f865674';
  static const String userGroup = 'a699176389a8f376116bc1adc00df79c';
  static const String expenseHead = 'f271ed7164180eaab644025ce79e2482';
  static const String businessPayment = '5594c70e0455eaedb9c9da1c1416f575';
  static const String invitationDocument = '88e026633ba242f81d97d9606d6f910b';
  static const String employeeAdvance = '477a39f36a2dd3012895c0d8655fda76';
  static const String recurringDocument = 'aa3bc84712cf988d7f494fa02858115b';
  static const String groupMember = '20f23c4fb23ea7e31f1db48bb44fe1e6';
  static const String advanceCategory = '3d522de35eef34011522a54bf3beea48';
  static const String expensePayee = '8c4de74079d74c5b259eb86bc29d0335';
  static const String employeeGrade = '51bb4dbef5b6599f1f46386f96968557';
  static const String choiceType = '615ea717c42c26609e3a4441ef01cdc2';
  static const String choiceList = '7874e58032a1eaf165d2151c1db160b5';
  static const String notificationPreference = '05ad547368fca06d774aa781dfe45082';
  static const String documentPreference = '3430ee0c99f59a56223798faff35e8d8';
  static const String emailMessage = '87d330e6c629608a9baeecf85d7195c2';
  static const String gstr2bItem = '6e082320b13eaee964309b53eb80160b';
  static const String onhold = '91c5f94523d9707947aa2cd6ef87c41c';
  static const String groupRole = '61b04bab176dcfc1b081ab2233b9c7ca';
  static const String businessClient = '7316a710ff81aac1bad5a6bdf83dc61c';
  static const String offlineBankRecon = '53ee8b42a15192b2c899dd540c8011e6';
  static const String bulkUpload = '7e79960612c97508494a5bfd6db846e2';
  static const String bankStatement = '0751e2e0e9c7f7053852cd42b7531f72';
  static const String item = '10d7d43b8d2e8b71f2b07674bb694a39';
  static const String creditCardStatementItem = 'd6e1f4cf4fad3343f7f562722ad3815a';
  static const String tdsCategory = '49481e5950ab4d73832476f396f43a7b';
  static const String tdsFiling = 'a5b57b2dfd7d7476e5255605e84a9516';
  static const String tdsFilingItem = 'f5f76d08d0c3be65f1fc9440d55124f8';
  static const String purchaseRequest = '02b8c76a72d627a41651d0f85c08779c';
  static const String purchaseQuote = 'b9cd469e2e702f7dd025a30507cdf0de';
  static const String purchaseOrder = '78a33943f1946946336bce4920d9b1ef';
  static const String grn = '3c0412336113a0cc7d285399277b3585';
  static const String watchList = '9c47e38e41415ac04d219f522982a5ed';
  static const String workflowUser = 'ffd28309c8dcc49f85017f8d3747e200';
  static const String expensePoc = 'cdace2a1e4862365f3996ef8506b1817';
  static const String vendorInvitation = 'b9d6d4ca3ba8312938fdbb87c078a5ee';
  static const String paymentMode = '0573148a5bbf0de9ea1d93b5253f7fb1';
  static const String user = 'ee4cdbfefe411a0f75b7c5daddf210ba';
  static const String tdsFilingSummary = '8aa7eca4d732903a6f1a317884a968ae';
  static const String scheduledReport = '16f90e4b4cb3e99e12ba604c4feafaa9';

  static const Map<String, String> _typeToText = {
    expense: "Generated From Expense",
    employeeAdvance: "Generated From Advance",
  };

  static String getText(String typeId) {
    return _typeToText[typeId] ?? "--";
  }
}

enum PolicyRuleType { SHOW, HIDE, ENABLE, DISABLE }

enum PolicyRuleCondition { IS_DISABLED, IS_HIDDEN, HAS_VALUE, HAS_SOME_VALUE, NOT_HAS_VALUE, NOT_SOME_HAS_VALUE }

enum WorkflowTypeEnum {
  VENDOR_EXPENSE,
  REIMBURSEMENT,
  ADVANCE,
  PURCHASE_REQUEST,
  PURCHASE_ORDER,
}

enum FinopsStatusTypeEnum {
  SUBMITTED,
  PENDING_APPROVAL,
  APPROVED,
  REJECTED,
  ON_HOLD,
}

enum PaymentStatusTypeEnum {
  APPROVED,
  REJECTED,
}

enum VerificationLimitTypeEnum {
  USER,
  HEAD_USER,
  DESIGNATION,
  DEPARTMENT_DESIGNATION,
  HEAD_DESIGNATION,
  HEAD_DEPARTMENT_DESIGNATION,
  DEPARTMENT_HEAD,
  DEPARTMENT,
  DEPARTMENT_USER_HEAD,
}

enum LookupTypeEnum {
  PARTY_STATUS,
  BUSINESS_TYPE,
}

enum FinopsLimitTypeEnum {
  GROUP,
  HEAD_GROUP,
  DEPARTMENT_GROUP,
  HEAD_DEPARTMENT_GROUP,
}

enum PaymentLimitTypeEnum {
  GROUP,
  HEAD_GROUP,
  DEPARTMENT_GROUP,
  HEAD_DEPARTMENT_GROUP,
}

enum ApprovalStatusTypeEnum {
  PENDING,
  ONHOLD,
  APPROVED,
  REJECTED,
}

const ApprovalStatusType = {
  'PENDING': 1033,
  'ONHOLD': 1034,
  'APPROVED': 1035,
  'REJECTED': 1036,
};

// const ExpenseStatusTypeEnum {
//     VERIFICATION_PENDING = 3060,
//     FINOPS_PENDING = 3061,
//     PAYABLE_PENDING = 3062,
//     PAYABLE_APPROVED = 3063,
//     DRAFT = 3064,
//     COMPLETED = 3065,
// }

// enum ApprovalTypeEnum {
//   VERIFICATION,
//   FINOPS,
//   PAYMENT,
//   ADVANCE,
// }

enum RecurringPeriodEnum {
  DAILY,
  WEEKLY,
  MONTHLY,
  QUARTERLY,
  YEARLY,
}

// enum PaymentModeTypeEnum {
//   CASH,
//   CHEQUE,
//   DD,
//   LEDGER,
//   OFFLINE_BANK,
//   BANK,
//   OFFLINE_BANK_PAYOUT,
//   ADVANCE_ADJUSTMENT,
//   CC_ADJUSTMENT,
//   SHORT_AND_EXCESS,
// }

const APPROVAL_STEP_LOOKUP_ID = 116;

const VendorInvitationTypeEnum = {
  'CONNECTION_REQUEST': 2082,
  'KYC_REQUEST': 2083,
};

enum FinopsCustomFieldType {
  DEPARTMENT,
  DESIGNATION,
  EMPLOYEE,
  EXPENSE,
  EXPENSE_HEAD,
  BUSINESS,
  VENDOR_INVITATION,
  VENDOR,
  EMPLOYEE_ADVANCE,
  ADVANCE_CATEGORY,
  PURCHASE_REQUEST,
  PURCHASE_ORDER,
}

enum RecurringStatusTypeEnum {
  ACTIVE,
  STOPPED,
  EXPIRED,
}

enum BankTransferModeEnum {
  IMPS,
  NEFT,
  RTGS,
  UPI,
}

const VENDOR_DOCUMENTS_ID = 103;
const BUSINESS_TYPE_ID = 101;

const BusinessType = {
  'PROPRIETORSHIP': {'value': 1001, 'label': 'Proprietorship'},
  'PARTNERSHIP_FIRM': {'value': 1002, 'label': 'Partnership Firm'},
  'LLP': {'value': 1003, 'label': 'LLP'},
  'PRIVATE_LIMITED': {'value': 1004, 'label': 'Private Limited'},
  'INDIVIDUAL_PREFERENCE': {'value': 1005, 'label': 'Individual'},
  'INTERNATIONAL': {'value': 2068, 'label': 'International'},
};

const GST_TYPES = {
  'CGST': 'cgst',
  'SGST': 'sgst',
  'IGST': 'igst',
};

const TAX_PERCENTAGE_SLABS = [5, 8, 12, 18, 28];

enum ExpenseCategoryTypeEnum {
  VENDOR,
  EMPLOYEE_REIMBURSEMENTS,
}

enum WorkflowLimitTypeEnum {
  EXPENSE,
  ADVANCE,
}

enum ColumnDefinitionColumnType {
  STRING,
  NUMBER,
  DATE,
  DATE_TIME,
  BOOLEAN,
  REFERENCE,
  TEXT,
  CURRENCY,
  ACTIVATE_BADGE,
  ACTIVATE,
  DUALISTIC,
  DATE_LATERAL,
}

enum BulkUploadTypeEnum {
  HR,
  AxisReconciliation,
  VENDOR,
  EXPENSE,
  EXPENSE_HEAD,
}

const FinopsQuickStartPreference = {
  'Business': 'business_account',
  'VendorInvitation': 'vendor_invitation',
  'Department': 'department',
  'Designation': 'designation',
  'EmployeeGrade': 'employee_grade',
  'Employee': 'employee',
  'ExpenseHead': 'expense_head',
};
const EmployeeQuickStartPreference = {
  'bank_account': 'self_bank_account',
};
const VendorQuickStartPreference = {
  'vendor_bussines_account': 'business',
  'bussines_client': 'client',
};

const docIdentifierRegexps = [
  '(?:EXPVN)\\d+',
  '(?:EXPRB)\\d+',
  '(?:ADV)\\d+',
];
const emailHighlightWords = [
  'approved',
  'rejected',
  ...docIdentifierRegexps,
];

enum PaymentStatusEnum {
  PAYMENT_CONFIRMED,
  PENDING_SUBMISSION,
  PENDING_CONFIRMATION,
  PAYMENT_FAILED,
}

const currentDate = 'currentDate';

enum PlatformTypeEnum {
  ANDROID_APP,
  IOS_APP,
  PWA,
  DESKTOP,
  EXTENSION,
}

enum ArPaymentModesTypeEnum {
  CC,
  DC,
  NB,
  WALLET,
  UPI,
  CASH,
  PREPAID_CARD,
}

enum ArDisputeStatusTypeEnum {
  DRAFT,
  IN_PROGRESS,
  AWAITING_RESPONSE,
  PENDING_RESOLUTION,
  DONE,
}

const CURRENT_USER = 'current_user';
const CURRENT_EMPLOYEE = 'current_employee';

enum VendorBusinessKycStatusEnum {
  PENDING,
  SUBMITTED,
  COMPLETED,
}

enum ExpenseTypeEnum {
  VENDOR_EXPENSE,
  REIMBURSEMENT,
  ADVANCE,
}

enum OverallExpenseStatusTypeEnum {
  VERIFICATION_PENDING,
  FINOPS_PENDING,
  PAYABLE_PENDING,
  PAYABLE_APPROVED,
  DRAFT,
  COMPLETED,
}

enum PurchaseRequestStatusEnum {
  Raised,
  PendingApproval,
  Rejected,
  PendingQuote,
  PoPending,
  PendingDelivery,
  Completed,
}

enum PurchaseQuoteStatusEnum {
  Requested,
  Submitted,
  Approved,
  Rejected,
}

enum PurchaseOrderStatusEnum {
  Raised,
  PendingApproval,
  Rejected,
  PendingDelivery,
  Completed,
}

enum ItemAssignmentStatusEnum {
  Requested,
  Rejected,
  PartiallyFulfilled,
  Fulfilled,
}

const OrderPaymentTypeEnum = {
  'PREPAID': 1,
  'POSTPAID': 2,
};
const RESTRICTED_FILTERS = 'restricted_filters';

enum DepositionTypeEnum {
  OrderLessPayment,
  OrderExcessPayment,
  PGDiscountAdjustment,
  NoPaymentAttached,
  ShipmentNotConfirmed,
  ShipmentNotCreated,
  PaymentOrderMismatch,
  PaymentSettlementMismatch,
  PaymentNotConfirmed,
  RefundOrderMismatch,
  RefundSettlementMismatch,
}

enum BusinessVendorConnectionMethodEnum {
  MANUAL,
  INVITATION,
  DIRECT,
}

enum BooleanEnum {
  TRUE,
  FALSE,
}
