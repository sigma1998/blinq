// Flutter imports:
import 'package:blinq/data/model/history/history_item/history_item_dto.dart';
import 'package:blinq/utils/general_functions.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/custom_widgets/secondary_button.dart';
import 'package:blinq/utils/custom_widgets/expanded_section.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';

class ProfileReportItem extends StatefulWidget {
  //
  final HistoryItemModelDto historyItemModelDto;

  final void Function()? onPdfOpen;
  final void Function()? onDownload;
  final void Function()? onDelete;

  const ProfileReportItem({
    super.key,
    required this.historyItemModelDto,
    // required this.status,
    //
    this.onPdfOpen,
    this.onDelete,
    this.onDownload,
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
              SvgPicture.asset(AppDrawables.success),
            ],
          ),
          ExpandedSection(
            expand: isExpanded,
            child: Column(
              children: [
                const SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SecondaryButton(
                      label: 'strOpenPdf'.tr(),
                      onTap: widget.onPdfOpen ?? () {},
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 16,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 11,
                      ),
                      iconLeft: SvgPicture.asset(
                        AppDrawables.pdf,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
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
