import 'package:coffie_ecom/domain/models/coffee_info.dart';
import 'package:dartz/dartz.dart';

abstract class IHomeRepo {
  Future<Either<String, List<CoffeeModel>>> getCoffeesInfo();
}
