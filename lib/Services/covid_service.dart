import 'package:http/http.dart' as http;
import 'package:statistics/models/country_summary.dart';
import 'dart:convert';
import '../models/global_summary.dart';

class CovidService{

  Future<GlobalSummaryModel> getGlobalSummary() async{
    final data = await http.Client().get(Uri.parse("https://api.covid19api.com/summary"));

    if(data.statusCode != 200)
      throw Exception();

    GlobalSummaryModel summary = new GlobalSummaryModel.fromJson(json.decode(data.body));

    return summary;
  }
  Future<List<CountrySummaryModel>> getCountrySummary(String slug) async{
    final data = await http.Client().get(Uri.parse("https://api.covid19api.com/total/dayone/country/" + slug));

    if(data.statusCode != 200)
      throw Exception();

    List<CountrySummaryModel> summaryList = (json.decode(data.body) as List).map((item) => new CountrySummaryModel.fromJson(item)).toList();

    return summaryList;
  }
}


