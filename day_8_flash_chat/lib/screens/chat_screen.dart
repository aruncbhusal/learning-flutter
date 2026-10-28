import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:day_8_flash_chat/constants.dart';

// Let's move firestore to global scope since multiple classes need it
final _firestore = FirebaseFirestore.instance;
// Now let's create a variable to hold the current user
User? loggedInUser;
// brought this to global scope since it is used throughout the screen
// But it's better to instead pass it to StreamBuilder since it's used for UI work than auth

// It will use the user's locale, else let's set a global locale for time

class ChatScreen extends StatefulWidget {
  static const String id = 'chat';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // To use Firebase Authentication here, we'll need to instantiate it
  final _auth = FirebaseAuth.instance;
  // Similarly for Cloud Firestore
  // We also need a variable to hold the current user string
  String messageText = '';
  // In order to be able to clear the message text after sending message, we need a controller
  final messageTextController = TextEditingController();

  // We need to get the logged in user when the state is created
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  // Let's now get the current user via the FireAuth instance
  void getCurrentUser(){
    // Since there might be any kind of exceptions, we want to catch them with try-catch
    try{
      // Now let's get the user so that we can identify them with their identity
      loggedInUser = _auth.currentUser;
    } catch (e){
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()))
      );
    }
  }
  // After this is done, we also enable email-password authentication method in the Firebase Authentication tab

  // Now in order to get the messages from Firestore we can use
  // void getMessages() async{
  //   var messages = await _firestore.collection('messages').get();
  //   var all = messages.docs;
  //   for (var message in all){
  //     print(message.data());
  //   }
  // }

  // But since we want instant messaging we instead use:
  // void messagesStream() async {
  //   await for (var snapshot in _firestore.collection('messages').snapshots()){
  //     for (var message in snapshot.docs){
  //       print(message.data());
  //     }
  //   }
  // }

  // Since we instantiated the TextEditingController in this widget, we need to dispose it with it
  @override
  void dispose(){
    messageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 13, 20, 36),
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app, color: Color.fromARGB(255, 241, 245, 255)),
              onPressed: () {
                //Implement logout functionality
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Center(
          child: Text(
              '⚡️ Messenger',
          style: TextStyle(
            color: Color.fromARGB(255, 241, 245, 255),
          )),
        ),
        backgroundColor: Color.fromARGB(255, 26, 40, 72),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // we want to show the messages from the top and message box at the bottom
            // We create a StreamBuilder widget here to use the data from the message stream
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      // We can define the controller for this field
                      controller: messageTextController,
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                      style: kTextFieldInputStyle,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                      //Implement send functionality.
                      // If message is empty, we exit
                      if (_auth.currentUser == null) return;
                      final text = messageText.trim();
                      if (text.isEmpty) return;
                      // For this, we get the collection we created in the Firebase console
                      // Then add a new document with the fields we have decided on
                      // We also want to record the timestamp so we can order the messages
                      // https://firebase.google.com/docs/reference/android/com/google/firebase/firestore/FieldValue
                      try{
                        await _firestore.collection('messages').add({
                          'text' : text,
                          'sender' : loggedInUser!.email,
                          'sentAt': FieldValue.serverTimestamp(),
                        });
                        // Once added, we can clear the message from the box
                      messageTextController.clear();
                      } catch (e) {
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString()))
                        );
                      }
                    },
                    child: Row(
                      children: [
                        Text(
                          'Send ',
                          style: kSendButtonTextStyle,
                        ),
                        Icon(Icons.send, color: Color.fromARGB(255, 77, 141, 255))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Instead of a vanilla Text widget, we can instead create our own message bubble
class MessageBubble extends StatelessWidget{
  const MessageBubble ({required this.sender, required this.text, required this.time,
    required this.isSelf, Key? key}) : super(key: key);

  final String sender;
  final String text;
  final Timestamp? time;
  // To tell messages from the user themselves, and from others, we can use a boolean
  final bool isSelf;

  String displayTime(){
    if (time == null) return "Sending..";
    // We'll use the intl package to format the date: if today then only hh:mm, else dd/mm/yy hh:mm
    final msgTime = time!.toDate();
    final now = DateTime.now();
    return (msgTime.day == now.day &&
        msgTime.month == now.month &&
        msgTime.year == now.year) ?
    DateFormat('hh:mm a').format(msgTime.toLocal()) :
    DateFormat('dd/MM/yy hh:mm a').format(msgTime.toLocal());
  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: isSelf ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 5),
          Material(
            // We determine color according to the sender
            color: isSelf ? Color.fromARGB(255, 37, 58, 92) : Color.fromARGB(255, 241, 245, 255),
            elevation: 3,
            // To look like a real message bubble, one of the sides should be pointy
            // We can set separate border radii for each corner to achieve that effect
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: isSelf ? Radius.circular(20) : Radius.zero,
              bottomRight: isSelf ? Radius.zero : Radius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelf ? Color.fromARGB(255, 241, 245, 255) : Color.fromARGB(255, 37, 58, 92),
                )
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            displayTime(),
            style: TextStyle(
              fontSize: 9,
              color: Colors.white60,
            )
          )
        ],
      ),
    );
  }
}

// Let's refactor the StreamBuilder out of the widget tree as it is being overcrowded with logic there
class MessagesStream extends StatelessWidget{
  const MessagesStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      // We specify the stream where StreamBuilder will get data from
      stream: _firestore.collection('messages').orderBy('sentAt').snapshots(),
      // Then we need a builder strategy (callback) that makes use of the data from the snapshot
      builder: (context, snapshot) {
        if(snapshot.hasError) return Center(child: Text('Something went wrong', style: TextStyle(color: Colors.white)));
        if (!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }

        // Since snapshot.data is a getter, Dart can't trust it to give deterministic non-null data
        // So we can't simply use an if clause to check if it is not null, and use it
        // We must either use null assertion (tell Dart the data is definitely not null) with (!.)
        // or use null aware operator (?.) to return null for the docs when data gives null
        // Also, when retrieving messages, we can take its reversed list so newer messages appear below
        final messages = snapshot.data!.docs.reversed;
        List<MessageBubble> messageWidgets = [];
        for (var message in messages){
          final String messageText = (message.data() as Map<String, dynamic>)['text'];
          // Since the return of message.data() was of type Object?, we need to cast it to a Map
          // The course simply used message.data itself as a map but it seems that's outdated now
          final String messageSender = (message.data() as Map<String, dynamic>)['sender'];
          // We can easily determine if the currently logged user is the one who sent the message
          final currentUser = loggedInUser!.email;
          // We also retrieve the timestamp
          final Timestamp? messageAt = (message.data() as Map<String, dynamic>)['sentAt'];

          final messageWidget = MessageBubble(sender: messageSender, text: messageText, time: messageAt,
              isSelf: currentUser == messageSender);
          messageWidgets.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            // In order to scroll to most recent/bottom message, we can use:
            reverse: true,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}