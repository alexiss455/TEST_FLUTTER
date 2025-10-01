import 'package:FBM/components/_custom_colors.dart';
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
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              isSelected ? "${asset}-active.svg" : "$asset.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.primary : AppColors.grey,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.primary : AppColors.grey,
                fontSize: 12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ],
        ),
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
