import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'Icons',
          style: CustomLabels.h1,
        ),
        const SizedBox(height: 10),
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          children: [
            WhiteCard(
              width: 170,
              title: 'ac_unit_outlined',
              child: Center(
                child: Icon(Icons.ac_unit_outlined),
              ),
            ),
            WhiteCard(
              width: 170,
              title: 'access_alarm_outlined',
              child: Center(
                child: Icon(Icons.access_alarm_outlined),
              ),
            ),
            WhiteCard(
              width: 170,
              title: 'access_time_outlined',
              child: Center(
                child: Icon(Icons.access_time_outlined),
              ),
            ),
            WhiteCard(
              width: 170,
              title: 'share_arrival_time_outlined',
              child: Center(
                child: Icon(Icons.share_arrival_time_outlined),
              ),
            ),
            WhiteCard(
              width: 170,
              title: 'people_alt_outlined',
              child: Center(
                child: Icon(Icons.people_alt_outlined),
              ),
            ),
            WhiteCard(
              width: 170,
              title: 'trip_origin_outlined',
              child: Center(
                child: Icon(Icons.trip_origin_outlined),
              ),
            ),
            WhiteCard(
              width: 170,
              title: 'align_horizontal_center_outlined',
              child: Center(
                child: Icon(Icons.align_horizontal_center_outlined),
              ),
            ),
          ],
        )
      ],
    );
  }
}
