import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:viber/secrets.dart';

class OpenAIoperations {
  Future<String> Uploadimage(url) async {
    try {
      final res = await http.post(
          Uri.parse("https://api.openai.com/v1/chat/completions"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $apikey",
          },
          body: jsonEncode({
            "model": "gpt-4-vision-preview",
            "messages": [
              {
                "role": "user",
                "content": [
                  {"type": "text",
                   "text": "What’s in this image?"},
                  {
                    "type": "image_url",
                    "image_url": {
                      "url":
                          "https://cdn.pixabay.com/photo/2019/09/28/05/10/sunset-4509878_640.jpg"
                    }
                  }
                ]
              }
            ],
            "max_tokens": 300
          }));

          print(res.body);

          return 'ai';
    } catch (e) {
       print(e.toString());
      return 'not';
      
    }
  }
}
