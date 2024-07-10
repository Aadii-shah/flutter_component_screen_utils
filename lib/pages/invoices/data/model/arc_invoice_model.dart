// To parse this JSON data, do
//
//     final arcInvoiceModel = arcInvoiceModelFromJson(jsonString);

import 'dart:convert';

ArcInvoiceModel arcInvoiceModelFromJson(String str) => ArcInvoiceModel.fromJson(json.decode(str));

String arcInvoiceModelToJson(ArcInvoiceModel data) => json.encode(data.toJson());

class ArcInvoiceModel {
  List<Record>? records;

  ArcInvoiceModel({
    this.records,
  });

  ArcInvoiceModel copyWith({
    List<Record>? records,
  }) =>
      ArcInvoiceModel(
        records: records ?? this.records,
      );

  factory ArcInvoiceModel.fromJson(Map<String, dynamic> json) => ArcInvoiceModel(
        records: json["records"] == null ? [] : List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "records": records == null ? [] : List<dynamic>.from(records!.map((x) => x.toJson())),
      };
}

class Record {
  dynamic id;
  String? uuid;
  dynamic businessId;
  dynamic customerId;
  dynamic statusId;
  String? identifier;
  dynamic amount;
  dynamic balance;
  DateTime? invoiceDate;
  DateTime? dueDate;
  CustomFieldData? customFieldData;
  Attributes? attributes;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic workflowId;
  dynamic businessAccountId;
  dynamic customerAccountId;
  bool? isBadDebt;
  dynamic disputedAmount;
  dynamic paidAmount;
  dynamic typeId;
  dynamic creditNote;
  dynamic badDebt;
  dynamic activeP2PId;
  dynamic activeDisputeId;
  dynamic startDate;
  dynamic endDate;
  String? customer;
  Status? status;
  AccountManager? accountManager;
  String? workflowIdentifier;
  Type? type;
  dynamic dsoDate;

  Record({
    this.id,
    this.uuid,
    this.businessId,
    this.customerId,
    this.statusId,
    this.identifier,
    this.amount,
    this.balance,
    this.invoiceDate,
    this.dueDate,
    this.customFieldData,
    this.attributes,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdBy,
    this.updatedBy,
    this.workflowId,
    this.businessAccountId,
    this.customerAccountId,
    this.isBadDebt,
    this.disputedAmount,
    this.paidAmount,
    this.typeId,
    this.creditNote,
    this.badDebt,
    this.activeP2PId,
    this.activeDisputeId,
    this.startDate,
    this.endDate,
    this.customer,
    this.status,
    this.accountManager,
    this.workflowIdentifier,
    this.type,
    this.dsoDate,
  });

