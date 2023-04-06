class MessagesRepository{
  final List <Message> messages= [
    Message('Hello','Mustafa', DateTime.now().subtract(const Duration(minutes: 1))),
    Message('How are u?','Akin', DateTime.now().subtract(const Duration(minutes: 2))),
    Message('I`m good u?','Dilara', DateTime.now().subtract(const Duration(minutes: 3))),
    Message('I`m perfect','Kadir', DateTime.now())
  ];
}

class Message{
  String text;
  String sender;
  DateTime time;

  Message(this.text,this.sender,this.time);
}