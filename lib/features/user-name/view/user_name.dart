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
            fontSize: Dim.dim_18.sp,
            fontWeight: FontWeight.bold
          ),),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Dim.dim_35.w,vertical: Dim.dim_20.h),
            padding: EdgeInsets.symmetric(horizontal: Dim.dim_15.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(Dim.dim_18.r)
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
                fontSize: Dim.dim_16.sp,
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
