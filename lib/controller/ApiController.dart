import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learning_getx/model/UserModels.dart';

class ApiController extends GetxController {
  final baseUrl = "https://api.github.com/users";
  RxList<UserModels> users = RxList<UserModels>();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUsers();
  }

  void getUsers() async {
    isLoading.value = true;
    var response = await http.get(Uri.parse(baseUrl));

    var data = jsonDecode(response.body);
    print(data);

    if (response.statusCode == 200) {
      for (var user in data) {
        users.add(UserModels.fromJson(user));
      }
      isLoading.value = false;
    } else {
      print("Something went wrong");
    }
  }
}
