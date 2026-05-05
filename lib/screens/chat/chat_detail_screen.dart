import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/services/api_service.dart';
import '../../core/providers/auth_provider.dart';
import 'widgets/chat_bubble.dart';

class ChatDetailScreen extends StatefulWidget {
  final int peerId;
  final String name;
  final String avatarUrl;

  const ChatDetailScreen({
    super.key,
    required this.peerId,
    required this.name,
    required this.avatarUrl,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  List<dynamic> _messages = [];
  bool _isLoading = true;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchMessages();
  }

  Future<void> _fetchMessages() async {
    try {
      final res = await ApiService.get('api/chat/${widget.peerId}');
      setState(() {
        final messagesData = res['messages'];
        _messages = (messagesData is List) ? messagesData : [];
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching messages: $e");
      setState(() => _isLoading = false);
    }
  }

  Future<void> _sendMessage() async {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    _textController.clear();
    // Optimistic update
    final currentUserId = context.read<AuthProvider>().user?['id'];
    setState(() {
      _messages.add({
        'senderId': currentUserId,
        'content': text,
        'timestamp': DateTime.now().toIso8601String(),
      });
    });

    try {
      final res = await ApiService.post('api/chat/${widget.peerId}', {'content': text});
      // the real message with id
      setState(() {
        _messages.last = res;
      });
    } catch (e) {
      print("Error sending message: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = context.watch<AuthProvider>().user?['id'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 18, backgroundImage: NetworkImage(widget.avatarUrl)),
            const SizedBox(width: 8),
            // The plus icon as in the mockup
            GestureDetector(
              onTap: () {
                // Show contacts placeholder
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Showing contacts...")),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.teal[50],
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, color: AppColors.primary, size: 20),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildDateSeparator("Jan 28, 2020"),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final m = _messages[index];
                      final isMe = m['senderId'] == currentUserId;
                      // Grouping logic simple
                      final isFirstInGroup = index == 0 || _messages[index - 1]['senderId'] != m['senderId'];
                      
                      String formattedTime = "";
                      if (m['timestamp'] != null) {
                        final dt = DateTime.parse(m['timestamp']);
                        formattedTime = "${dt.hour}:${dt.minute.toString().padLeft(2, '0')}";
                      }

                      return ChatBubble(
                        text: m['content'] ?? '',
                        isMe: isMe,
                        senderName: isMe ? "Me" : widget.name,
                        time: isFirstInGroup ? formattedTime : null,
                        avatarUrl: widget.avatarUrl,
                        isFirstInGroup: isFirstInGroup,
                      );
                    },
                  ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildDateSeparator(String date) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        date,
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          _buildIconButton(Icons.mic_none),
          const SizedBox(width: 10),
          _buildIconButton(Icons.image_outlined),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: TextField(
                controller: _textController,
                onSubmitted: (_) => _sendMessage(),
                decoration: const InputDecoration(
                  hintText: "Type message",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: _sendMessage,
            child: _buildIconButton(Icons.send, color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, {Color? color}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Icon(icon, color: color ?? Colors.grey[600], size: 24),
    );
  }
}
