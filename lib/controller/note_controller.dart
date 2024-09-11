import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../model/note_model.dart';

class Notecontroller extends GetxController{

  var isLoading = false.obs;
  var uuid = Uuid();
  var allNotesList = <NoteModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllNote();
  }

  fetchAllNote() async{
    isLoading.value = true;
    allNotesList.clear();
    await FirebaseFirestore.instance.collection("notes").get()
        .then((QuerySnapshot snapshot){
      for(var u in snapshot.docs)
      {
        allNotesList.add(NoteModel(
          title:u['title'],
          description:u['description'],

        ));
      }
      if(allNotesList != null)
      {
        isLoading.value = false;
      }
    });
  }

  addNote( String title, String description) async{
    isLoading.value = true;
     var uniqueId=uuid.v1() ;


      NoteModel noteModel = NoteModel();
      noteModel.id = uniqueId ;
      noteModel.title = title;
      noteModel.description = description;



    FirebaseFirestore.instance.collection("notes").doc(uniqueId.toString())
        .set(noteModel.toMap())
        .then((value) {
      isLoading.value = false;
      fetchAllNote();
      Get.snackbar("Note addition", "One note added successfully",
          colorText: Colors.white, backgroundColor: Colors.green);
    })
        .catchError((error) {
      isLoading.value = false;
      Get.snackbar("Note addition", "Note addition failed",
          colorText: Colors.white, backgroundColor: Colors.red);
    })
        .whenComplete(() => isLoading.value = false);


  }

  }




