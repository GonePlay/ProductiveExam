
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../assets/constants/colors.dart';
import '../../assets/constants/icons.dart';


class TodoWidget extends StatefulWidget {
  final SvgPicture mainIcon;
  final Color iconBoxColor;
  final String titleText;
  final String timeText;
  final String? comment;
  final bool? linkBox;
  final String? linkText;
   bool? isChecked;

     TodoWidget({
    super.key,
    required this.mainIcon,
    required this.iconBoxColor,
    required this.titleText,
    required this.timeText,
    this.linkBox = false,
    this.comment = '',
    this.linkText,
      this.isChecked = false,
  });

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Container(
          margin: const EdgeInsets.only(left: 16,bottom: 16,right: 16),
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 8,
            right: 8,
            left: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: conNot,
          ),
          child:
          Column(
            children: [

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: widget.iconBoxColor,
                    ),
                    child: widget.mainIcon,
                  ),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                             widget.titleText,
                             overflow: TextOverflow.visible,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,decoration: widget.isChecked == true ? TextDecoration.lineThrough : null),
                        ),

                      const SizedBox(height: 2,),
                    Text(
                          widget.timeText,
                          overflow: TextOverflow.visible,
                          style:  TextStyle(fontSize: 14, color: grey,decoration: widget.isChecked == true ? TextDecoration.lineThrough : null),
                        ),

                    ],
                  ),
                  const Spacer(),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.isChecked == false ? widget.isChecked = true : widget.isChecked = false;
                      });
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(right: 11),
                        child: SvgPicture.asset(
                            widget.isChecked == false ? AppIcons.unChecked : AppIcons.checked
                        ),
                    ),
                  ),

                ],
              ),


              widget.comment !='' ?
              Padding(
                padding: const EdgeInsets.only(right: 11,top: 8,),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.comment ?? "",
                        overflow: TextOverflow.visible,
                        style:  TextStyle(fontSize: 14, color: white,decoration: widget.isChecked == true ? TextDecoration.lineThrough : null),
                      ),
                    ),
                  ],
                ),
              ):const Gap(0),

              widget.linkBox == true ?
              Padding(
                padding: const EdgeInsets.only(top: 8,),
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.link),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(4),bottomRight: Radius.circular(4)),
                          color: secondaryColor
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                        child: Text(widget.linkText ?? '',style: const TextStyle(fontSize: 12)),
                      ),
                    )
                  ],
                ),
              ):const Gap(0),


            ],
          ),

        ),


      ],
    );
  }
}
