import 'package:flutter/material.dart';

class Removebooklist extends StatefulWidget {
  const Removebooklist({super.key});

  @override
  State<Removebooklist> createState() => _RemovebooklistState();
}

class _RemovebooklistState extends State<Removebooklist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          backgroundColor: Colors.red.shade400,
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          title: Row(
            children: [
              Text(
                'Remove Books in Library',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'serif', fontSize: 21),
              ),
              SizedBox(
                width: 3,
              ),
              Icon(
                Icons.bookmark_remove,
                color: Colors.white,
              )
            ],
          ),
        ),
        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            children: [
               Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23.0)),
                elevation: 7,
                shadowColor: Colors.red.shade400,
                child: TextField(
               //   controller: _controller,
                  style: const TextStyle(fontFamily: 'serif', fontSize: 18),
                  autocorrect: true,
                  showCursor: true,
                 // onSubmitted: (value) => _sendMessage(),
                  decoration: InputDecoration(
                    hintText: "Search Books . . .",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontFamily: 'serif',
                    ),
                    prefixIcon: const Icon(
                      Icons.manage_search,
                      size: 32,
                    ),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: (){},
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.82,
              child: ListView.builder(itemBuilder: (context,index){
                return Card(
                  color: Colors.white,
                  elevation: 3,
                  shadowColor: Colors.blue.withOpacity(0.5),
                  child: ListTile(
                    leading:  CircleAvatar(
                    backgroundColor: Colors.transparent,
                      child: Text('${index+1}',style: TextStyle(
                        fontFamily: 'serif', fontSize: 21), ),
                    ),
                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined)),
                  subtitle:  Text('author of the book $index',style: TextStyle(
                       fontFamily: 'serif'), ),
                    title:  Text('book $index',style: TextStyle(
                      color: Colors.black, fontFamily: 'serif', fontSize: 21), ),
                  ),
                );
              },itemCount: 32,),
            )
            ],
          ),
        )
    );
  }
}