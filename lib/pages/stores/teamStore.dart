import 'package:api_app/http/exceptions.dart';
import 'package:api_app/models/TeamModel.dart';
import 'package:api_app/repositories/TeamRepository.dart';
import 'package:flutter/material.dart';

class TeamStore {
  final ITeamRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<List<TeamModel>> state = ValueNotifier<List<TeamModel>>([]);
  final ValueNotifier<String> error = ValueNotifier<String>('');

  TeamStore({required this.repository});

  getTeams() async {
    isLoading.value = true;

    try {
      final result = await repository.getTeams();
      state.value = result;
    } on NotFoundException catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
