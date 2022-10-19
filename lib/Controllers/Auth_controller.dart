import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:memoryz/Models/UserModel.dart';
import 'package:memoryz/Services/FirestoreUser.dart';

class AuthController extends GetxController {

  static AuthController instance = Get.find();

  bool loading = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  User? get userProfile => auth.currentUser;

  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    
    firebaseUser = Rx<User?>(auth.currentUser);
      
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed("/login");
    } else {
      Get.offAllNamed("/home");
        
    }
  }


  void register(String username, String email, String password) async {
    try {

      loading = true;
      update();

      await auth.createUserWithEmailAndPassword(email: email, password: password).then((value){
        print("save to firestore");
        saveUserToFirestore(value, username);
        print("saved to firestore -- succes");
      });

      loading = false;
      update();
      Get.offAllNamed("/home");

    } on FirebaseAuthException catch(e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (e.code == "weak-password") {
        message = "Le mot de passe est trop faible"; 
      } else if (e.code == "email-alrady-in-use") {
        message = "Email déja ustilisé"; 
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title, message);
    } 
    catch (e) {
      Get.snackbar(
        "Une erreur est survenu",
        e.toString()
      );
    }
  }

  void login(String email, String password) async {
    try {

      loading = true;
      update();

      await auth.signInWithEmailAndPassword(email: email, password: password);
      
      loading = false;
      update();
      Get.offAllNamed("/home");
    } on FirebaseAuthException catch(e) {
      loading = false;
      update();
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (e.code == "wrong-password") {
        message = "Mot de passe incorrect"; 
      } else if (e.code == "user-not-found") {
        message = "Compte inexistant"; 
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title, message,);
    } 
    catch (e) {
      loading = false;
      update();
      Get.snackbar(
        "Une erreur est survenu",
        e.toString()
      );
      e.printError();
      e.printInfo();
    }
  }

  void signOut() async {
    try {
      await auth.signOut();
      update();
      Get.offAllNamed("/");
    } catch (e) {
       Get.snackbar(
        "Une erreur est survenu",
        e.toString()
      );
    }
  }

  saveUserToFirestore(UserCredential user, String username) async {
    await  FirestoreUser().addUserToFirestore(
      UserModel(
        id: user.user!.uid,
        email: user.user!.email,
        username: username,
        pic: "" 
      )
    );
  }

}