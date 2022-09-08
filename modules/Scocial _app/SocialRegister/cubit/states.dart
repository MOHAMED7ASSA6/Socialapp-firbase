
abstract class SocialRegisteState{}

class SocialRegisteInitialState extends SocialRegisteState{}

class SocialRegisteLoadingState extends SocialRegisteState{}

class SocialRegisteSuccessState extends SocialRegisteState{}

class SocialRegisteErrorState extends SocialRegisteState
{final String error;
SocialRegisteErrorState(this.error);}
class SocialCreatLoadingState extends SocialRegisteState{}

class SocialCreatSuccessState extends SocialRegisteState{}

class SocialCreatErrorState extends SocialRegisteState
{final String error;
SocialCreatErrorState(this.error);}

class SocialRegisteIsPasswordState extends SocialRegisteState{}