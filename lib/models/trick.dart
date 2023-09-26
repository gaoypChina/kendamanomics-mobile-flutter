class Trick {
  final String? id;
  final String? name;
  final String? trickTutorialUrl;
  final String? tamaID;

  const Trick({this.id, this.name, this.trickTutorialUrl, this.tamaID});

  factory Trick.fromJson({required Map<String, dynamic> json, String? tamaID}) {
    return Trick(
      id: json['trick_id'],
      name: json['trick_name'],
      trickTutorialUrl: json['trick_url'],
      tamaID: tamaID,
    );
  }
}
