// import 'package:flutter/material.dart';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   // Cấu hình User
//   final ChatUser _currentUser = ChatUser(id: '1', firstName: 'Huy');
//   final ChatUser _geminiUser = ChatUser(
//     id: '2',
//     firstName: 'Gemini',
//     profileImage:
//         'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/google-gemini-icon.png',
//   );

//   List<ChatMessage> _messages = [];
//   late final GenerativeModel _model;
//   bool _isTyping = false;

//   @override
//   void initState() {
//     super.initState();
//     // --- QUAN TRỌNG: ĐIỀN API KEY CỦA BẠN VÀO ĐÂY ---
//     _model = GenerativeModel(
//       model: 'gemini-2.5-flash',
//       apiKey: 'AIzaSyBe3UFbmsnV7I759FMRBjiVPLnD2ysHZiE',
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Gemini Chatbot'),
//         backgroundColor: Colors.blueAccent,
//         foregroundColor: Colors.white,
//       ),
//       body: DashChat(
//         currentUser: _currentUser,
//         typingUsers: _isTyping ? [_geminiUser] : [],
//         onSend: _sendMessage, // Gọi hàm gửi tin nhắn
//         messages: _messages,
//       ),
//     );
//   }

//   Future<void> _sendMessage(ChatMessage chatMessage) async {
//     setState(() {
//       _messages = [chatMessage, ..._messages];
//       _isTyping = true;
//     });

//     try {
//       final content = [Content.text(chatMessage.text)];
//       final response = await _model.generateContent(content);

//       ChatMessage geminiMessage = ChatMessage(
//         user: _geminiUser,
//         createdAt: DateTime.now(),
//         text: response.text ?? "AI không phản hồi.",
//       );

