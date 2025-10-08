import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNav({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  Widget _buildNavItem(String asset, String label, int index) {
    final isSelected = selectedIndex == index;

    return Material(
      color: Colors.transparent, // so ripple shows over background
      child: InkWell(
        onTap: () => onItemTapped(index),
        child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    isSelected ? "$asset-active.svg" : "$asset.svg",
                    color: isSelected ? AppColors.primary : AppColors.black,
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.white, //  background color
      surfaceTintColor: Colors.transparent,
      shape: const CircularNotchedRectangle(), // 👈 notch for FAB
      elevation: 3,
      shadowColor: AppColors.textPrimary,
      notchMargin: 6,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem("assets/img/icon/icon-home", "Home", 0),
            _buildNavItem(
                "assets/img/icon/icon-transaction", "Transactions", 1),
            const SizedBox(width: 40), // 👈 reserved space for FAB
            _buildNavItem("assets/img/icon/icon-wallet", "Wallet", 3),
            _buildNavItem("assets/img/icon/icon-profile", "Profile", 4),
          ],
        ),
      ),
    );
  }
}
