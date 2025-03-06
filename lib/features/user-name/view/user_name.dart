import '../../../app/index.dart';

class UserName extends StatefulWidget {
  const UserName({super.key});

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/images/welcome.json'),
          Text(
            Strings.enterUserName,
            style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 35,vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(18)
            ),
            child: TextField(
              controller: nameController,
              onChanged: (String value){

              },
              onSubmitted: (String value){
                Pref().setString(userName, value);
                Future.delayed(Duration(seconds: 2),(){
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                });
              },
              decoration: InputDecoration(
                hintText: Strings.userName,
                border: InputBorder.none
              ),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(25)
              ],
            ),
          )
        ],
      ),
    );
  }
}
