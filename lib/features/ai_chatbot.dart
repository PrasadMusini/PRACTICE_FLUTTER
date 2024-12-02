import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uuid/uuid.dart';

class GeminiChatbot extends StatefulWidget {
  const GeminiChatbot({super.key});

  @override
  State<GeminiChatbot> createState() => _GeminiChatbotState();
}

class _GeminiChatbotState extends State<GeminiChatbot> {
  final List<types.Message> _messages = [];
  final types.User _currentUser = types.User(id: const Uuid().v4());
  final types.User _geminiBot = const types.User(
    id: 'gemini-bot',
    firstName: 'Gemini Bot',
  );

  final Color themeColor = const Color(0xFF4285F4);

  final String apiKey = 'AIzaSyBitmhblJYHyHk_IEGZJHyQq8h-jTkBCE0';
  final String geminiFlashApi =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=';
  final gemini1dot5ProApi =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro:generateContent?key=';

  types.TextMessage? _typingMessage;

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _currentUser,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    setState(() {
      _messages.insert(0, textMessage);
    });

    _showTypingIndicator(); // Show typing indicator
    _getGeminiResponse(message.text);
  }

  void _showTypingIndicator() {
    // Add a "Gemini Bot is typing..." placeholder
    _typingMessage = types.TextMessage(
      author: _geminiBot,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: 'Generating response...',
    );

    setState(() {
      _messages.insert(0, _typingMessage!);
    });
  }

  Future<void> _getGeminiResponse(String userMessage) async {
    try {
      final requestBody = jsonEncode({
        "contents": [
          {
            "role": "user",
            "parts": [
              {"text": userMessage}
            ]
          }
        ],
        "generationConfig": {
          "temperature": 1.5,
          "topK": 40,
          "topP": 0.95,
          "maxOutputTokens": 8000,
          "responseMimeType": "text/plain"
        }
      });

      final response = await http.post(
        Uri.parse('$gemini1dot5ProApi$apiKey'),
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final String botResponse = data['candidates'][0]['content']['parts'][0]
                ['text'] ??
            "I'm sorry, I couldn't understand that.";

        final botMessage = types.TextMessage(
          author: _geminiBot,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: const Uuid().v4(),
          text: botResponse,
        );

        setState(() {
          // Replace the typing indicator with the actual response
          _messages.remove(_typingMessage);
          _messages.insert(0, botMessage);
        });
      } else {
        _showErrorMessage('Failed to get a valid response');
      }
    } catch (e) {
      _showErrorMessage('Error: $e');
    }
  }

  void _showErrorMessage(String errorMessage) {
    final error = types.TextMessage(
      author: _geminiBot,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: errorMessage,
    );

    setState(() {
      _messages.remove(_typingMessage);
      _messages.insert(0, error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with Gemini AI'),
        backgroundColor: themeColor,
        // backgroundColor: Colors.teal,
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _currentUser,
        theme: DefaultChatTheme(
          inputBackgroundColor: themeColor,
          primaryColor: themeColor,
          inputTextColor: Colors.white,
          inputTextCursorColor: Colors.white,
        ),
      ),
    );
  }
}
