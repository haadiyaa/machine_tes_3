import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_task_5/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provder=Provider.of<FunctionsProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'POSTS',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 50,
                      // decoration: const BoxDecoration(),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            clipBehavior: Clip.antiAlias,
                            child: const Image(
                              image: AssetImage('assets/room.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'colamanz',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 350,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/room.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Consumer<FunctionsProvider>(
                      builder: (context, value, child) {
                        final provider = Provider.of<FunctionsProvider>(context,
                            listen: false);
                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        provider.increment();
                                      },
                                      icon: const Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.white)),
                                  Text(
                                    '${provider.likes}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      content: Container(
                                        height: 150,
                                        child: Column(
                                          children: [
                                            TextField(
                                              autofocus: true,
                                              controller: text,
                                              decoration:
                                                  const InputDecoration(),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                provider.commentPost(text.text);
                                                text.clear();
                                                Navigator.pop(context);
                                              },
                                              child: const Text('submit'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.comment_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              const Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                              const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        );
                      },
                      // child:
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: 150,
                width: MediaQuery.of(context).size.width*0.9,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 5,),
                  itemCount: provder.comments.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 10,
                      child: ListTile(
                        title: Text(provder.comments[index]),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
