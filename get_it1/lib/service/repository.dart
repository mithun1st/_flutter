class Repository{

  Repository(){
    print("#Repository Call...");
  }

  Future<bool> initDB()async{
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
  
  Future<bool> apiCall()async{
    await Future.delayed(const Duration(seconds: 3));
    return false;
  }

}