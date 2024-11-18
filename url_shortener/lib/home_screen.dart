import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_shortener/url_shortener_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _urlcontroller = TextEditingController();
  final UrlShortenerService _urlService = UrlShortenerService();
  bool _isLoading = false;

  final FocusNode _focusNode = FocusNode();

  void _handleShortenPress() async {
    if(_urlcontroller.text.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    final shortenedUrl = await _urlService.shortenUrl(_urlcontroller.text);

    setState(() {
      _isLoading = false;
    });

    if(shortenedUrl != null){
      if(mounted){
        Navigator.pushNamed(context,'/results', arguments: {
          'originalUrl': _urlcontroller.text,
          'shortenedUrl': shortenedUrl,
        });
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to shorten URL. Please try again.'))
        );
      }
    }
  }


  @override
  void dispose(){
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      body: SafeArea(
        child: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade900,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextSelectionTheme(
                    data: const TextSelectionThemeData(
                            selectionColor: Colors.blue,
                            cursorColor: Colors.blue,
                            
                          ),
                          child: TextField(
                    controller: _urlcontroller,
                    focusNode: _focusNode,
                    enableInteractiveSelection: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter link to shorten',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      )
                    ),
                  ),

                  ),
                  
                ),
                
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _isLoading ? null : _handleShortenPress,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2ACFCF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                  ),
                  child: _isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Shorten it!',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    )
              ],
            ),
          )
        ],
      ),)
        )
        )
    );
  }
}