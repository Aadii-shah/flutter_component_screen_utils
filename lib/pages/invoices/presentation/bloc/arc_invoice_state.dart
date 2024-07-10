import 'package:equatable/equatable.dart';
import 'package:finnoto_app/arcPortal/presentation/pages/dashboard/home/presentation/widget/card/invoices/data/model/arc_invoice_model.dart';

enum ArcInvoiceDataStatus { initial, loading, loaded, error }

class ArcInvoiceState extends Equatable {
  final ArcInvoiceDataStatus status;
  final ArcInvoiceModel? model;
  final String? errorMessage;
  final List<Map<String, dynamic>> filteredArcInvoice;

  const ArcInvoiceState({
    required this.status,
    this.model,
    this.errorMessage,
    this.filteredArcInvoice = const [],
  });

  factory ArcInvoiceState.initial() {
    return const ArcInvoiceState(status: ArcInvoiceDataStatus.initial);
  }

  ArcInvoiceState copyWith({
    ArcInvoiceDataStatus? status,
    ArcInvoiceModel? model,
    String? errorMessage,
    List<Map<String, dynamic>>? filteredArcInvoice,
  }) {
    return ArcInvoiceState(
      status: status ?? this.status,
      model: model ?? this.model,
      errorMessage: errorMessage ?? this.errorMessage,
      filteredArcInvoice: filteredArcInvoice ?? this.filteredArcInvoice,
    );
  }

  @override
  List<Object?> get props => [status, model, errorMessage, filteredArcInvoice];
}
