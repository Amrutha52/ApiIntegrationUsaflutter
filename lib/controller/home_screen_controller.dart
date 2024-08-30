
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/home_screen_models/us_data_response_model.dart';

class HomeScreenController with ChangeNotifier
{

  UsDataResponseModel? dataResponseModel;

  Future<void> fetchData()
  async {


    final url = Uri.parse("https://datausa.io/api/data?drilldowns=Nation&measures=Population");
    var responseData = await  http.get(url); // bcoz get is a future function
    print('responseData' + responseData.statusCode.toString());
    print('responseBody' + responseData.body);
    if (responseData.statusCode == 200)
    {
      dataResponseModel = usDataResponseModelFromJson(responseData.body);
      print(dataResponseModel?.usDataList?[0].population.toString());

    }
    notifyListeners();
  }

}