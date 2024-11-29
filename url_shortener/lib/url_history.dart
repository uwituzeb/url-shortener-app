class UrlHistoryItem {
  final String originalUrl;
  final String shortenedUrl;
  final DateTime timestamp;

  UrlHistoryItem({
    required this.originalUrl, 
    required this.shortenedUrl, 
    required this.timestamp
  });

  // Optional: Convert to and from JSON for potential local storage
  Map<String, dynamic> toJson() => {
    'originalUrl': originalUrl,
    'shortenedUrl': shortenedUrl,
    'timestamp': timestamp.toIso8601String(),
  };

  factory UrlHistoryItem.fromJson(Map<String, dynamic> json) => UrlHistoryItem(
    originalUrl: json['originalUrl'],
    shortenedUrl: json['shortenedUrl'],
    timestamp: DateTime.parse(json['timestamp']),
  );
}