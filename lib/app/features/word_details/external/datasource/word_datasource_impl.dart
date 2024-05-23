import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/domain/errors/api_exception.dart';
import '../../../../core/infra/services/api/api_service.dart';
import '../../domain/errors/home_exception.dart';
import '../../infra/datasources/words_datasource.dart';

@Injectable()
class WordDatasourceImpl implements WordDatasource {
  final ApiService apiService;

  WordDatasourceImpl(this.apiService);

  @override
  Future getWord(String word) async {
    final httpParams = HttpParams(
      uri: '/entries/en/$word',
      httpMethod: HttpMethod.GET,
    );
    try {
      final response = await apiService.requestApi(params: httpParams);
      return response.data;
    } on ApiException catch (exception, stacktrace) {
      var message = exception.message;

      throw WordDatasourceException(
        'Failed to get word #$message',
        stackTrace: stacktrace,
      );
    }
  }
}
