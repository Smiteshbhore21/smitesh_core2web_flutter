class PlayerData {
  int jerseyNo;
  String name;
  String url;
  String teamName;
  PlayerData(
      {required this.url,
      required this.name,
      required this.jerseyNo,
      required this.teamName});

  Map<String, dynamic> playerMap() {
    return {
      "playerPic": url,
      "playerName": name,
      "playerJerseyNo": jerseyNo,
      "playerTeamName": teamName,
    };
  }
}
