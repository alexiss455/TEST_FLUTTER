import 'package:casino/components/_custom_colors.dart';
import 'package:casino/components/_custom_text.dart';
import 'package:flutter/material.dart';

class CustomNavTab extends StatefulWidget {
  final TabController tabController;
  final List<String> tabs;
  final int height;
  const CustomNavTab({
    super.key,
    required this.tabController,
    required this.tabs,
    this.height = 75,
  });

  @override
  StateCustomNavTab createState() => StateCustomNavTab();
}

class StateCustomNavTab extends State<CustomNavTab>
    with SingleTickerProviderStateMixin {
  void _handleTabSelection(int index) {
    setState(() {
      widget.tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height.toDouble(),
      // color: AppColors.primary,
      padding: EdgeInsets.only(
          top: 10.0,
          left: AppColors.mainPadding,
          right: AppColors.mainPadding,
          bottom: 10.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: AppColors.textSecondary.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(AppColors.mainRadius)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          spacing: 6.0,
          children: widget.tabs.asMap().entries.map((entry) {
            final index = entry.key;
            final tab = entry.value;
            final isActive = widget.tabController.index == index;
            return Expanded(
                flex: 1,
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(AppColors.subRadius),
                      onTap: () => _handleTabSelection(index),
                      child: GestureDetector(
                        child: Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: isActive
                                ? AppColors.primary.withOpacity(0.2)
                                : AppColors.white,
                            border: Border.all(
                                color: Color.fromARGB(255, 243, 243, 243)),
                            borderRadius:
                                BorderRadius.circular(AppColors.subRadius),
                          ),
                          child: Center(
                            child: CustomText(
                              textAlign: TextAlign.center,
                              text: tab,
                              height: 1,
                              color: isActive
                                  ? AppColors.primary
                                  : AppColors.textPrimary,
                              fontWeight:
                                  isActive ? FontWeight.w600 : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    )));
          }).toList(),
        ),
      ),
    );
  }
}
