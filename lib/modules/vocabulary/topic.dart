import 'package:flutter/material.dart';

class VocabTopic {
  final String name;
  final String url;
  final IconData icon;
  final Color color;
  final Color bgColor;

  VocabTopic({
    required this.name,
    required this.url,
    required this.icon,
    required this.color,
    required this.bgColor,
  });

  // Constructor từ JSON (nếu cần lưu vào database)
  factory VocabTopic.fromJson(Map<String, dynamic> json) {
    return VocabTopic(
      name: json['name'] as String,
      url: json['url'] as String,
      icon: IconData(json['iconCode'] as int, fontFamily: 'MaterialIcons'),
      color: Color(json['color'] as int),
      bgColor: Color(json['bgColor'] as int),
    );
  }

  // Convert sang JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
      'iconCode': icon.codePoint,
      'color': color.value,
      'bgColor': bgColor.value,
    };
  }

  // Copy with method
  VocabTopic copyWith({
    String? name,
    String? url,
    IconData? icon,
    Color? color,
    Color? bgColor,
  }) {
    return VocabTopic(
      name: name ?? this.name,
      url: url ?? this.url,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      bgColor: bgColor ?? this.bgColor,
    );
  }

  @override
  String toString() {
    return 'VocabTopic(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is VocabTopic && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
