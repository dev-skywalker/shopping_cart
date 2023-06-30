import 'package:dio/dio.dart';
import 'package:product/data/vos/product_vo/product_vo.dart';
import 'package:product/network/data_agent/product_data_agent.dart';

import '../api/product_api.dart';

class ProductDataAgentImpl extends ProductDataAgent{
  late ProductAPI _productAPI;

  ProductDataAgentImpl._(){
    _productAPI = ProductAPI(Dio());
  }

  static final ProductDataAgentImpl _singleton =  ProductDataAgentImpl._();

  factory ProductDataAgentImpl(){
    return _singleton;
  }

  @override
  Future<List<ProductVO>?> getProduct() {
   return _productAPI.getProductResponse();
  }

  @override
  Future<ProductVO?> getOneProduct(int id) {
    return _productAPI
        .getSingleProductResponse(id);
  }

}
