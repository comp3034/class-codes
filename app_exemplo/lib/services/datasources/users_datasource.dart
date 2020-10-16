import 'package:app_exemplo/domain/models/models.dart';

abstract class UsersDatasource {
  Future<List<Friend>> fetch();
}