//       setState(() {
//         _messages = [geminiMessage, ..._messages];
//       });
//     } catch (e) {
//       debugPrint(
//         "Lỗi: $e",
//       ); // Dùng debugPrint thay cho print để tốt hơn cho Android/iOS
//       setState(() {
//         _messages = [
//           ChatMessage(
//             user: _geminiUser,
//             createdAt: DateTime.now(),
//             text: "Lỗi kết nối: $e",
//           ),
//           ..._messages,
//         ];
//       });
//     } finally {
//       setState(() {
//         _isTyping = false;
//       });
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Cấu hình User
  final ChatUser _currentUser = ChatUser(id: '1', firstName: 'Huy');
  final ChatUser _geminiUser = ChatUser(
    id: '2',
    firstName: 'Trợ lý AI',
    profileImage:
        'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/google-gemini-icon.png',
  );

  List<ChatMessage> _messages = [];
  late final GenerativeModel _model;
  late final ChatSession _chat;
  bool _isTyping = false;

  // System prompt để định hướng AI
  final String systemPrompt = '''
Bạn là trợ lý AI thông minh hỗ trợ học tiếng Anh. Nhiệm vụ của bạn:
- Tư vấn phương pháp học phù hợp với trình độ người dùng
- Giải đáp ngữ pháp, từ vựng
- Đề xuất bài học, lộ trình học
- Động viên và khuyến khích người học
- Trả lời ngắn gọn, dễ hiểu, thân thiện
- Nếu người dùng hỏi bằng tiếng Việt, trả lời bằng tiếng Việt

Hãy luôn:
✓ Thân thiện và nhiệt tình
✓ Giải thích đơn giản, dễ hiểu
✓ Đưa ra ví dụ cụ thể
✓ Khuyến khích người học
✓ Cá nhân hóa lời khuyên theo trình độ

Tránh:
✗ Trả lời quá dài dòng
✗ Sử dụng thuật ngữ phức tạp
✗ Phê phán hay chỉ trích người học
''';

  @override
  void initState() {
    super.initState();
    // Khởi tạo model với system instruction
    _model = GenerativeModel(
      model: 'gemini-2.5-flash',
      apiKey: 'AIzaSyBe3UFbmsnV7I759FMRBjiVPLnD2ysHZiE',
      systemInstruction: Content.system(systemPrompt),
    );

    // Khởi tạo chat session để duy trì context
    _chat = _model.startChat();

    // Gửi tin nhắn chào mừng
    _addWelcomeMessage();
  }

  // Thêm tin nhắn chào mừng
  void _addWelcomeMessage() {
    final welcomeMessage = ChatMessage(
      user: _geminiUser,
      createdAt: DateTime.now(),
      text: '''Xin chào! 👋 Tôi là trợ lý AI giúp bạn học tiếng Anh. 

Tôi có thể giúp bạn:
📚 Tư vấn lộ trình học phù hợp
💬 Giải thích ngữ pháp, từ vựng  
✍️ Đề xuất bài tập và phương pháp học
🎯 Trả lời mọi thắc mắc về tiếng Anh

Bạn muốn bắt đầu từ đâu? 😊''',
    );

    setState(() {
      _messages = [welcomeMessage];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trợ lý học tiếng Anh'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          // Nút xóa lịch sử chat
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Làm mới cuộc hội thoại',
            onPressed: _resetChat,
          ),
        ],
      ),
      body: Column(
        children: [
          // Quick replies - Gợi ý câu hỏi nhanh
          _buildQuickReplies(),
          // Chat interface
          Expanded(
            child: DashChat(
              currentUser: _currentUser,
              typingUsers: _isTyping ? [_geminiUser] : [],
              onSend: _sendMessage,
              messages: _messages,
              messageOptions: MessageOptions(
                currentUserContainerColor: Colors.blueAccent,
                containerColor: Colors.grey[200]!,
                textColor: Colors.black87,
                currentUserTextColor: Colors.white,
              ),
              inputOptions: InputOptions(
                inputDecoration: InputDecoration(
                  hintText: 'Hỏi gì đó về tiếng Anh...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget gợi ý câu hỏi nhanh
  Widget _buildQuickReplies() {
    final suggestions = [
      '📚 Lộ trình cho người mới',
      '💬 Cách cải thiện phát âm',
      '✍️ Tips học từ vựng',
      '🎯 Đề xuất bài tập',
      '📖 Giải thích ngữ pháp',
    ];

    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ActionChip(
              label: Text(
                suggestions[index],
                style: const TextStyle(fontSize: 12),
              ),
              backgroundColor: Colors.blue[50],
              onPressed: () {
                // Gửi câu hỏi gợi ý
                final message = ChatMessage(
                  user: _currentUser,
                  createdAt: DateTime.now(),
                  text: suggestions[index],
                );
                _sendMessage(message);
              },
            ),
          );
        },
      ),
    );
  }

  // Hàm gửi tin nhắn với context duy trì
  Future<void> _sendMessage(ChatMessage chatMessage) async {
    setState(() {
      _messages = [chatMessage, ..._messages];
      _isTyping = true;
    });

    try {
      // Sử dụng chat session để duy trì context cuộc hội thoại
      final response = await _chat.sendMessage(Content.text(chatMessage.text));

      ChatMessage geminiMessage = ChatMessage(
        user: _geminiUser,
        createdAt: DateTime.now(),
        text: response.text ?? "Xin lỗi, tôi không thể trả lời lúc này.",
      );

      setState(() {
        _messages = [geminiMessage, ..._messages];
      });
    } catch (e) {
      debugPrint("Lỗi: $e");

      // Hiển thị thông báo lỗi thân thiện
      ChatMessage errorMessage = ChatMessage(
        user: _geminiUser,
        createdAt: DateTime.now(),
        text:
            "Xin lỗi, tôi đang gặp chút vấn đề kỹ thuật. Bạn thử hỏi lại nhé! 😊",
      );

      setState(() {
        _messages = [errorMessage, ..._messages];
      });
    } finally {
      setState(() {
        _isTyping = false;
      });
    }
  }

  // Reset chat - Bắt đầu cuộc hội thoại mới
  void _resetChat() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Làm mới cuộc hội thoại?'),
        content: const Text(
          'Bạn có muốn xóa lịch sử chat và bắt đầu lại không?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _messages.clear();
                _chat = _model.startChat(); // Tạo session mới
                _addWelcomeMessage();
              });
              Navigator.pop(context);
            },
            child: const Text('Đồng ý', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
