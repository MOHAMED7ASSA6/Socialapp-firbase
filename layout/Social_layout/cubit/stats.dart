
abstract class SocialState{}

class SocialInitialState extends SocialState{}

class SocialLoadingState extends SocialState{}

class SocialSuccessState extends SocialState{}

class SocialErrorState extends SocialState
{final String error;
SocialErrorState(this.error);}
class SocialChangeBottomNavState extends SocialState{}
class SocialNEWPOSTState extends SocialState{}
class ProfileImageSuccess extends SocialState{}
class ProfileImageError extends SocialState{}
class UploadProfileImageSuccess extends SocialState{}
class uploadImageError extends SocialState{}
class CoverImageSuccess extends SocialState{}
class CoverImageError extends SocialState{}
class UseruploadCoverImageError extends SocialState{}
class uploadCoverImageSuccess extends SocialState{}
class uploadCoverImageError extends SocialState{}
class SocialuserdateupdateCoverImage extends SocialState{}

//post
class uploadPostSuccess extends SocialState{}
class uploadPosteError extends SocialState{}
class SocialuserdateupdatePost extends SocialState{}

class PostImageSuccess extends SocialState{}
class PostImageError extends SocialState{}
class CreatePostLoadingstate extends SocialState{}
class CreatePostSuccess extends SocialState{}
class CreatePosteError extends SocialState{}
class removePostImagestate extends SocialState{}


// upload (profile / cover / post) image


class UploadProfileImageError extends SocialState {}

class UploadCoverImageSuccess extends SocialState {}

class UploadCoverImageError extends SocialState {}

class UploadPostImageSuccess extends SocialState {}

class UploadPostImageError extends SocialState {}

// update user data
class UpdateUserLoading extends SocialState {}

class UpdateUserError extends SocialState {}

//  create new post
class CreatePostLoading extends SocialState {}



class CreatePostError extends SocialState {}

// getPostsData
class GetPostsLoading extends SocialState {}

class GetPostsSuccess extends SocialState {}

class GetPostsError extends SocialState {
  final String error;
  GetPostsError(this.error);
}

// likePost
class LikePostsSuccess extends SocialState {}

class LikePostsError extends SocialState {
  final String error;
  LikePostsError(this.error);
}

// getAllUsers
class GetAllUsersLoading extends SocialState {}

class GetAllUsersSuccess extends SocialState {}

class GetAllUsersError extends SocialState {
  final String error;
  GetAllUsersError(this.error);
}

// chat
class SendMessageSuccess extends SocialState {}

class SendMessageError extends SocialState {}

class GetMessageSuccess extends SocialState {}
class PostImageRemove extends SocialState {}
//get
class SocialgetpostSuccess extends SocialState {}
class SocialgetpostError extends SocialState {
  final String error;
  SocialgetpostError(this.error);
}

//getLinkpost
class SocialgetLinkpostSuccess extends SocialState {}
class SocialgetLinkpostError extends SocialState {
  final String error;
  SocialgetLinkpostError(this.error);
}
class SocialgetcommentsSuccess extends SocialState {}
class SocialgetcommentsError extends SocialState {
  final String error;
  SocialgetcommentsError(this.error);
}


class SocialgetchatsSuccess extends SocialState {}
class SocialgetchatsError extends SocialState {}


class SocialsendmassageSuccess extends SocialState {}
class SocialsendmassageError extends SocialState {}
class SocialgetsendmassageelementSuccess extends SocialState {}
class SocialgetsendmassageSuccess extends SocialState {}
class SocialgetsendmassageError extends SocialState {}

class SocialgetmassageSuccess extends SocialState {}

class NewPost extends SocialState {}
class ChangeBottomNav extends SocialState {}
class SendImageSuccess extends SocialState {}
class SendImageerror extends SocialState {}


class SendchatImageSuccess extends SocialState {}
class SocialgetsendchatSuccess extends SocialState {}
class SendchatImageerror extends SocialState {}



class removeSendImageImagestate extends SocialState {}
class uploadSendImageError extends SocialState {}
class CreateSendImageLoadingstate extends SocialState {}

////////////////////
class SendImageError extends SocialState {}
class CreateSendLoadingstate extends SocialState {}
class uploadSendeError extends SocialState {}

class uploadSendError extends SocialState {}
class removeSendImagestate extends SocialState {}
class CreateSendSuccess extends SocialState {}

class CreatesendError extends SocialState {}






















