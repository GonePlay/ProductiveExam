import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../assets/constants/colors.dart';
import '../../../../assets/constants/icons.dart';
import '../../../../core/widgets/todo_widget.dart';

class AllPage extends StatelessWidget {
  const AllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        const Gap(20),
        TodoWidget(
            mainIcon: SvgPicture.asset(AppIcons.gym),
            iconBoxColor: orange,
            titleText: 'Gym time',
            timeText: '03:00 PM - 04:30 PM'),
        TodoWidget(
          mainIcon: SvgPicture.asset(AppIcons.meetcam),
          iconBoxColor: meetCam,
          titleText: 'Meet the cdevs team',
          timeText: '05:00 PM - 05:30 PM',
          comment: 'We will discuss the new Tasks of the calendar pages',
          linkBox: true,
          linkText: 'Link to meeting',),

        TodoWidget(
          mainIcon: SvgPicture.asset(AppIcons.study),
          iconBoxColor: pink,
          titleText: "Study for the constitutional \njudiciary test",
          timeText: "06:00 PM - 08:30 PM",),

        TodoWidget(
          mainIcon: SvgPicture.asset(AppIcons.workcase),
          iconBoxColor: purpleIconColor,
          titleText: 'Create navigation bar ',
          timeText: '10:00 AM - 11:00 AM',
          comment: 'I will design a navigation bar for the application I am working on, and choose it with suitable colors ',
        ),
        TodoWidget(
          mainIcon: SvgPicture.asset(AppIcons.taskmark),
          iconBoxColor: textButtonColor,
          titleText: 'English Study',
          timeText: '08:00 AM - 08:30 AM',
          comment: 'I will sort the books, redecorate the room',
        ),

      ],
    );
  }
}
