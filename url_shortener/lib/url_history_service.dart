import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:url_shortener/url_history.dart';

class UrlHistoryService {
  static const String _historyKey = 'url_history';

  Future<void> addToHistory(UrlHistoryItem item) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Retrieve existing history
    List<String> historyJson = prefs.getStringList(_historyKey) ?? [];
    
    // Add new item
    historyJson.insert(0, json.encode(item.toJson()));
    
    // Limit history to last 20 entries
    if (historyJson.length > 20) {
      historyJson = historyJson.sublist(0, 20);
    }
    
    // Save updated history
    await prefs.setStringList(_historyKey, historyJson);
  }

  Future<List<UrlHistoryItem>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    
    List<String> historyJson = prefs.getStringList(_historyKey) ?? [];
    
    return historyJson.map((item) => 
      UrlHistoryItem.fromJson(json.decode(item))
    ).toList();
  }
}