



import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/layout/Social_layout/cubit/stats.dart';
import 'package:untitled/modules/Scocial%20_app/Chats/chat/chats%20Model.dart';

import '../../../components/constants.dart';

import '../../../modules/Scocial _app/Chats/chats.dart';
import '../../../modules/Scocial _app/Feeds/feeds.dart';

import '../../../modules/Scocial _app/Post/Postmudels/postmodels.dart';
import '../../../modules/Scocial _app/Post/post.dart';
import '../../../modules/Scocial _app/SocialRegister/Social_model/social_model.dart';
import '../../../modules/Scocial _app/Users/Users.dart';
import '../../../modules/Scocial _app/settings/Setting.dart';

class SocialCubit extends Cubit<SocialState> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);
  SocialDataModel? UserModel;
  void getUserData(){
    emit(SocialLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      value.data();
      UserModel=SocialDataModel.fromjson(value.data()!);
      emit(SocialSuccessState());

    } ).catchError((error){
      print(error.toString());
      emit(SocialErrorState(error));

    });

  }
  int currentIndex = 0;
  List<Widget> Screens=[

    FeedScreen(),
    ChatsScreen(),
    Postscreen(),
    UserScreen(),
    settingScreen(),
  ];
  List<String> Tirles=[
    'Feed',
    'Chats',
    'Postscreen',
    'User',
    'setting'
  ];

  void ChangeBottomNav(int index){

    if(index ==1)
      getAllUser();

    if( index==2)
      emit(SocialNEWPOSTState());
    else{
      currentIndex=index;
      emit(SocialChangeBottomNavState());
    }}

  final ImagePicker Picker = ImagePicker();

  File? profileImage;
  Future<void> getProfileImage() async {
    final XFile? pickedImage =
    await Picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      this.profileImage = File(pickedImage.path);
      print(pickedImage.path);
      emit(ProfileImageSuccess());
    } else {
      emit(ProfileImageError());
    }
  }
  //data/user/0/com.example.untitled/cache/image_picker725353694763659413.jpg
  File? coverImage;
  Future<void> getCoverImage() async {
    final XFile? pickedImage =
    await Picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      this.coverImage = File(pickedImage.path);
      emit(CoverImageSuccess());
    } else {
      emit(CoverImageError());
    }
  }


  //String profileImageUrl = '';
  void uploadprofileImage({   required String name,
    required String phone,
    required String bio,
  }){
    emit(SocialuserdateupdateCoverImage());
    firebase_storage.FirebaseStorage.instance.ref().child('Users/${Uri.file(profileImage!.path).
    pathSegments.last}').putFile(profileImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);

        //   emit(UploadProfileImageSuccess());
        updateuser(name: name, phone: phone, bio: bio,
          image: value,
        );
      }).catchError((error){
        emit(uploadImageError());
        print(error);
      });
    }).catchError((error){
      print(error);
      emit(uploadImageError());
    });
  }
  PostModel?postModel;
