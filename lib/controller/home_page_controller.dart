import 'dart:convert';
import 'dart:math';

import 'package:azumo_cats/repository/cat_gif_repository.dart';
import 'package:get/get.dart';

import '../models/cat_gif_model.dart';
import '../repository/network.dart';

class HomepageController extends GetxController {
  String myCat = '';
  int totalCount = 0;
  var gifList = <Cats>[].obs;

  @override
  void onInit() async {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
    await findACat();
  }

  Future<Cats> findACat() async {
    Network network = Network(catUrl);
    var data = await network.getData();
    totalCount = (json.decode(data).length - 1);
    int rng = Random().nextInt(totalCount);
    myCat = (json.decode(data)[rng]['id']).toString();
    update();
    return Cats.fromJson(json.decode(data)[rng]);
  }
}
