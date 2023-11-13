import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/icons.dart';
import 'package:productive/core/widgets/todo_widget.dart';

class UpcomingPage extends StatelessWidget {
  const UpcomingPage({super.key});

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
      ],
    );
  }
}
