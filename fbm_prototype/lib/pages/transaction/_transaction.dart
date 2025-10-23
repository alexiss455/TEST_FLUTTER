// import 'package:FBM/components/_custom_colors.dart';
// import 'package:FBM/components/_custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class TransactionsPage extends StatefulWidget {
//   const TransactionsPage({super.key}); // 👈 add const

//   @override
//   State<TransactionsPage> createState() => TrascactionPageState();
// }

// class TrascactionPageState extends State<TransactionsPage> {
//   final _tabs = ['All', 'Withdraw', 'Top Up'];

//   final _transactionsListItems = [
//     {
//       'category': 'WITHDRAW',
//       'merchant': 'PNB',
//       'amount': '24.000',
//       'date': '12/12/2022',
//     },
//     {
//       'category': 'WITHDRAW',
//       'merchant': 'PNB',
//       'amount': '10.000',
//       'date': '12/12/2022',
//     },
//     {
//       'category': 'TOP UP',
//       'merchant': 'PNB',
//       'amount': '1.000',
//       'date': '12/12/2022',
//     },
//     {
//       'category': 'WITHDRAW',
//       'merchant': 'GCASH',
//       'amount': '100.000',
//       'date': '12/12/2022',
//     },
//     {
//       'category': 'TOP UP',
//       'merchant': 'QRPH',
//       'amount': '200.000',
//       'date': '12/12/2022',
//     }
//   ];

//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: CustomText(
//           text: 'Transaction',
//           fontWeight: FontWeight.w600,
//           fontSize: 18,
//         ),
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//           ),
//           onPressed: () => Navigator.pushNamed(context, '/'),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
//           return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 children: [
//                   SizedBox(height: 10),
//                   Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 8.0, vertical: 8.0),
//                       decoration: BoxDecoration(
//                         color: AppColors.textSecondary.withOpacity(0.05),
//                         borderRadius: BorderRadius.all(
//                             Radius.circular(AppColors.mainRadius)),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         spacing: 8.0,
//                         children: _tabs.asMap().entries.map((entry) {
//                           final index = entry.key;
//                           final tab = entry.value;
//                           final isActive = _selectedIndex == index;

//                           return Expanded(
//                             child: GestureDetector(
//                               onTap: () => _onItemTapped(index),
//                               child: AnimatedContainer(
//                                 duration: Duration(milliseconds: 10),
//                                 padding: EdgeInsets.symmetric(vertical: 10),
//                                 decoration: BoxDecoration(
//                                     color: isActive
//                                         ? AppColors.primary.withOpacity(0.2)
//                                         : AppColors.white,
//                                     border: Border.all(
//                                         color:
//                                             Color.fromARGB(255, 243, 243, 243)),
//                                     borderRadius: BorderRadius.circular(
//                                         AppColors.subRadius)),
//                                 child: Center(
//                                   child: CustomText(
//                                     text: tab,
//                                     color: isActive
//                                         ? AppColors.primary
//                                         : AppColors.textPrimary,
//                                     fontWeight: isActive
//                                         ? FontWeight.w600
//                                         : FontWeight.w400,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       )),
//                   SizedBox(height: 20),
//                   // Your content goes here
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 20),
//                         child: CustomText(
//                           text: 'Withdraw',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 18,
//                         ),
//                       ),
//                       SizedBox(
//                         width: double.infinity,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               spacing: 10,
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.all(12.0),
//                                   decoration: BoxDecoration(
//                                     border:
//                                         Border.all(color: AppColors.greyLigh2),
//                                     borderRadius: BorderRadius.circular(
//                                         AppColors.circleRadius),
//                                   ),
//                                   child: SvgPicture.asset(
//                                     width: 28,
//                                     height: 28,
//                                     'assets/img/logo/pnb.svg',
//                                     semanticsLabel: 'Red dash paths',
//                                   ),
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     CustomText(
//                                       text: 'Withdraw',
//                                       color: AppColors.textPrimary,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                     CustomText(
//                                       text: 'PNB',
//                                       color: AppColors.textSecondary,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 CustomText(
//                                   text: 'Php 1,000.00 ',
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                                 CustomText(
//                                   text: 'Mar 12, 2024',
//                                   color: AppColors.textSecondary,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ));
//         })),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage>
    with SingleTickerProviderStateMixin {
  int _activeTab = 0;
  int _previousTab = 0;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  final List<String> tabs = ["Overview", "Details", "Reviews"];
  final List<Color> colors = [
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.purpleAccent
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation =
        Tween<double>(begin: 1, end: 1).animate(_animationController);
  }

  void _onTabTap(int index) {
    if (index == _activeTab) return;

    final bool isForward = index > _activeTab;

    setState(() {
      _previousTab = _activeTab;
      _activeTab = index;
    });

    // Configure animations for smooth page-like transition
    _slideAnimation = Tween<Offset>(
      begin: Offset(isForward ? 1 : -1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward(from: 0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildTabContent(String text, Color color) {
    return Container(
      color: color.withOpacity(0.1),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double tabWidth = screenWidth / tabs.length;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Custom Sliding Tabs'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // 🔹 Tabs Row
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(tabs.length, (index) {
                final bool isActive = _activeTab == index;
                return GestureDetector(
                  onTap: () => _onTabTap(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tabs[index],
                        style: TextStyle(
                          fontWeight:
                              isActive ? FontWeight.bold : FontWeight.w500,
                          color: isActive ? Colors.blue : Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 3,
                        width: isActive ? 30 : 0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 10),

          // 🔹 Tab Content (Slide + Fade Transition)
          Expanded(
            child: Stack(
              children: List.generate(tabs.length, (index) {
                if (index == _activeTab) {
                  return SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: _buildTabContent(
                        "${tabs[index]} Content",
                        colors[index],
                      ),
                    ),
                  );
                } else if (index == _previousTab) {
                  // Fade old content away while sliding new one in
                  return FadeTransition(
                    opacity: Tween<double>(begin: 1, end: 0)
                        .animate(_animationController),
                    child: _buildTabContent(
                      "${tabs[index]} Content",
                      colors[index],
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
