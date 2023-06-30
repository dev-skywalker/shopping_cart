import 'package:flutter/material.dart';
import 'package:product/constant/dimens.dart';
import 'package:product/data/model/product_model.dart';
import 'package:product/data/model/product_model_impl.dart';
import 'package:product/data/shopping_cart/shopping_cart.dart';
import 'package:product/data/vos/product_vo/product_vo.dart';
import 'package:product/item_views/home_page_item_view/home_page_item_view.dart';
import 'package:product/pages/details_page.dart';
import 'package:product/pages/shopping_cart_page.dart';
import 'package:product/widgets/easy_text_widget.dart';
// import 'package:product/pages/details_page.dart';
// import 'package:product/utils/extensions.dart';

final ProductModel _productModel = ProductModelImpl();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  void initState() {
    updateCartItemCount();
    super.initState();
  }

  void updateCartItemCount() {
    setState(() {
      count = ShoppingCart.getCartItems().length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Products"),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShoppingCartPage(),
                    ),
                  ).then((_) {
                    updateCartItemCount();
                  });
                },
              ),
              count > 0
                  ? Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          count.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
      body: FutureBuilder<List<ProductVO>?>(
        future: _productModel.getProduct(),
        builder: (context,snapShot){
          if(snapShot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          if(snapShot.hasError){
            return EasyTextWidget(text: 'Error Occur : ${snapShot.error}');
          }
          final result = snapShot.data;
          //print(result);
          //return Text("Hey");
          return ListView.separated(
              
              itemCount: result?.length??0,
              separatorBuilder: (context,_)=>const SizedBox(height: kSP10x,),
              itemBuilder: (context,index)=>ProductItemView(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>DetailsPage(
                            id: result?[index].id??1,
                            title: result?[index].title ?? "",
                            callback: (){
                              setState(() {
                                ShoppingCart.addToCart(result![index]);
                                updateCartItemCount();
                              });
                              
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Product added to cart'),
                                ),
                              );
                            },
                        )
                    )
                    );
                  },
                  productVO: result?[index]
              ),
              );
        },
        
      )
    );
  }
}
