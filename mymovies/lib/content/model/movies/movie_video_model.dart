class MovieVideosModel {
  final int id;
  final List<VideoResult> results;

  MovieVideosModel({
    required this.id,
    required this.results,
  });

  factory MovieVideosModel.fromJson(Map<String, dynamic> json) {
    return MovieVideosModel(
      id: json['id'] ?? 0,
      results: (json['results'] as List<dynamic>? ?? [])
          .map((e) => VideoResult.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'results': results.map((e) => e.toJson()).toList(),
    };
  }
}

class VideoResult {
  final String iso6391;
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final DateTime publishedAt;
  final String id;

  VideoResult({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory VideoResult.fromJson(Map<String, dynamic> json) {
    return VideoResult(
      iso6391: json['iso_639_1'] ?? '',
      iso31661: json['iso_3166_1'] ?? '',
      name: json['name'] ?? '',
      key: json['key'] ?? '',
      site: json['site'] ?? '',
      size: json['size'] ?? 0,
      type: json['type'] ?? '',
      official: json['official'] ?? false,
      publishedAt: DateTime.tryParse(json['published_at'] ?? '') ?? DateTime.now(),
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iso_639_1': iso6391,
      'iso_3166_1': iso31661,
      'name': name,
      'key': key,
      'site': site,
      'size': size,
      'type': type,
      'official': official,
      'published_at': publishedAt.toIso8601String(),
      'id': id,
    };
  }
}
