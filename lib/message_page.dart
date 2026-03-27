import 'package:calling_app/core/theme.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages',
        style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded), color: Colors.white,)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text('Recent',  style: TextStyle(color: Colors.white)),
          ),
          Container(
            height:100 ,
            padding: EdgeInsets.all(5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRecentContact(context, 'Asif'),
                _buildRecentContact(context, 'Shafiq'),
                _buildRecentContact(context, 'Talha'),
                _buildRecentContact(context, 'Arif'),
                _buildRecentContact(context, 'Danish')

              ],
            ),
          ),
          SizedBox(height: 20,),
          Expanded(child:
          Container(
            decoration: BoxDecoration(
              color: DefaultColors.messageListPage,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              )
            ),
            child: ListView(
              children: [
                _buildMessageTile('Asif', 'Hi','2:38',),
                _buildMessageTile('Shafiq', 'Hi','2:38',),
                _buildMessageTile('Talha', 'Hi','2:38',),
                _buildMessageTile('Arif', 'Hi','2:38',),
                _buildMessageTile('Danish', 'Hi','2:38',),

              ],
            ),
          ))
        ],
      )
    );
  }



  _buildRecentContact(BuildContext context, String name) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,

        ),
        SizedBox(height: 5,),
        Text(name,

        style: Theme.of(context).textTheme.bodyMedium
          ,)
      ],
    ),);
  }

  _buildMessageTile( String name, String message, String time) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
      ),
      title: Text(name,  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      subtitle: Text(message,  style: TextStyle(color: Colors.grey),
      overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(time,  style: TextStyle(color: Colors.grey)),
    );
  }
}
