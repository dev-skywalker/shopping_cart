import 'package:flutter/material.dart';
import 'package:product/constant/dimens.dart';
import 'package:product/utils/extensions.dart';
import 'package:product/utils/random_colors.dart';
import 'package:product/widgets/easy_text_widget.dart';

import '../../data/vos/product_vo/product_vo.dart';

class ProductItemView extends StatelessWidget {
  const ProductItemView({super.key, required this.onTap, required this.productVO});

  final Function onTap;
  final ProductVO? productVO;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        margin: const EdgeInsets.only(bottom: kSP10x),
        child: ListTile(
          leading: CircleAvatar(
            radius: kCircleAvatarRadius,
            backgroundColor: RandomColor.getRandomColor(),
            child: EasyTextWidget(
              fontWeight: FontWeight.w600,
              text: (productVO?.title??'').getPrefix(),
            ),
          ),
          title: EasyTextWidget(
            text: (productVO?.title??''),
            fontWeight: FontWeight.w700,
            fontSize: kFontSize18x,
          ),
          subtitle: EasyTextWidget(
            text: (productVO?.description??''),
            fontWeight: FontWeight.w300,
            maxLine: 3,
          ),
        ),
      ),
    );
  }
}
