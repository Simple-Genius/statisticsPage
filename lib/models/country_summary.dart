class CountrySummaryModel{
  final String country;
  final int death;
  final int recovered;
  final int active;
  final int confirmed;
  final DateTime date;

  CountrySummaryModel(this.country, this.death, this.recovered, this.active, this.confirmed, this.date);

  factory CountrySummaryModel.fromJson(Map<String,dynamic> json){
    return CountrySummaryModel(json["Country"], json["Confirmed"], json["Deaths"], json["Recovered"], json["Active"], DateTime.parse(json["Date"]));
  }
}