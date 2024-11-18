import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

    void _copyToClipboard(String text){
        Clipboard.setData(ClipboardData(text: text));
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('URL copied to clipboard!')),
        );
    }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final originalUrl = args?['originalUrl'] ?? '';
    final shortenedUrl = args?['shortenedUrl'] ?? '';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Url Shortener',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2FD1CD),
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'images/img.jpg',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: [
                    const Text(
                        'Shortened URL',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2FD1CD),
                        ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Expanded(
                            child: Text(
                            shortenedUrl,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black87
                            ),
                            textAlign: TextAlign.center,
                        )),
                        IconButton(
                        icon: const Icon(
                            Icons.copy,
                            color: Color(0xFF2FD1CD),
                        ),    
                        onPressed: () => _copyToClipboard(shortenedUrl), 
                        tooltip: 'Copy to clipboard' ,)
                    ],),
                    const Divider(height: 24),
                    const Text(
                        'Original URL',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2FD1CD),
                        ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                        originalUrl,
                        style: const TextStyle(fontSize: 14, color: Colors.black87),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                    ),
                ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2FD1CD),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                    ),
                ),
                child: const Text(
                    'Shorten Another URL',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                    ),
                )
              )
              
            ]
          ),
        ),
      ),
    );
  }
}