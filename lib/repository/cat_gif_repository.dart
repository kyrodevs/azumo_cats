import 'package:azumo_cats/models/cat_gif_model.dart';
import 'package:azumo_cats/repository/network.dart';

const String catUrl = 'https://cataas.com/api/cats?tags=gif';

class CatRepository {
  Future<List<Cats>?> findAllCats() async {
    Network network = Network(catUrl);
    var data = await network.getData();
    return data;
  }
}
