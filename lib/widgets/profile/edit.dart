import 'package:flutter/material.dart';
import '../../model/profile/profileProvider.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  final key = GlobalKey<FormState>();
  final _emailFocus = FocusNode();
  final _mobileNoFocus = FocusNode();
  final _addressFocus = FocusNode();
  final _pincodeFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailFocus.dispose();
    _mobileNoFocus.dispose();
    _addressFocus.dispose();
    _pincodeFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    final provider = Provider.of<ProfileProvider>(context).profile;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
      child: Center(
        child: Form(
          key: key,
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: height * 0.06,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: provider['name'].toString(),
                        label: Text(
                          'Name',
                          textScaleFactor: textScale,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                  )),
              SizedBox(height: height * 0.01),
              Container(
                  width: double.infinity,
                  height: height * 0.06,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Siddhartha Chatterjee',
                          label: Text(
                            'Email',
                            textScaleFactor: textScale,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          )))),
              SizedBox(height: height * 0.01),
              Container(
                  width: double.infinity,
                  height: height * 0.06,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'Mobile No',
                            textScaleFactor: textScale,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          )))),
              SizedBox(height: height * 0.01),
              Container(
                  width: double.infinity,
                  height: height * 0.06,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'Address',
                            textScaleFactor: textScale,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          )))),
              SizedBox(height: height * 0.01),
              Container(
                  width: double.infinity,
                  height: height * 0.06,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'Pincode',
                            textScaleFactor: textScale,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          )))),
              SizedBox(height: height * 0.01),
              Container(
                  width: double.infinity,
                  height: height * 0.06,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                      // autofocus: true,
                      // keyboardType: TextInputType.,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'Password',
                            textScaleFactor: textScale,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          )))),
              SizedBox(height: height * 0.01),
              Container(
                  width: double.infinity,
                  height: height * 0.06,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                      // autofocus: true,
                      // keyboardType: TextInputType.,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'Confirm Password',
                            textScaleFactor: textScale,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          )))),
              SizedBox(height: height * 0.05),
              Container(
                width: double.infinity,
                height: height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.white, width: 1)),
                child: Center(
                  child: Text(
                    'Save',
                    textScaleFactor: textScale,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