//  String coverImageUrl = '';
  void uploadcoverImage({  required String name,
    required String phone,
    required String bio,
    String? cover,}){
    emit(SocialuserdateupdateCoverImage());
    firebase_storage.FirebaseStorage.instance.ref().child('Users/${Uri.file(coverImage!.path).
    pathSegments.last}').putFile(coverImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        updateuser(name: name, phone: phone, bio: bio,
          cover: value,
        );

      }).catchError((error){
        print(error); emit(uploadCoverImageError());

      });
    }).catchError((error){
      print(error);
      emit(uploadCoverImageError());
    });
  }

  File? PostImage;
  Future<void> getPostImage() async {
    final XFile? pickedImage =
    await Picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      this.PostImage = File(pickedImage.path);
      emit(PostImageSuccess());
    } else {
      emit(PostImageError());
    }
  }
  void uploadPostImage({
    required String dateTime,
    required String text,
    // required String image,
    // required String name,
    // required String uId,


  }){
    emit(CreatePostLoadingstate());
    //   emit(SocialuserdateupdatePost());
    firebase_storage.FirebaseStorage.instance.ref().child('Post/${Uri.file(PostImage!.path).
    pathSegments.last}').putFile(PostImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        CreatePost(dateTime: dateTime, text: text,PostImage:value,

        );
        print(value);
        //   emit(uploadPostSuccess());


      }).catchError((error){
        print(error); emit(uploadPosteError());

      });
    }).catchError((error){
      print(error);
      emit(uploadPosteError());
    });
  }
  void removePostImage(){
    PostImage=null;
    emit(removePostImagestate());
  }
  void CreatePost({

    required String dateTime,
    required String text,
    String? PostImage,


  }){
    emit(CreatePostLoadingstate());
    PostModel  model= PostModel (
      name: this.UserModel!.name,
      uId: this.UserModel!.uId,
      PostImage: PostImage??'',
      dateTime:dateTime,
      text:text,
      image:this.UserModel!.image,

    );

    FirebaseFirestore.instance.collection('Post').add(model.toMap()).then((value) {
      emit(CreatePostSuccess());
    }).
    catchError((error){
      emit(CreatePosteError());
    });
  }


  // File? SendImage;
  // Future<void> getSendImage() async {
  //   final XFile? pickedImage =
  //   await Picker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedImage != null) {
  //     this.SendImage = File(pickedImage.path);
  //     emit(SendImageSuccess());
  //   } else {
  //     emit(SendImageError());
  //   }
  // }
  // void uploadSendImage({
  //   required String receiverId,
  //   required String dateTime,
  //   required String messagetext,
  //
  //
  // }){
  //   emit(CreateSendLoadingstate());
  //   //   emit(SocialuserdateupdatePost());
  //   firebase_storage.FirebaseStorage.instance.ref().child('chats/${Uri.file(SendImage!.path).
  //   pathSegments.last}').putFile(SendImage!).then((value) {
  //     value.ref.getDownloadURL().then((value) {
  //       CreateSend(dateTime: dateTime, messagetext: messagetext,SendImage:value, receiverId: receiverId,
  //
  //       );
  //       print(value);
  //       //   emit(uploadPostSuccess());
  //
  //
  //     }).catchError((error){
  //       print(error); emit(uploadSendeError());
  //
  //     });
  //   }).catchError((error){
  //     print(error);
  //     emit(uploadSendError());
  //   });
  // }
  void removeSendImage(){
    PostImage=null;
    emit(removeSendImagestate());
  }
  // void CreateSend({
  //
  //   required String receiverId,
  //   required String dateTime,
  //   required String messagetext,
  //     String? SendImage,
  //
  //
  // }){
  //   emit(CreatePostLoadingstate());
  //   SendModel  model= SendModel (
  //     messagetext: messagetext,
  //     dateTime: dateTime,
  //     recevierId: receiverId ,
  //     sinderId: UserModel!.uId,
  //       SendImage:SendImage??'',
  //
  //
  //   );
  //
  //   FirebaseFirestore.instance.collection('chats').add(model.toMap()).then((value) {
  //     emit(CreateSendSuccess());
  //   }).
  //   catchError((error){
  //     emit(CreatesendError());
  //   });
  // }

