import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/core/widgets/w_divider.dart';

import '../../../../assets/constants/icons.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(elevation: 0.0,
      backgroundColor: scaffoldBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.only(left: 238,top: 67,right: 18,),
            child: SvgPicture.asset(AppIcons.sun),
          ),
          const ListTile(
            leading:
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/profile_picture.png'),
            ),
            title: Text('Rozan',
                style: TextStyle(fontSize: 20,fontFamily: 'Barlow',fontWeight: FontWeight.w700,)),
            subtitle: Text('rozan.hasan.matar115@gmail...',
                style: TextStyle(fontSize: 14,fontFamily: 'Barlow',fontWeight: FontWeight.w400,)),
          ),

          const SizedBox(height: 12),

          /// Premium button
          ListTile(
            horizontalTitleGap: 0,
            leading: SvgPicture.asset(AppIcons.premium),

            title: const Text('Premium',
                style: TextStyle(fontSize: 16,fontFamily: 'Barlow',fontWeight: FontWeight.w500,fontStyle: FontStyle.normal)),
            onTap: () {Navigator.pop(context);},
          ),

          /// Settings button
          ListTile(
            horizontalTitleGap: 0,
            leading: SvgPicture.asset(AppIcons.settings),

            title: const Text('Settings',
                style: TextStyle(fontSize: 16,fontFamily: 'Barlow',fontWeight: FontWeight.w500,fontStyle: FontStyle.normal)),
            onTap: () {Navigator.pop(context);},
          ),

          /// Articles button
          ListTile(
            horizontalTitleGap: 0,
            leading: SvgPicture.asset(AppIcons.articles),

            title: const Text('Articles',
                style: TextStyle(fontSize: 16,fontFamily: 'Barlow',fontWeight: FontWeight.w500,fontStyle: FontStyle.normal)),
            onTap: () {Navigator.pop(context);},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: WDivider(),
          ),

          /// Help button
          ListTile(
            horizontalTitleGap: 0,
            leading: SvgPicture.asset(AppIcons.help),

            title: const Text('Help',
                style: TextStyle(fontSize: 16,fontFamily: 'Barlow',fontWeight: FontWeight.w500,fontStyle: FontStyle.normal)),
            onTap: () {Navigator.pop(context);},
          ),

          /// Terms button
          ListTile(
            horizontalTitleGap: 0,
            leading: SvgPicture.asset(AppIcons.terms),

            title: const Text('Terms',
                style: TextStyle(fontSize: 16,fontFamily: 'Barlow',fontWeight: FontWeight.w500,fontStyle: FontStyle.normal)),
            onTap: () {Navigator.pop(context);},
          ),

          /// FAQ button
          ListTile(
            horizontalTitleGap: 0,
            leading: SvgPicture.asset(AppIcons.faq),

            title: const Text('FAQ',
                style: TextStyle(fontSize: 16,fontFamily: 'Barlow',fontWeight: FontWeight.w500,fontStyle: FontStyle.normal)),
            onTap: () {Navigator.pop(context);},
          ),

        ],
      ),
    );
  }
}