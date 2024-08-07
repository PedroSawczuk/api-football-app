import 'dart:convert';
import 'package:api_app/http/exceptions.dart';
import 'package:api_app/http/httpClient.dart';
import 'package:api_app/models/TeamModel.dart';

abstract class ITeamRepository {
  Future<List<TeamModel>> getTeams();
}

class TeamRepository implements ITeamRepository {
  final IHttpClient client;

  TeamRepository({required this.client});

  @override
  Future<List<TeamModel>> getTeams() async {
    // Adicione parâmetros obrigatórios, como league e season
    final queryParameters = {
      'league': '39', // ID da liga (exemplo: Premier League)
      'season': '2024', // Temporada (exemplo: 2021)
    };

    final uri = Uri.https(
      'v3.football.api-sports.io',
      '/teams',
      queryParameters,
    );

    final response = await client.get(
      url: uri.toString(),
    );

    if (response.statusCode == 200) {
      final List<TeamModel> teams = [];
      final body = jsonDecode(response.body);

      print(body); 

      if (body['response'] != null) {
        body['response'].forEach((item) {
          final TeamModel team = TeamModel.fromMap(item['team']);
          teams.add(team);
        });
      }
      return teams;
    } else if (response.statusCode == 404) {
      throw NotFoundException('A URL não é válida');
    } else {
      throw Exception('Não foi possível carregar os times');
    }
  }
}
