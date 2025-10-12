import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  Widget _buildNavItem(String asset, String label, int index) {
    final isSelected = selectedIndex == index;
    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            // left: -12,
            // right: -12,
            child: Material(
              color: Colors.transparent,
              child: InkResponse(
                containedInkWell: false,
                radius: 56,
                splashColor: AppColors.primary.withOpacity(0.1),
                highlightColor: Colors.transparent,
                onTap: () => onItemTapped(index),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        isSelected ? "$asset-active.svg" : "$asset.svg",
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.textPrimary,
                        height: 24,
                      ),
                      const SizedBox(height: 2),
                      CustomText(
                        text: label,
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.textPrimary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      padding: EdgeInsets.zero,
      color: AppColors.white,
      surfaceTintColor: Colors.transparent,
      shape: const CircularNotchedRectangle(),
      elevation: 9,
      shadowColor: AppColors.textPrimary,
      notchMargin: 6,
      clipBehavior: Clip.antiAliasWithSaveLayer, // enforces "overflow: hidden"
      child: SizedBox(
        height: 70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem("assets/img/icon/icon-home", "Home", 0),
            _buildNavItem(
                "assets/img/icon/icon-transaction", "Transactions", 1),
            const SizedBox(width: 40), // notch space
            _buildNavItem("assets/img/icon/icon-wallet", "Wallet", 3),
            _buildNavItem("assets/img/icon/icon-profile", "Profile", 4),
          ],
        ),
      ),
    );
  }
}
