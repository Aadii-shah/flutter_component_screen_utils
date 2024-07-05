import 'package:finnoto_app/arcPortal/presentation/core/color/arc_color.dart';
import 'package:finnoto_app/arcPortal/presentation/core/textStyle/arc_text_weight.dart';
import 'package:finnoto_app/arcPortal/presentation/core/textStyle/arc_textstyle.dart';
import 'package:finnoto_app/employeePortal/presentation/core/helper/msc/all_imports.dart';

Widget customerCardComponent(
    {required String iconPath,
    required String name,
    required String email,
    required String statusString,
    required dynamic amount,
    required String category,
    required Color statusColor,
    required dynamic creditPeriod}) {
  return Container(
    width: 358.w,
    decoration: BoxDecoration(
      color: ARCColorsConstant.ffFFFFFF,
      borderRadius: BorderRadius.circular(8.0).r,
      boxShadow: [
        BoxShadow(
          color: ARCColorsConstant.ff181C1C.withOpacity(0.2),
          //spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(16).w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40.w,
                width: 40.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0).w,
                  shape: BoxShape.rectangle,
                  color: ARCColorsConstant.ff6F3368.withOpacity(0.2),
                ),
                padding: const EdgeInsets.all(8).r,
                child: SvgPicture.asset(
                  iconPath,
                  width: 24.w,
                  height: 24.w,
                ),
              ),
              12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _identifierRow(name, amount),
                  SizedBox(
                      width: 250.w,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 170.w,
                            ),
                            child: Text(
                              email,
                            ).robottoRegularsize12color101828(),
                          ),
                          DotsIndicator(
                            dotsCount: 1,
                            decorator: const DotsDecorator(
                              activeSize: Size(3.0, 3.0),
                              color: ARCColorsConstant.ff181C1C,
                              activeColor: ARCColorsConstant.ff181C1C,
                            ),
                          ),
                          Text(
                            statusString,
                            style: GoogleFonts.roboto(fontSize: 14.sp, fontWeight: ArcFontWeights.regular, color: statusColor),
                          )
                        ],
                      )),
                ],
              ),
            ],
          ),
          4.verticalSpace,
          Divider(
            height: 20.h,
            color: ARCColorsConstant.ffC7D0D0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [const Text('Category').robottoRegularsize12color798597(), const Text('Credit Period').robottoRegularsize12color798597()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 190.w),
                  child: Text(
                    category,
                  ).robottoMediumsize14color101828()),
              Text(creditPeriod).robottoMediumsize14color101828()
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _identifierRow(
  String name,
  dynamic amount,
) {
  return SizedBox(
    width: 275.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 150.w,
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ).robottoMediumsize14color101828(),
        ),
        Text(CurrencyFormatterUtils.formatAmount(amount)).robottoMediumsize14colorB3261E(),
      ],
    ),
  );
}
