import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ulangan1_11pplg2/components/color/color.dart';

class NavbarPage extends StatelessWidget {
  
  const NavbarPage({
    super.key,
    });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: SupportColor.whiteColor,
        backgroundColor: SupportColor.whiteColor,
        labelPadding: EdgeInsets.only(top: 2),
        labelTextStyle: WidgetStateProperty.all (
          TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: MainColor.primaryColor,
        ),
        ),

        destinations:[ 
          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/icons/home_focused.svg",
              width: 32,
              height: 32,
              ), 
            label: "Home"),
          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/icons/history_unfocused.svg",
              width: 32,
              height: 32,
              ), 
            label: "History"),
            NavigationDestination(
            icon: SvgPicture.asset(
              "assets/icons/profile_unfocused.svg",
              width: 32,
              height: 32,
              ), 
            label: "Profile"),
          ]
        
        ),
        
      // body: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
             

      //       icon: Container(
      //         margin: const EdgeInsets.only(bottom: 50), 
      //         child: SvgPicture.asset(
      //         'assets/icons/home_unfocused.svg',
      //         width: 36,
      //         height: 36,
      //         ),
      //       ),

      //       activeIcon: SvgPicture.asset(
      //         'assets/icons/home_unfocused.svg',
      //         width: 36,
      //         height: 36,
      //       ),

      //       label: "Home",
      //     ),

      //     BottomNavigationBarItem(

      //       icon: SvgPicture.asset(
      //         'assets/icons/history_unfocused.svg',
      //         width: 36,
      //         height: 36,
      //       ),

      //       activeIcon: SvgPicture.asset(
      //         'assets/icons/history_unfocused.svg',
      //         width: 36,
      //         height: 36,
      //       ),

      //       label: "History",
      //     ),

      //     BottomNavigationBarItem(

      //       icon: SvgPicture.asset(
      //         'assets/icons/profile_unfocused.svg',
      //         width: 36,
      //         height: 36,
      //       ),

      //       activeIcon: SvgPicture.asset(
      //         'assets/icons/profile_unfocused.svg',
      //         width: 36,
      //         height: 36,
      //       ),

      //       label: "Profile",
      //     ),
      //   ],

      //   selectedLabelStyle: const TextStyle(
      //     fontSize: 18,
      //     fontWeight: FontWeight.w600,
      //     color: MainColor.primaryColor,
      //   ),
      //   unselectedLabelStyle: const TextStyle(
      //     fontSize: 18,
      //     fontWeight: FontWeight.w600,
      //     color: SupportColor.stroke,
      //   ) ,
      //   )

    );
  }
}