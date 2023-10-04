import 'package:kendamanomics_mobile/mixins/logger_mixin.dart';
import 'package:kendamanomics_mobile/models/player_points.dart';
import 'package:kendamanomics_mobile/services/auth_service.dart';
import 'package:kiwi/kiwi.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LeaderboardsService with LoggerMixin {
  final _supabase = Supabase.instance.client;
  final _authService = KiwiContainer().resolve<AuthService>;

  Future<List<PlayerPoints>> fetchLeaderboardKendamanomicsPoints() async {
    try {
      final response = await _supabase.rpc('get_leaderboard_kendamanomics_points');
      if (response != null) {
        final data = response as List<dynamic>;
        final leaderboardData = List<PlayerPoints>.from(data.map((points) {
          return PlayerPoints.fromJson(json: points as Map<String, dynamic>);
        }));
        return leaderboardData;
      } else {
        return [];
      }
    } catch (e) {
      logE('Error fetching leaderboard data: $e');
      return [];
    }
  }

  Future<List<PlayerPoints>> fetchLeaderboardCompetitionPoints() async {
    try {
      final response = await _supabase.rpc('get_leaderboard_competition_points');
      if (response != null) {
        final data = response as List<dynamic>;
        final leaderboardData = List<PlayerPoints>.from(data.map((points) {
          return PlayerPoints.fromJson(json: points as Map<String, dynamic>);
        }));
        return leaderboardData;
      }
      return [];
    } catch (e) {
      logE('Error fetching leaderboard data: $e');
      rethrow;
    }
  }

  Future<List<PlayerPoints>> fetchOverallPoints() async {
    try {
      final response = await _supabase.rpc('get_leaderboard_overall_points');
      if (response != null) {
        final data = response as List<dynamic>;
        print(data);
        final leaderboardData = List<PlayerPoints>.from(data.map((points) {
          return PlayerPoints.fromJson(json: points as Map<String, dynamic>);
        }));
        return leaderboardData;
      }
      return [];
    } catch (e) {
      logE('Error fetching leaderboard data: $e');
      rethrow;
    }
  }

  Future<List<PlayerPoints>> fetchMyKendamaStats(String id) async {
    try {
      final response = await _supabase.rpc('get_leaderboard_player_info', params: {'leaderboard_player_id': id});
      if (response != null) {
        final data = response as List<dynamic>;
        print(data);
        final leaderboardData = List<PlayerPoints>.from(data.map((points) {
          return PlayerPoints.fromJson(json: points as Map<String, dynamic>);
        }));
        return leaderboardData;
      }
      return [];
    } catch (e) {
      logE('Error fetching leaderboard data: $e');
      rethrow;
    }
  }

  @override
  String get className => 'LeaderboarsdServices';
}
