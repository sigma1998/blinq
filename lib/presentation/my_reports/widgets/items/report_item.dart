// Flutter imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/theme/app_colors.dart';

// Project imports:
import 'package:blinq/data/model/history/history_item/history_item_dto.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/expanded_section.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/utils/general_functions.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileReportItem extends StatefulWidget {
  //
  final HistoryItemModelDto historyItemModelDto;

  final void Function() onPdfOpen;
  final void Function() onDownload;
  final void Function() onDelete;
  final void Function() onContinue;

  const ProfileReportItem({
    super.key,
    required this.historyItemModelDto,
    // required this.status,
    //
    required this.onPdfOpen,
    required this.onDelete,
    required this.onDownload,
    required this.onContinue
  });

  @override
  State<ProfileReportItem> createState() => _ProfileReportItemState();
}

class _ProfileReportItemState extends State<ProfileReportItem>
    with AutomaticKeepAliveClientMixin<ProfileReportItem> {
  //
  late bool isExpanded;

  @override
  void initState() {
    isExpanded = false;
    super.initState();
  }

  void updateState() => {if (mounted) setState(() {})};

  @override
  Widget build(BuildContext context) {
    super.build(context);
    bool isActive = widget.historyItemModelDto.status == 'active';
    return MyInfoContainer(
      onTap: onTap,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(AppDrawables.pdf),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  getReportTime(widget.historyItemModelDto.createdAt!),
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SvgPicture.asset(
                  isActive ? AppDrawables.stop : AppDrawables.success),
            ],
          ),
          ExpandedSection(
            expand: isExpanded,
            child: Column(
              children: [
                const SizedBox(height: 36),
                isActive
                    ? Center(
                      child: MyButton.primary(
                        width: 110,
                          color: AppColors.activeReportColor,
                          label: 'strContinue'.tr(),
                          onTap: widget.onContinue ,
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 16,
                          ),
                          iconLeft: SvgPicture.asset(
                            AppDrawables.retry,
                          ),
                          labelStyle: const TextStyle(fontSize: 11),
                        ),
                    )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MyButton.primary(
                            label: 'strOpenPdf'.tr(),
                            onTap: widget.onPdfOpen ,
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 16,
                            ),
                            iconLeft: SvgPicture.asset(
                              AppDrawables.pdf,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            labelStyle: const TextStyle(fontSize: 11),
                          ),
                          const SizedBox(width: 44),
                          GestureDetector(
                            onTap: widget.onDownload,
                            child: SvgPicture.asset(AppDrawables.download),
                          ),
                          const SizedBox(width: 16),
                          GestureDetector(
                            onTap: widget.onDelete,
                            child: SvgPicture.asset(AppDrawables.delete),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onTap() {
    isExpanded = !isExpanded;
    updateState();
  }

  @override
  bool get wantKeepAlive => true;
}
