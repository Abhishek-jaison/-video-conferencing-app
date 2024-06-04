import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'api_call.dart';
import 'meeting_screen.dart';

class JoinScreen extends StatelessWidget {
  final _meetingIdController = TextEditingController();

  JoinScreen({Key? key}) : super(key: key);

  void onCreateButtonPressed(BuildContext context) async {
    // call api to create meeting and then navigate to MeetingScreen with meetingId,token
    await createMeeting().then((meetingId) {
      if (!context.mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MeetingScreen(
            meetingId: meetingId,
            token: token,
          ),
        ),
      );
    });
  }

  void onJoinButtonPressed(BuildContext context) {
    String meetingId = _meetingIdController.text;
    var re = RegExp("\\w{4}\\-\\w{4}\\-\\w{4}");
    // check meeting id is not null or invalid
    // if meeting id is valid then navigate to MeetingScreen with meetingId,token
    if (meetingId.isNotEmpty && re.hasMatch(meetingId)) {
      _meetingIdController.clear();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MeetingScreen(
            meetingId: meetingId,
            token: token,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter a valid meeting id"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
  
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Video Conference',style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),),
          ),
          body: 
          
         Container(
             decoration: const BoxDecoration(
                image: DecorationImage(
                 image: AssetImage('assets/person1.jpg'), // Replace with your image path
                     fit: BoxFit.cover,
                  ),
                ),   
          
            child : BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => onCreateButtonPressed(context),
                          child: const Icon(Icons.new_label,size: 30,),
                        ),
                       
                      ],
                    ),
                    const SizedBox(height: 25), // Add space between the rows
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () => onJoinButtonPressed(context),
                          child: const Icon(Icons.arrow_upward_outlined,size: 28,),
                        ),
                        const SizedBox(width: 10), // Add space between icon and text
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 8.0),
                            
                            child: TextField(
                              
                              decoration: const InputDecoration(
                                
                                
                                hintText: 'Meeting Id',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                
                                ),
                              ),
                              controller: _meetingIdController,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    
  }
}
