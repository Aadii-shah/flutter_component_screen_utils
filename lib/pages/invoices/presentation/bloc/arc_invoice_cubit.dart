import 'package:finnoto_app/arcPortal/presentation/pages/dashboard/home/presentation/widget/card/invoices/data/model/arc_invoice_model.dart';
import 'package:finnoto_app/arcPortal/presentation/pages/dashboard/home/presentation/widget/card/invoices/domain/usecase/get_arc_invoice.dart';
import 'package:finnoto_app/arcPortal/presentation/pages/dashboard/home/presentation/widget/card/invoices/presentation/bloc/arc_invoice_state.dart';

import 'package:finnoto_app/employeePortal/data/network/error/network_error_handler.dart';
import 'package:finnoto_app/employeePortal/presentation/core/helper/msc/all_imports.dart';
import 'package:rxdart/rxdart.dart';

class ArcInvoiceCubit extends Cubit<ArcInvoiceState> {
  final GetArcInvoice getArcInvoice;
  final _searchQuerySubject = BehaviorSubject<String>();

  List<Record> accumulatedRecords = [];

  ArcInvoiceCubit({required this.getArcInvoice}) : super(ArcInvoiceState.initial()) {
    _searchQuerySubject.debounceTime(const Duration(milliseconds: 700)).listen((searchQuery) {
      if (searchQuery.isEmpty) {
        fetchArcInvoice(20, 1);
      } else {
        filteredArcInvoice(searchQuery, 20, 1);
      }
    });
  }

  void updateSearchQuery(String query) {
    _searchQuerySubject.add(query);
  }

  Future<ArcInvoiceState> fetchArcInvoice(int limit, int page, {String? searchQuery}) async {
    try {
      emit(state.copyWith(status: ArcInvoiceDataStatus.loading));
      final response = await getArcInvoice(Params(limit: limit, page: page, searchQuery: searchQuery));
      final fetchState = response.fold(
        (failure) => state.copyWith(status: ArcInvoiceDataStatus.error, errorMessage: _mapFailureToMessage(failure)),
        (model) {
          if (page == 1) {
            accumulatedRecords = (model.records ?? []).cast<Record>();
          } else {
            accumulatedRecords.addAll((model.records ?? []).cast<Record>());
          }
          return state.copyWith(status: ArcInvoiceDataStatus.loaded, model: ArcInvoiceModel(records: accumulatedRecords));
        },
      );
      emit(fetchState);
      return fetchState;
    } catch (exception, stackTrace) {
      debugPrint("Exception occurred: $exception");
      debugPrint("Stack trace: $stackTrace");
      final errorResponse = await handleNetworkError(exception, stackTrace);
      final errorMessage = errorResponse?.data["status-message"] ?? 'Unexpected Error';
      final errorState = state.copyWith(status: ArcInvoiceDataStatus.error, errorMessage: errorMessage);
      emit(errorState);
      return errorState;
    }
  }

  Future<ArcInvoiceState> filteredArcInvoice(String searchQuery, int limit, int page) async {
    try {
      emit(state.copyWith(status: ArcInvoiceDataStatus.loading));
      final response = await getArcInvoice(Params(limit: limit, page: page, searchQuery: searchQuery));
      final filterState = response.fold(
        (failure) => state.copyWith(status: ArcInvoiceDataStatus.error, errorMessage: _mapFailureToMessage(failure)),
        (model) {
          final filteredArcInvoice = model.records!.map((record) => record.toJson()).toList();
          return state.copyWith(
            status: ArcInvoiceDataStatus.loaded,
            model: model,
            filteredArcInvoice: filteredArcInvoice,
          );
        },
      );
      emit(filterState);
      return filterState;
    } catch (exception, stackTrace) {
      debugPrint("Exception occurred: $exception");
      debugPrint("Stack trace: $stackTrace");
      final errorResponse = await handleNetworkError(exception, stackTrace);
      final errorMessage = errorResponse?.data["status-message"] ?? 'Unexpected Error';
      final errorState = state.copyWith(status: ArcInvoiceDataStatus.error, errorMessage: errorMessage);
      emit(errorState);
      return errorState;
    }
  }

  @override
  Future<void> close() {
    _searchQuerySubject.close();
    return super.close();
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return 'Server Failure';
      case NetworkFailure _:
        return 'Network Failure';
      case CacheFailure _:
        return 'Cache Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
