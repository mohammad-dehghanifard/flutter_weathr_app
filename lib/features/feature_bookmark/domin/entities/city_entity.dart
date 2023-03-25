
import 'package:floor/floor.dart';

@entity
class CityEntity{

@PrimaryKey(autoGenerate: true)
int? id;

final String cityName;

CityEntity(this.cityName);
}