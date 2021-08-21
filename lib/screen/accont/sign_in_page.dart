import 'package:bottom_nav_app/model/login_model/sign_in_model.dart';
import 'package:bottom_nav_app/screen/accont/signUp_page.dart';
import 'package:bottom_nav_app/sign_parts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../nav_page.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: ChangeNotifierProvider<SignInModel>(
        create: (_) => SignInModel()..checkSignIn(context),
        child: Consumer<SignInModel>(
          builder: (context, model, child) {
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Container(
                            width: 150,
                            child: Image.asset('assets/logo.png'),
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Icon(
                                Icons.mail,
                                color: Theme.of(context).primaryColor,
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
                              Icon(
                                Icons.vpn_key,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: TextField(
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
                                    top: 20,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        try {
                                          model.startLoading();
                                          await model.signIn();
                                          model.endLoading();
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return NavPage();
                                          }));
                                        } on FirebaseAuthException catch (e) {
                                          if (e.code == 'user-not-found') {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return signInAlertDialog(
                                                      context, e);
                                                });
                                            model.endLoading();
                                          } else if (e.code ==
                                              'wrong-password') {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return signInAlertDialog(
                                                      context, e);
                                                });
                                            model.endLoading();
                                          }
                                        } catch (e) {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return loginAlertDialog(
                                                    context, e);
                                              });
                                          model.endLoading();
                                        }
                                      },
                                      child: Text(
                                        'ログインする',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: TextButton(
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SignUpPage();
                                  },
                                ),
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle(color: Colors.black87),
                                  children: <TextSpan>[
                                    TextSpan(text: 'アカウントをお持ちではない方は'),
                                    TextSpan(
                                        text: 'こちらから作成',
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
