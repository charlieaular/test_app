import 'package:dio/dio.dart';

class ApiProvider {
  final Dio dio = Dio();

  //https://places.ls.hereapi.com/places/v1/autosuggest?at=40.74917,-73.98529&q=chrysler&apiKey=XugrxwB3xjcfcGbcL7O38inx8Dm01FEk0Zk_zstq9Ik
  //https://places.ls.hereapi.com/places/v1/autosuggest?at=4.7014%2C-74.0581&q=restaurants+in+colombia&cs=places&addressFilter=country%3Dcolombia&recd=true&Accept-Language=es-ES%2Ces%3Bq%3D0.9&app_id=j34iQXfEzmJzbjr7RShi&app_code=To6EH2njs7mESwN8M0WmOw

  //https://places.ls.hereapi.com/places/v1/autosuggest?at=4.7014%2C-74.0581&q=mcdonald&cs=places&addressFilter=country%3Dcolombia&recd=true&Accept-Language=es-ES%2Ces%3Bq%3D0.9&app_id=j34iQXfEzmJzbjr7RShi&app_code=To6EH2njs7mESwN8M0WmOw

  //https://places.cit.api.here.com/places/v1/discover/around?in=52.5303581%2C13.3848515%3Br%3D10000&cat=eat-drink&size=10000&app_id=j34iQXfEzmJzbjr7RShi&app_code=To6EH2njs7mESwN8M0WmOw

  //https://places.ls.hereapi.com/places/v1/autosuggest?at=7.0168%2C-73.1004&q=el+sabor+de+mi+hogar&result_types=place%2Ccategory&addressFilter=city%3Dbucaramanga&Accept-Language=es-ES%2Ces%3Bq%3D0.9&app_id=j34iQXfEzmJzbjr7RShi&app_code=To6EH2njs7mESwN8M0WmOw
}
