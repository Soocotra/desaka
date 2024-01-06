import 'package:flutter/material.dart';

class DynamicCalendarIcon extends StatelessWidget {
  final String month;
  final int date;
  final double height;
  final double width;

  const DynamicCalendarIcon({
    super.key,
    required this.month,
    required this.date,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        child: Column(
          children: [
            Container(
              height: height / 3,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(
                child: Text(
                  month,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(child: SizedBox(child: Center(child: Text("$date"))))
          ],
        ),
      ),
    );
  }
}
