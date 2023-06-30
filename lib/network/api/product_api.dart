import 'package:dio/dio.dart';
import 'package:product/constant/api_constant.dart';
import 'package:product/data/vos/product_vo/product_vo.dart';
import 'package:retrofit/http.dart';

part 'product_api.g.dart';

@RestApi(baseUrl: kBaseURL)
abstract class ProductAPI{
  factory ProductAPI(Dio dio){
    return _ProductAPI(dio);
  }
  @GET(kGetAllProduct)
  Future<List<ProductVO>> getProductResponse();

  @GET(kGetOneProduct)
  Future<ProductVO> getSingleProductResponse(
      @Path(kPathParameterSlugName)
      int id
      );
}