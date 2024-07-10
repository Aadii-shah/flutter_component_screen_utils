import 'package:finnoto_app/arcPortal/presentation/core/color/arc_color.dart';
import 'package:finnoto_app/arcPortal/presentation/core/utils/arc_app_bar.dart';
import 'package:finnoto_app/arcPortal/presentation/pages/dashboard/home/presentation/widget/card/invoices/data/model/arc_invoice_model.dart';
import 'package:finnoto_app/arcPortal/presentation/pages/dashboard/home/presentation/widget/card/invoices/presentation/bloc/arc_invoice_state.dart';
import 'package:finnoto_app/arcPortal/presentation/pages/dashboard/home/presentation/widget/card/invoices/presentation/widget/invoice_card_component.dart';
import 'package:finnoto_app/employeePortal/presentation/core/enum/enum.dart';
import 'package:finnoto_app/employeePortal/presentation/core/helper/msc/bloc_import.dart';
import 'package:finnoto_app/employeePortal/presentation/pages/dashboard/card/expense/presentation/widget/circular_indicator.dart';
import 'package:finnoto_app/employeePortal/presentation/widgets/components/layout/no_data.dart';
import 'package:finnoto_app/employeePortal/presentation/widgets/shimmer/list_shimmer_effect.dart';
import 'package:flutter/material.dart';

class ArcInvoicesCardPage extends StatefulWidget {
  const ArcInvoicesCardPage({super.key});

  @override
  State<ArcInvoicesCardPage> createState() => _ArcInvoicesCardPageState();
}

class _ArcInvoicesCardPageState extends State<ArcInvoicesCardPage> {
  late ScrollController _scrollController;
  final int _limit = 20;
  int _page = 1;
  bool _isLoading = false;
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _arcInvoice = [];
  List<Map<String, dynamic>> filteredARCInvoice = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _fetchInitialArcInvoice();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _fetchInitialArcInvoice() async {
    _page = 1;

    try {
      final state = await context.read<ArcInvoiceCubit>().fetchArcInvoice(_limit, _page);
      if (state.status == ArcInvoiceDataStatus.loaded && state.model != null) {
        final newInvoices = state.model!.records!.map((record) => record.toJson()).toList();
        if (newInvoices.isNotEmpty) {
          _arcInvoice.addAll(newInvoices);
          filteredARCInvoice.clear();
        }
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      debugPrint("Failed to load initial advances: $error");
    }
  }

  void _fetchmoreArcInvoice() async {
    try {
      final state = await context.read<ArcInvoiceCubit>().fetchArcInvoice(_limit, _page);
      if (state.status == ArcInvoiceDataStatus.loaded && state.model != null) {
        final moreInvoices = state.model!.records!.map((record) => record.toJson()).toList();
        if (moreInvoices.isNotEmpty) {
          setState(() {
            _arcInvoice.addAll(moreInvoices);
            filteredARCInvoice.clear();
            _isLoading = false;
          });
        } else {
          setState(() {
            _isLoading = false;
          });
        }
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      debugPrint("Failed to load more advances: $error");
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !_scrollController.position.outOfRange) {
      if (!_isLoading) {
        setState(() {
          _isLoading = true;
          _page++;
        });

        _fetchmoreArcInvoice();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ARCColorsConstant.ffF0F2F4,
      appBar: const ARCAppBar(scrolledUnderElevation: true, shadowColor: true, detailsName: 'Invoices'),
      body: BlocBuilder<ArcInvoiceCubit, ArcInvoiceState>(
        builder: (context, state) {
          if (state.status == ArcInvoiceDataStatus.loading && _page == 1) {
            return const ListShimmerEffect();
          } else if (state.status == ArcInvoiceDataStatus.error) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else if (state.model?.records == null || state.model!.records!.isEmpty && state.status != ArcInvoiceDataStatus.loading) {
            return const NoDataAvailable(title: 'No Invoices Available', subTitle: 'Invoices are not recorded');
          } else {
            final ArcInvoiceModel arcInvoiceModel = state.model!;

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: arcInvoiceModel.records!.length + (_isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == arcInvoiceModel.records!.length && _isLoading) {
                        return buildProgressIndicator();
                      }

                      final record = arcInvoiceModel.records![index];
                      const iconPath = 'assets/arcPortal/card/invoice.svg';
                      final name = record.customer ?? '-';
                      final indentifier = record.identifier ?? '-';

                      final amount = double.tryParse(record.amount.toString()) ?? 0.0;
                      final invoiceDate = record.invoiceDate;
                      final dueDate = record.dueDate;
                      const dueDays = ' (from 6 days)';
                      final balance = record.balance;

                      final statusInfo = ArcInvoiceStatusEnum.getTextAndColor(record.statusId);
                      final statusString = statusInfo['text'] as String;
                      final statusColor = statusInfo['color'] as Color;

                      return Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16,
                          ),
                          child: invoiceCardComponent(
                              iconPath: iconPath,
                              name: name,
                              indentifier: indentifier,
                              statusString: statusString,
                              amount: amount,
                              statusColor: statusColor,
                              invoiceDate: invoiceDate,
                              dueDate: dueDate,
                              dueDays: dueDays,
                              balance: balance));
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
