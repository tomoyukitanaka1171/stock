import 'package:bottom_nav_app/constrains.dart';
import 'package:bottom_nav_app/model/signup_model.dart';
import 'package:bottom_nav_app/screen/accont/gender_page.dart';
import 'package:bottom_nav_app/sign_parts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: ChangeNotifierProvider<SignUpModel>(
        create: (_) => SignUpModel(),
        child: Consumer<SignUpModel>(
          builder: (context, model, child) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        child: Image.asset('assets/logo-p.png'),
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Icon(
                            Icons.mail,
                            color: defaultColor,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'メールアドレスを入力',
                              ),
                              onChanged: (text) {
                                model.mail = text;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.vpn_key, color: defaultColor),
                          SizedBox(width: 20),
                          Expanded(
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'パスワードを入力',
                              ),
                              onChanged: (text) {
                                model.pass = text;
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 30,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    try {
                                      model.startLoading();
                                      await model.signUp();
                                      model.endLoading();
                                      Navigator.push(context,
                                          CupertinoPageRoute(
                                              builder: (context) {
                                        return GenderPage(model.documentId);
                                      }));
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'email-already-in-use') {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return mailAlertDialog(
                                                  context, e);
                                            });
                                        model.endLoading();
                                      } else if (e.code == 'weak-password') {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return passAlertDialog(
                                                  context, e);
                                            });
                                        model.endLoading();
                                      }
                                    } catch (e) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return loginAlertDialog(context, e);
                                          });
                                      model.endLoading();
                                    }
                                  },
                                  child: Text(
                                    'アカウント作成する',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(defaultColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Colors.black87),
                                    children: <TextSpan>[
                                      TextSpan(text: 'アカウントをすでにお持ちの方は'),
                                      TextSpan(
                                          text: 'ログイン画面に戻る',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold)),
                                    ]),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                model.isLoading
                    ? Container(
                        color: Colors.black12,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}
//fwffefe@icloud.com
