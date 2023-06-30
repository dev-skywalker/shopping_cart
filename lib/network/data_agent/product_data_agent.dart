import '../../data/vos/product_vo/product_vo.dart';

abstract class ProductDataAgent{
  Future<List<ProductVO>?>getProduct();

  Future<ProductVO?>getOneProduct(int id);
}