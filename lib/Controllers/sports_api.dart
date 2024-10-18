import 'package:flame/Controllers/Interfaces/sportapi_interface.dart';
import 'package:flame/Services/sports_services.dart';

class SportsApi implements SportsApiInterface{
  SportsService sportsService=SportsService();
  @override
  void competionLogo() {

    sportsService.fetchLogo();
  }

  @override
  void fetchFixtures() {
    // TODO: implement fetchFixtures

  }

  @override
  void fetchGameStatistics() {
    // TODO: implement fetchGameStatistics
  }

  @override
  void fetchInjuries() {
    // TODO: implement fetchInjuries
  }

  @override
  void fetchLeage() {
    // TODO: implement fetchLeage
  }

  @override
  void fetchLineUp() {
    // TODO: implement fetchLineUp
  }

  @override
  void fetchLogo() {
    // TODO: implement fetchLogo
  }

  @override
  void fetchPlayerStatistics() {
    // TODO: implement fetchPlayerStatistics
  }

  @override
  void fetchPredictions() {
    // TODO: implement fetchPredictions
  }

  @override
  void fetchTeamStatistics() {
    // TODO: implement fetchTeamStatistics
  }

  @override
  void fetchTopAssits() {
    // TODO: implement fetchTopAssits
  }

  @override
  void fetchTopScorer() {
    // TODO: implement fetchTopScorer
  }

  @override
  void getStandings() {
    // TODO: implement getStandings
  }

}