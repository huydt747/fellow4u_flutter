import 'package:flutter/material.dart';
import '../../core/services/api_service.dart';
import '../../core/services/chat_service.dart';
import '../../core/services/session_service.dart';
import 'chat_detail_screen.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({super.key});

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  List<dynamic> _users = [];
  bool _isLoading = true;
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      final users = await ApiService.get("api/users");
      if (mounted) {
        setState(() {
          _users = users.where((u) => u['id'] != SessionService.currentUserId).toList();
          _isLoading = false;
        });
      }
    } catch (e) {
      print("Error fetching users: $e");
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _startChat(Map<String, dynamic> user) async {
    final currentUserId = SessionService.currentUserId;
    if (currentUserId == null) return;

    try {
      final conversationId = await ChatService.createConversation(currentUserId, user['id']);
      
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailScreen(
              name: user['fullName'] ?? user['username'],
              avatarUrl: user['avatarUrl'] ?? "img/avatar/6.png",
              conversationId: conversationId,
              otherUserId: user['id'],
            ),
          ),
        ).then((_) => Navigator.pop(context, true));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to start chat: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredUsers = _users.where((u) {
      final name = (u['fullName'] ?? u['username']).toString().toLowerCase();
      return name.contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Find People"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                hintText: "Search by name...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : filteredUsers.isEmpty
              ? const Center(child: Text("No users found"))
              : ListView.builder(
                  itemCount: filteredUsers.length,
                  itemBuilder: (context, index) {
                    final user = filteredUsers[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: user['avatarUrl'] != null && user['avatarUrl'].startsWith('http')
                            ? NetworkImage(user['avatarUrl'])
                            : null,
                        child: user['avatarUrl'] == null ? const Icon(Icons.person) : null,
                      ),
                      title: Text(user['fullName'] ?? user['username']),
                      subtitle: Text(user['role'] ?? ""),
                      trailing: const Icon(Icons.chat_bubble_outline, color: Colors.teal),
                      onTap: () => _startChat(user),
                    );
                  },
                ),
    );
  }
}
