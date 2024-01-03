class AppService {

  AppService(){
    print("#App Service call...");
  }

  String getToDaysDate() {
    return DateTime.now().day.toString();
  }
}
