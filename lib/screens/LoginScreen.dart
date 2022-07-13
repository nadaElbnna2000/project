import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Shared/cubit/cubit.dart';
import 'package:untitled/Shared/cubit/states.dart';

class LoginScrren extends StatelessWidget {


  var formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {


    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context ) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit , ShopLoginStates>(
        listener: (context , state){},
        builder: (context , state){
          return  Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style:TextStyle
                            (
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ) ,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style:TextStyle
                            (
                            fontSize: 20,
                            color: Colors.grey,
                          ) ,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            prefixIcon: Icon(
                              Icons.email,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter you email address';
                            }
                          },
                          onFieldSubmitted: (String value)
                          {
                            //  print(value);
                          },
                          onChanged: (String value)
                          {
                            // print(value);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                            suffixIcon:
                           IconButton(
                               onPressed: (){

                                 ShopLoginCubit.get(context).ChangePasswordVisibility();
                               },
                               icon: Icon(
                                 ShopLoginCubit.get(context).suffix,

                               )
                           ),

                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: ShopLoginCubit.get(context).isPassword,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'password is too short';
                            }
                          },
                          onFieldSubmitted: (String value)
                          {
                            // print(value);

                          },
                          onChanged: (String value)
                          {
                            //print(value);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: ConditionalBuilder(
                            condition: state is! ShopLoginLoadingState,
                            builder: (context) => Container(
                              width: double.infinity,
                              height: 50,
                              color: Colors.deepOrange,
                              child: MaterialButton(
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),

                                  ),

                                  onPressed: ()
                                  {
                                    if(formKey.currentState!.validate()){
                                      ShopLoginCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text
                                      );
                                    }

                                  }
                              ),
                            ),
                            fallback:(context) => CircularProgressIndicator(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            TextButton(
                              onPressed: (){},
                              child: Text(
                                'Register Now',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
