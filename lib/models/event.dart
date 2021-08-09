class Event {
  String id;
  int inscriptions;
  String title;
  String description;
  String image;

  Event({
    required this.id,
    required this.inscriptions,
    required this.title,
    required this.description,
    required this.image
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['titulo'],
      description: json['descricao'],
      image: json['imagem'],
      inscriptions: json['inscritos']
    );
  }
}