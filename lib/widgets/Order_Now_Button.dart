import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class OrderNowButton extends StatelessWidget {
  final Function() onTap;
  OrderNowButton({required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/bag.svg',
                width: 40,
                color: Theme.of(context).primaryColor,
                cacheColorFilter: true,
              ),
              const SizedBox(width: 12),
              Text(
                'Order Now',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  //fontFamily: 'Gilroy'
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
