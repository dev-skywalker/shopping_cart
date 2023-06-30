import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:product/constant/colors.dart';
import 'package:product/constant/dimens.dart';
import 'package:product/constant/strings.dart';
import 'package:product/widgets/easy_text_widget.dart';
import 'package:product/widgets/loading_widget.dart';

import '../../data/vos/product_vo/product_vo.dart';

class ProductDetailsItemView extends StatelessWidget {
  const ProductDetailsItemView({super.key,required this.productVO});
  final ProductVO? productVO;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(kSP10x),
      children:  [
        ProductImageView(
          productImage: productVO?.image??"https://www.bellobello.my/wp-content/uploads/2022/09/homegrown-food-product-brands-malaysia-1024x681.jpg",
        ),
        const SizedBox(
          height: kSP10x,
        ),
        ProductPrice(
          price: productVO?.price??0,
        ),
        const SizedBox(
          height: kSP20x,
        ),
        ProductDescriptionView(
          description: productVO?.description??"",
        ),
        const SizedBox(
          height: kSP20x,
        ),
        // ProductCreatorView(
        //   creatorName: productVO?.createdBy?.name??'',
        // ),
        const SizedBox(
          height: kSP60x,
        ),
      ],
    );
  }
}

class ProductCreatorView extends StatelessWidget {
  const ProductCreatorView({super.key, required this.creatorName});
  final String creatorName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const EasyTextWidget(
          text: kCreatorText,
          fontWeight: FontWeight.w600,
          fontSize: kFontSize18x,
        ),
        const SizedBox(
          height: kSP10x,
        ),
        EasyTextWidget(text: creatorName)
      ],
    );
  }
}

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key, required this.price});
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.monetization_on_outlined,
          size: 30,
        ),
        const SizedBox(
          width: kSP10x,
        ),
        EasyTextWidget(text: '$price\$'),
      ],
    );
  }
}

class ProductDescriptionView extends StatelessWidget {
  const ProductDescriptionView({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const EasyTextWidget(
          text: kDescriptionText,
          fontWeight: FontWeight.w600,
          fontSize: kFontSize18x,
        ),
        const SizedBox(
          height: kSP10x,
        ),
        EasyTextWidget(
            text:description,
        )
    ],
    );
  }
}

class ProductImageView extends StatelessWidget {
  const ProductImageView({
    super.key,
    required this.productImage,
  });
  final String productImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kDetailsPageImageHeight,
      child: CachedNetworkImage(
        imageUrl:productImage
        ,
        placeholder: (context, url) => const LoadingWidget(),
        errorWidget: (context, url, error) =>
        const Center(child: Icon(Icons.error)),
      ),
    );
  }
}

class BuyButtonItemView extends StatelessWidget {
  const BuyButtonItemView({super.key, required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP10x, vertical: kSP10x),
      child: MaterialButton(
        height: 50,
        minWidth: double.infinity,
        color: kPrimaryColor,
        onPressed: () => onPressed(),
        child: const EasyTextWidget(
          text: kBuyText,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
