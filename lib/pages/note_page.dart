import 'package:carefire/controller/note_controller.dart';
import 'package:carefire/pages/addnote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
class NoteView extends StatefulWidget {
  const NoteView({Key? key}) : super(key: key);

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  final notecontroller = Get.put(Notecontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("😍 A L L  N O T E S 😍"
          ),
          centerTitle:true,
        ),
        body: Obx(() => LoadingOverlay(
          isLoading: notecontroller.isLoading.value,
          child: Container(
            margin: EdgeInsets.all(8),
            child: notecontroller.allNotesList.isEmpty
                ? Center(child: Text('No Notes Available'))
                : ListView.builder(
              itemCount: notecontroller.allNotesList.length,
              itemBuilder: (context, index) {
                final note = notecontroller.allNotesList[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: () {
                      // Handle note tap
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                note.title ?? 'No Title',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),


                            ],
                          ),
                          SizedBox(height: 10),
                          // Description Text
                          Text(
                            note.description ?? 'No Description',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 10),
                          // Footer

                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed("/addnote");
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