  Record copyWith({
    dynamic id,
    String? uuid,
    dynamic businessId,
    dynamic customerId,
    dynamic statusId,
    String? identifier,
    dynamic amount,
    dynamic balance,
    DateTime? invoiceDate,
    DateTime? dueDate,
    CustomFieldData? customFieldData,
    Attributes? attributes,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    dynamic createdBy,
    dynamic updatedBy,
    dynamic workflowId,
    dynamic businessAccountId,
    dynamic customerAccountId,
    bool? isBadDebt,
    dynamic disputedAmount,
    dynamic paidAmount,
    dynamic typeId,
    dynamic creditNote,
    dynamic badDebt,
    dynamic activeP2PId,
    dynamic activeDisputeId,
    dynamic startDate,
    dynamic endDate,
    String? customer,
    Status? status,
    AccountManager? accountManager,
    String? workflowIdentifier,
    Type? type,
    dynamic dsoDate,
  }) =>
      Record(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        businessId: businessId ?? this.businessId,
        customerId: customerId ?? this.customerId,
        statusId: statusId ?? this.statusId,
        identifier: identifier ?? this.identifier,
        amount: amount ?? this.amount,
        balance: balance ?? this.balance,
        invoiceDate: invoiceDate ?? this.invoiceDate,
        dueDate: dueDate ?? this.dueDate,
        customFieldData: customFieldData ?? this.customFieldData,
        attributes: attributes ?? this.attributes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        createdBy: createdBy ?? this.createdBy,
        updatedBy: updatedBy ?? this.updatedBy,
        workflowId: workflowId ?? this.workflowId,
        businessAccountId: businessAccountId ?? this.businessAccountId,
        customerAccountId: customerAccountId ?? this.customerAccountId,
        isBadDebt: isBadDebt ?? this.isBadDebt,
        disputedAmount: disputedAmount ?? this.disputedAmount,
        paidAmount: paidAmount ?? this.paidAmount,
        typeId: typeId ?? this.typeId,
        creditNote: creditNote ?? this.creditNote,
        badDebt: badDebt ?? this.badDebt,
        activeP2PId: activeP2PId ?? this.activeP2PId,
        activeDisputeId: activeDisputeId ?? this.activeDisputeId,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        customer: customer ?? this.customer,
        status: status ?? this.status,
        accountManager: accountManager ?? this.accountManager,
        workflowIdentifier: workflowIdentifier ?? this.workflowIdentifier,
        type: type ?? this.type,
        dsoDate: dsoDate ?? this.dsoDate,
      );

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        id: json["id"],
        uuid: json["uuid"],
        businessId: json["business_id"],
        customerId: json["customer_id"],
        statusId: json["status_id"],
        identifier: json["identifier"],
        amount: json["amount"],
        balance: json["balance"]?.toDouble(),
        invoiceDate: json["invoice_date"] == null ? null : DateTime.parse(json["invoice_date"]),
        dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        customFieldData: json["custom_field_data"] == null ? null : CustomFieldData.fromJson(json["custom_field_data"]),
        attributes: json["attributes"] == null ? null : Attributes.fromJson(json["attributes"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        workflowId: json["workflow_id"],
        businessAccountId: json["business_account_id"],
        customerAccountId: json["customer_account_id"],
        isBadDebt: json["is_bad_debt"],
        disputedAmount: json["disputed_amount"],
        paidAmount: json["paid_amount"]?.toDouble(),
        typeId: json["type_id"],
        creditNote: json["credit_note"],
        badDebt: json["bad_debt"],
        activeP2PId: json["active_p2p_id"],
        activeDisputeId: json["active_dispute_id"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        customer: json["customer"],
        status: statusValues.map[json["status"]],
        accountManager: accountManagerValues.map[json["account_manager"]],
        workflowIdentifier: json["workflow_identifier"],
        type: typeValues.map[json["type"]],
        dsoDate: json["dso_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "business_id": businessId,
        "customer_id": customerId,
        "status_id": statusId,
        "identifier": identifier,
        "amount": amount,
        "balance": balance,
        "invoice_date": invoiceDate?.toIso8601String(),
        "due_date": dueDate?.toIso8601String(),
        "custom_field_data": customFieldData?.toJson(),
        "attributes": attributes?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "workflow_id": workflowId,
        "business_account_id": businessAccountId,
        "customer_account_id": customerAccountId,
        "is_bad_debt": isBadDebt,
        "disputed_amount": disputedAmount,
        "paid_amount": paidAmount,
        "type_id": typeId,
        "credit_note": creditNote,
        "bad_debt": badDebt,
        "active_p2p_id": activeP2PId,
        "active_dispute_id": activeDisputeId,
        "start_date": startDate,
        "end_date": endDate,
        "customer": customer,
        "status": statusValues.reverse[status],
        "account_manager": accountManagerValues.reverse[accountManager],
        "workflow_identifier": workflowIdentifier,
        "type": typeValues.reverse[type],
        "dso_date": dsoDate,
      };
}

enum AccountManager { HEMANT, KRATI_CHATURVEDI, MATTHEW_NORMAN, RUMESH_UDASH }

final accountManagerValues = EnumValues({
  "Hemant": AccountManager.HEMANT,
  "Krati Chaturvedi": AccountManager.KRATI_CHATURVEDI,
  "Matthew norman": AccountManager.MATTHEW_NORMAN,
  "Rumesh Udash": AccountManager.RUMESH_UDASH
});

class Attributes {
  dynamic creditNote;
  dynamic documentsCount;
  dynamic commentsCount;

  Attributes({
    this.creditNote,
    this.documentsCount,
    this.commentsCount,
  });

  Attributes copyWith({
    dynamic creditNote,
    dynamic documentsCount,
    dynamic commentsCount,
  }) =>
      Attributes(
        creditNote: creditNote ?? this.creditNote,
        documentsCount: documentsCount ?? this.documentsCount,
        commentsCount: commentsCount ?? this.commentsCount,
      );

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        creditNote: json["credit_note"],
        documentsCount: json["documents_count"],
        commentsCount: json["comments_count"],
      );

  Map<String, dynamic> toJson() => {
        "credit_note": creditNote,
        "documents_count": documentsCount,
        "comments_count": commentsCount,
      };
}

class CustomFieldData {
  dynamic asdadfasd;
  DateTime? testdate;
  String? testtext;
  String? testtextarea;
  bool? thisisnam;
  DateTime? thisischeckmandatory;
  String? invoiceis;
  bool? test;
  bool? tst;
  dynamic thisisfixcustomfeild;
  DateTime? fort;
  bool? asfdsjjasdjdssd;
  bool? gadfads;
  bool? jjasdjdssd;
  bool? thisischeckneww;
  bool? ssa;

  CustomFieldData({
    this.asdadfasd,
    this.testdate,
    this.testtext,
    this.testtextarea,
    this.thisisnam,
    this.thisischeckmandatory,
    this.invoiceis,
    this.test,
    this.tst,
    this.thisisfixcustomfeild,
    this.fort,
    this.asfdsjjasdjdssd,
    this.gadfads,
    this.jjasdjdssd,
    this.thisischeckneww,
    this.ssa,
  });

  CustomFieldData copyWith({
    dynamic asdadfasd,
    DateTime? testdate,
    String? testtext,
    String? testtextarea,
    bool? thisisnam,
    DateTime? thisischeckmandatory,
    String? invoiceis,
    bool? test,
    bool? tst,
    dynamic thisisfixcustomfeild,
    DateTime? fort,
    bool? asfdsjjasdjdssd,
    bool? gadfads,
    bool? jjasdjdssd,
    bool? thisischeckneww,
    bool? ssa,
  }) =>
      CustomFieldData(
        asdadfasd: asdadfasd ?? this.asdadfasd,
        testdate: testdate ?? this.testdate,
        testtext: testtext ?? this.testtext,
        testtextarea: testtextarea ?? this.testtextarea,
        thisisnam: thisisnam ?? this.thisisnam,
        thisischeckmandatory: thisischeckmandatory ?? this.thisischeckmandatory,
        invoiceis: invoiceis ?? this.invoiceis,
        test: test ?? this.test,
        tst: tst ?? this.tst,
        thisisfixcustomfeild: thisisfixcustomfeild ?? this.thisisfixcustomfeild,
        fort: fort ?? this.fort,
        asfdsjjasdjdssd: asfdsjjasdjdssd ?? this.asfdsjjasdjdssd,
        gadfads: gadfads ?? this.gadfads,
        jjasdjdssd: jjasdjdssd ?? this.jjasdjdssd,
        thisischeckneww: thisischeckneww ?? this.thisischeckneww,
        ssa: ssa ?? this.ssa,
      );

  factory CustomFieldData.fromJson(Map<String, dynamic> json) => CustomFieldData(
        asdadfasd: json["asdadfasd"],
        testdate: json["testdate"] == null ? null : DateTime.parse(json["testdate"]),
        testtext: json["testtext"],
        testtextarea: json["testtextarea"],
        thisisnam: json["thisisnam"],
        thisischeckmandatory: json["thisischeckmandatory"] == null ? null : DateTime.parse(json["thisischeckmandatory"]),
        invoiceis: json["invoiceis"],
        test: json["test"],
        tst: json["tst"],
        thisisfixcustomfeild: json["thisisfixcustomfeild"],
        fort: json["fort"] == null ? null : DateTime.parse(json["fort"]),
        asfdsjjasdjdssd: json["asfdsjjasdjdssd"],
        gadfads: json["gadfads"],
        jjasdjdssd: json["jjasdjdssd"],
        thisischeckneww: json["thisischeckneww"],
        ssa: json["ssa"],
      );

  Map<String, dynamic> toJson() => {
        "asdadfasd": asdadfasd,
        "testdate": testdate?.toIso8601String(),
        "testtext": testtext,
        "testtextarea": testtextarea,
        "thisisnam": thisisnam,
        "thisischeckmandatory": thisischeckmandatory?.toIso8601String(),
        "invoiceis": invoiceis,
        "test": test,
        "tst": tst,
        "thisisfixcustomfeild": thisisfixcustomfeild,
        "fort": fort?.toIso8601String(),
        "asfdsjjasdjdssd": asfdsjjasdjdssd,
        "gadfads": gadfads,
        "jjasdjdssd": jjasdjdssd,
        "thisischeckneww": thisischeckneww,
        "ssa": ssa,
      };
}

enum Status { CLOSED, DISPUTE, OVERDUE, PARTIALLY_PAID }

final statusValues =
    EnumValues({"Closed": Status.CLOSED, "Dispute": Status.DISPUTE, "Overdue": Status.OVERDUE, "Partially Paid": Status.PARTIALLY_PAID});

enum Type { FIRST_INVOICE_TYPE, SECOND_INVOICE_TYPE }

final typeValues = EnumValues({"First Invoice type": Type.FIRST_INVOICE_TYPE, "Second Invoice type": Type.SECOND_INVOICE_TYPE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
