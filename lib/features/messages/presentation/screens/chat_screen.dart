import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../data/models/conversation_item_model.dart';
import '../../data/models/message_model.dart';
import '../widgets/chat_header.dart';
import '../widgets/chat_messages_list.dart';
import '../widgets/chat_input_field.dart';

class ChatScreen extends StatefulWidget {
  final ConversationItemModel conversation;

  const ChatScreen({super.key, required this.conversation});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<MessageModel> _messages = [];

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMessages() {
    // Sample messages for demonstration
    setState(() {
      _messages = [
        MessageModel(
          id: '1',
          content:
              "Good morning! I've reviewed your project proposal. Overall structure looks good, but please add more details to the methodology section.",
          senderId: 'supervisor',
          senderName: 'Dr. Ahmed Hassan',
          senderAvatar: AppImages.sara,
          timestamp: DateTime.now().subtract(const Duration(hours: 2)),
          isFromCurrentUser: false,
        ),
        MessageModel(
          id: '2',
          content:
              "Thank you for the feedback! I'll work on expanding the methodology section and have it ready by tomorrow.",
          senderId: 'student',
          senderName: 'You',
          senderAvatar: AppImages.sara,
          timestamp: DateTime.now().subtract(const Duration(hours: 1)),
          isFromCurrentUser: true,
        ),
      ];
    });
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final newMessage = MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: _messageController.text.trim(),
      senderId: 'student',
      senderName: 'You',
      senderAvatar: AppImages.sara,
      timestamp: DateTime.now(),
      isFromCurrentUser: true,
    );

    setState(() {
      _messages.add(newMessage);
    });

    _messageController.clear();

    // Scroll to bottom
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: ChatHeader(conversation: widget.conversation),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: ChatMessagesList(
              messages: _messages,
              scrollController: _scrollController,
            ),
          ),

          // Input Field
          ChatInputField(controller: _messageController, onSend: _sendMessage),
        ],
      ),
    );
  }
}
