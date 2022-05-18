//
//  SignUp.swift
//  Schedule
//
//  Created by Тест on 09.03.2022.
//

import SwiftUI

struct SignUp: View {
  
    @State var login = ""
    @State var password = ""
    @State var group = ""
    @State var repassword = ""
    @State var error = false
    @State var errorFiled = false
    @State var msgError = ""
    
    @State var showSignIn = false
    @State var showMain = false
    
    @StateObject var model = CheckUser()
    var body: some View {
        ZStack{
            Color("for")
            VStack{
                HStack{
                    ZStack{
                        Circle().foregroundColor(Color("grey"))
                            .frame(width: 200, height: 200, alignment: .center)
                        Circle().foregroundColor(Color("red"))
                            .frame(width: 200, height: 200, alignment: .center).offset(x: 100, y: -50)
                        
                    }.offset(x: -110, y: 0)

                    Image("icon").resizable().frame(width: 174, height: 119, alignment: .center)
                }
                VStack(alignment:.leading){
                    Text("Логин").foregroundColor(Color("grey"))
                        .font(.system(size: 14, weight: .semibold, design: .default))
                    ZStack{
                        RoundedRectangle(cornerRadius: 4).strokeBorder(Color("grey"), lineWidth: 2, antialiased: false)
                            .frame(width: UIScreen.main.bounds.width-50, height: 48, alignment: .center)
                        TextField("surname...", text: $login)
                            .frame(width: UIScreen.main.bounds.width-70, height: 48, alignment: .center)
                        
                    }
                }.padding(.top, 20)
                VStack(alignment:.leading){
                    Text("Группа").foregroundColor(Color("grey"))
                        .font(.system(size: 14, weight: .semibold, design: .default))
                    ZStack{
                        RoundedRectangle(cornerRadius: 4).strokeBorder(Color("grey"), lineWidth: 2, antialiased: false)
                            .frame(width: UIScreen.main.bounds.width-50, height: 48, alignment: .center)
                        TextField("ИСиП_22...", text: $group)
                            .frame(width: UIScreen.main.bounds.width-70, height: 48, alignment: .center)
                        
                    }
                }.padding(.top, 18)
                VStack(alignment:.leading){
                    Text("Пароль").foregroundColor(Color("grey"))
                        .font(.system(size: 14, weight: .semibold, design: .default))
                    ZStack{
                        RoundedRectangle(cornerRadius: 4).strokeBorder(Color("grey"), lineWidth: 2, antialiased: false)
                            .frame(width: UIScreen.main.bounds.width-50, height: 48, alignment: .center)
                        TextField("124...", text: $password).keyboardType(.asciiCapableNumberPad)
                            .frame(width: UIScreen.main.bounds.width-70, height: 48, alignment: .center)
                        
                    }
                }.padding(.top, 19)
                VStack(alignment:.leading){
                    Text("Повторите пароль").foregroundColor(Color("grey"))
                        .font(.system(size: 14, weight: .semibold, design: .default))
                    ZStack{
                        RoundedRectangle(cornerRadius: 4).strokeBorder(Color("grey"), lineWidth: 2, antialiased: false)
                            .frame(width: UIScreen.main.bounds.width-50, height: 48, alignment: .center)
                        TextField("124...", text: $repassword).keyboardType(.asciiCapableNumberPad)
                            .frame(width: UIScreen.main.bounds.width-70, height: 48, alignment: .center)
                        
                    }
                }.padding(.top, 19)
                Button {
//                    error.toggle()
                } label: {
                    Text("Забыли пароль?").foregroundColor(Color("grey"))
                        .font(.system(size: 14, weight: .bold, design: .default))
                }.padding(.vertical,10).opacity(0)
                Button {
                    if password != "" && login != "" && repassword != "" && group != "" {
                        if password == repassword{
                            model.model.append(Users(username: login, password: password))
                        showMain.toggle()
                        }else{
                            msgError = "Пароли не совпадают"
                            errorFiled.toggle()
                        }
                    }else {
                        msgError = "Заполните все поля"
                        errorFiled.toggle()
                    }
                  
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 4).frame(width: UIScreen.main.bounds.width-50, height: 60, alignment: .center).foregroundColor(Color("red"))
                        Text("Зарегестрироватся").foregroundColor(Color.white)
                            .font(.system(size: 18, weight: .semibold, design: .default))
                    }
                }.alert(isPresented: $errorFiled) {
                    Alert(title: Text("Внимание"), message: Text(msgError), dismissButton: .default(Text("Oк")))
                }
                HStack(spacing:2){
                    Text("У вас уже есть аккаунт?").foregroundColor(Color("grey"))
                        .font(.system(size: 14, weight: .regular, design: .default))
                    Button {
                        showSignIn.toggle()
                    } label: {
                        Text("Войдите").foregroundColor(Color("grey"))
                            .font(.system(size: 14, weight: .semibold, design: .default))
                    }

                }.padding(.top, 27)
                Spacer()
            }
        }.edgesIgnoringSafeArea(.all).fullScreenCover(isPresented: $showSignIn) {
            SignIn()
        }.fullScreenCover(isPresented: $showMain) {
            Main()
        }.onTapGesture {
            UIApplication.shared.keyWindow?.endEditing(true)
        }
    
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