//   void updateimage({
//   required String name,
//     required String phone,
//     required String bio,
// }){
//     emit(SocialuserdateupdateCoverImage());
//     if(coverImage !=null)
//     {
//       uploadcoverImage(bio:bio, name:name, phone: phone);
//     }
//     else if(profileImage !=null)
//     {
//       uploadprofileImage(name: name, bio: bio, phone: phone);
//     }else if(coverImage !=null&&profileImage !=null){}
//     else
//     {
//       updateuser(name: name, phone: phone, bio: bio);
//
//     }
//
//
//   }

  void updateuser({
    required String name,
    required String phone,
    required String bio,
    String? image,
    String? cover,
  }){


    SocialDataModel  model=SocialDataModel(
      name: name,
      phone: phone,
      bio:bio,
      email: this.UserModel!.email,
      cover: cover??this.UserModel!.cover,
      image:image??this.UserModel!.image,
      uId:this.UserModel!.uId,
      isEmailVerified: false,
    );

    FirebaseFirestore.instance.collection('users').doc(model.uId).update(model.toMap()).then((value) {
      getUserData();
    }).
    catchError((error){
      emit(UseruploadCoverImageError());
    });
  }



  List<PostModel> post=[];
  List<String> PostId=[];
  List<String> commentId=[];
  List<int> likes=[];
  List<int> comments=[];
  void getPost(){
    emit(GetPostsLoading());
    FirebaseFirestore.instance.collection('Post').orderBy('dateTime').get().then((value) {
      value.docs.forEach((element) {
        // element.reference.collection('Comments').get().then((value) {
        //   Comments.add(value.docs.length);
        //   post.add(PostModel.fromjson(element.data()));
        //   PostId.add(element.id);
        // }).catchError((error){});
        element.reference.collection('comments').get().then((value) {
          comments.add(value.docs.length);
          commentId.add(element.id);
        }).catchError((error){

        });

        element.reference.collection('likes').get().then((value) {

          likes.add(value.docs.length);
          post.add(PostModel.fromjson(element.data()));
          PostId.add(element.id);
        }).catchError((error){

        });


      });
      emit(SocialgetpostSuccess());
    }).catchError((error){
      emit(SocialgetpostError(error.toString()));
    });
  }

  void getLikespost(String  PostId){
    FirebaseFirestore.instance.collection('Post').doc(PostId).collection('likes').doc(UserModel!.uId).set({
      'likes':true,
    }).then((value) {
      emit(SocialgetLinkpostSuccess());

    }).
    catchError((error){
      emit(SocialgetLinkpostError(error.toString()));

    });
  }


  void getcomments(String  commentId){
    FirebaseFirestore.instance.collection('Post').doc(commentId).collection('comments').doc(UserModel!.uId).set({
      'comments':true,
    }).then((value) {
      emit(SocialgetcommentsSuccess());

    }).
    catchError((error){
      emit(SocialgetcommentsError(error.toString()));

    });
  }



  List<SocialDataModel> users=[];
  void getAllUser(){
 if(users.length==0)
      FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) {
        if(element.data()['uId']  != UserModel!.uId )
            users.add(SocialDataModel.fromjson(element.data()));
        print(element.data());

        });
        emit(SocialgetchatsSuccess());
      }).then((value) {}).catchError((error){
        emit(SocialgetchatsError());
      });}

  var massagecontrorll=TextEditingController();
  MassageModel ?chatUser;

  void sendMassage({
    required String receiverId,
    required String dateTime,
    required String messagetext,
  //  String? SendImage,

  }){

    MassageModel model =MassageModel(

      messagetext: messagetext,
      dateTime: dateTime,
      recevierId: receiverId ,
      sinderId: UserModel!.uId,
   //   SendImage:UserModel.image,



    );

    FirebaseFirestore.instance.collection('users').doc( UserModel!.uId).collection('chats').doc(receiverId)
        .collection('massage').
    add(model.toMap()).then((value) {
      emit(SocialsendmassageSuccess());
    }).catchError((error){
      emit(SocialsendmassageError());
    });


    FirebaseFirestore.instance.collection('users').doc( receiverId).collection('chats').doc(UserModel!.uId).collection('massage').
    add(model.toMap()).then((value) {
      emit(SocialgetsendmassageSuccess());
    }).catchError((error){
      emit(SocialgetsendmassageError());
    });

  }
  List<MassageModel> massage=[];

  void getMassage({
    required String receiverId
  }){
    FirebaseFirestore.instance.collection('users').doc(UserModel!.uId).collection('chats')
        .doc(receiverId).collection('massage').orderBy('dateTime').snapshots().listen((event) {
      massage=[];
      event.docs.forEach((element) {

        massage.add(MassageModel.fromjson(element.data()));
        print(element.data());
      }
      );
          emit(SocialgetsendchatSuccess());
    });
  }


  // final ImagePicker SendPicker = ImagePicker();
  // File? SendImage;
  // Future<void> getSendImage() async {
  //   final XFile? pickedImage =
  //   await SendPicker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedImage != null) {
  //     this.SendImage = File(pickedImage.path);
  //     emit(SendchatImageSuccess());
  //   } else {
  //     emit(SendchatImageerror());
  //   }
  // }




  // void uploadSendImage({
  // required String receiverId,
  // required String dateTime,
  // required String messagetext,
  //
  //
  // }){
  //   emit(CreateSendImageLoadingstate());
  //   //   emit(SocialuserdateupdatePost());
  //   firebase_storage.FirebaseStorage.instance.ref().child('chats/${Uri.file(SendImage!.path).
  //   pathSegments.last}').putFile(SendImage!).then((value) {
  //     value.ref.getDownloadURL().then((value) {
  //       sendMassage( messagetext: messagetext,SendImage:value, dateTime: dateTime, receiverId: UserModel!.uId,
  //
  //       );
  //       print(value);
  //       //   emit(uploadPostSuccess());
  //
  //
  //     }).catchError((error){
  //       print(error); emit(uploadSendImageError());
  //
  //     });
  //   }).catchError((error){
  //     print(error);
  //     emit(uploadSendImageError());
  //   });
  // }
  // void removeSendImage(){
  //   SendImage=null;
  //   emit(removeSendImageImagestate());
  // }
}
// void CreateSend({
//
//
//   required String text,
//   String? StImage,
//
//
// }){
//   emit(CreateSendImageLoadingstate());
//   MassageModel  model= MassageModel (messagetext: '', sinderId: '', dateTime: '', recevierId: '', Image: ''
//
//
//   );
//
//   FirebaseFirestore.instance.collection('Post').add(model.toMap()).then((value) {
//     emit(CreatePostSuccess());
//   }).
//   catchError((error){
//     emit(CreatePosteError());
//   });
// }






