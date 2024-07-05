import 'package:flutter/material.dart';
import 'package:flutter_component/core/color.dart';
import 'package:flutter_component/core/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget emailCardComponent({
  required String nameAbbreviation,
  required String notice,
  required String email,
  required String messageSate,
  required DateTime? dateTime,
  required Color messageSateColor,
  required Color cardColor,
  required bool showAttachment,
  required bool showForwardCount,
  required dynamic attachmentCount,
  required dynamic messageForwardCount,
}) {
  return Container(
    width: 358.w,
    decoration: BoxDecoration(
      color: cardColor,
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
                  child: Center(child: Text(nameAbbreviation).robottoMediumsize14color6F3368())),
              12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _identifierRow(notice),
                  SizedBox(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 190.w,
                        ),
                        child: Text(
                          email,
                        ).robottoRegularsize12color101828(),
                      ),
                      DotsIndicator(
                        dotsCount: 1,
                        decorator: const DotsDecorator(
                          activeSize: Size(4.0, 4.0),
                          color: ARCColorsConstant.ff181C1C,
                          activeColor: ARCColorsConstant.ff181C1C,
                        ),
                      ),
                      Text(
                        messageSate,
                        style: GoogleFonts.roboto(fontSize: 14.sp, fontWeight: ArcFontWeights.regular, color: messageSateColor),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                DateFormatterUtils.dateTimeFormatCreatedAt(dateTime),
              ).robottoMediumsize14color101828(),
              Row(
                children: [
                  if (showAttachment)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0).w,
                        shape: BoxShape.rectangle,
                        color: ARCColorsConstant.ff6F3368.withOpacity(0.2),
                      ),
                      padding: const EdgeInsets.all(8).r,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/arcPortal/card/email_attachment.svg',
                            height: 20.w,
                            width: 20.w,
                          ),
                          4.horizontalSpace,
                          Text(attachmentCount).robottoIntersize12color6F3368()
                        ],
                      ),
                    ),
                  8.horizontalSpace,
                  if (showForwardCount)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0).w,
                        shape: BoxShape.rectangle,
                        color: ARCColorsConstant.ff6F3368.withOpacity(0.2),
                      ),
                      padding: const EdgeInsets.all(8).r,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/arcPortal/card/email_forward.svg',
                            height: 20.w,
                            width: 20.w,
                          ),
                          4.horizontalSpace,
                          Text(messageForwardCount).robottoIntersize12color6F3368()
                        ],
                      ),
                    )
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _identifierRow(
  String name,
) {
  return SizedBox(
    width: 275.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 275.w,
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ).robottoMediumsize14color101828(),
        ),
      ],
    ),
  );
}
