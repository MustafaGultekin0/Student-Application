import 'dart:math';

import 'package:flutter/material.dart';
import 'package:student_app/Repository/messages_repository.dart';
import 'package:student_app/main.dart';

class MessagesPage extends StatefulWidget {
  final MessagesRepository messagesRepository;
  const MessagesPage(this.messagesRepository, {Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Messages"),
        ),
        body: Column(
          children: [
            PhysicalModel(
              color: Colors.white,
              elevation: 15,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentApp()));
                    },
                    child: Text('GoBack')),
              ),
            ),
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: widget.messagesRepository.messages.length,
                itemBuilder: (context, index) {
                  return MessageView(widget.messagesRepository.messages[
                  widget.messagesRepository.messages.length - index-1
                  ]);
                },
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(border: Border.all()),
              child: Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none
                            ),
                          ),
                        )
                    ),
                  )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: ElevatedButton(
                        onPressed: () {
                          print('Send');
                        },
                        child: Text('Send')),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class MessageView extends StatelessWidget {
  final Message message;
  const MessageView(this.message, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.sender == 'Mustafa' ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 8, vertical: 16),
        child: DecoratedBox(
          decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.blueGrey, width: 2),
              color: Colors.orange.shade100,
              borderRadius:
                  const BorderRadius.all(Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(message.text),
          ),
        ),
      ),
    );
  }
}
