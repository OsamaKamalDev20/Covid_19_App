import 'package:flutter/material.dart';

class Covid19WorldWideStates extends StatelessWidget {
  final Color containerColor;
  final Color textColor;
  final String title;
  final String value;
  final String image;
  const Covid19WorldWideStates({
    super.key,
    required this.containerColor,
    required this.textColor,
    required this.title,
    required this.value,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        height: 80,
        width: width / 2,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: textColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              // SizedBox(width: 10),
              Expanded(
                child: Image.asset(image),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
