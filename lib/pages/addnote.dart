
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:loading_overlay/loading_overlay.dart';

import '../controller/note_controller.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  final titleController = TextEditingController();
  final descController = TextEditingController();
  final notecontroller = Get.put(Notecontroller());



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Add Notes"),
          ),
          body: Obx(()=>LoadingOverlay(
            isLoading: notecontroller.isLoading.value,
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[



                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          labelText: 'Title',
                          hintText: 'Enter Title'
                      ),
                    ),

                    SizedBox(height: 8,),
                    TextField(
                      controller: descController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          labelText: 'Description',
                          hintText: 'Enter Description'
                      ),
                    ),
                    SizedBox(height: 8,),


                    InkWell(
                      onTap: (){
                        if( titleController.text != ""
                            && descController.text != "" )
                        {
                          notecontroller.addNote(titleController.text,
                              descController.text,

                          );

                          titleController.text = "";
                          descController.text = "";


                        }
                        else{
                          Get.snackbar("Form validation",
                              "Please fill all the field and try again",
                              colorText: Colors.white,backgroundColor: Colors.red);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text("Submit",style: TextStyle(color: Colors.white),),
                      ),
                    )



                  ],
                ),
              ),
            ),
          )),
        )
    );
  }
}