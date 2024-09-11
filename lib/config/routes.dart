import 'package:carefire/pages/addnote.dart';
import 'package:carefire/pages/note_page.dart';
import 'package:carefire/widgets/wrapper.dart';
import 'package:get/get.dart';
import '../pages/authin/login_page.dart';
import '../pages/authin/signup_page.dart';

var pages = [
  GetPage(
    name: "/login",
    page: () => const LoginPage(),
  ),
  GetPage(
    name: "/signup",
    page: () => const SignupPage(),
  ),
  GetPage(
    name: "/addnote",
    page: () => const AddNote(),
  ),
  GetPage(
    name: "/notes",
    page: () => const NoteView(),
  ),
  GetPage(
    name: "/wrapper",
    page: () => const Wrapper(),
  ),

];