//
//  SignIn.swift
//  Schedule
//
//  Created by Тест on 09.03.2022.
//

import SwiftUI

struct SignIn: View {
//    @Binding var transition:Int
    @State var login = ""
    @State var password = ""
    @State var error = false
    @State var errorFiled = false
    @State var msgError = ""
    
    @State var showSignUp = false
    @State var showMain = false
    
    @State var model = CheckUser()
    var body: some View {
        ZStack{
            Color("for")
            VStack{
                ZStack{
                    Circle().foregroundColor(Color("grey"))
                        .frame(width: 200, height: 200, alignment: .center)
                    Circle().foregroundColor(Color("red"))
                        .frame(width: 200, height: 200, alignment: .center).offset(x: 100, y: -50)
                    
                }.offset(x: -200, y: 0)
                Image("icon").resizable().frame(width: 297, height: 210, alignment: .center)
                
                VStack(alignment:.leading){
                    Text("Логин").foregroundColor(Color("grey"))
                        .font(.system(size: 14, weight: .semibold, design: .default))
                    ZStack{
                        RoundedRectangle(cornerRadius: 4).strokeBorder(Color("grey"), lineWidth: 2, antialiased: false)
                            .frame(width: UIScreen.main.bounds.width-50, height: 48, alignment: .center)
                        TextField("surname...", text: $login)
                            .frame(width: UIScreen.main.bounds.width-70, height: 48, alignment: .center)
                        
                    }
                }
                VStack(alignment:.leading){
                    Text("Пароль").foregroundColor(Color("grey"))
                        .font(.system(size: 14, weight: .semibold, design: .default))
                    ZStack{
                        RoundedRectangle(cornerRadius: 4).strokeBorder(Color("grey"), lineWidth: 2, antialiased: false)
                            .frame(width: UIScreen.main.bounds.width-50, height: 48, alignment: .center)
                        TextField("124...", text: $password).keyboardType(.asciiCapableNumberPad)
                            .frame(width: UIScreen.main.bounds.width-70, height: 48, alignment: .center)
                        
                    }
                }.padding(.top)
                Button {
                    error.toggle()
                } label: {
                    Text("Забыли пароль?").foregroundColor(Color("grey"))
                        .font(.system(size: 14, weight: .bold, design: .default))
                }.padding(.vertical,10).alert(isPresented: $error, content: {
                    Alert(title: Text("Внимание"), message: Text("Для предварительного просмотра используйте: Логин – admin, Пароль – 123123 "), dismissButton: Alert.Button.default(Text("OK")))
                })
                Button {
                    if password != "" && login != ""{
                        if password == "123123" && login == "admin"{
                            showMain.toggle()
                        }else{
                            msgError = "Неправильный логин или пароль"
                            errorFiled.toggle()
                        }
//                        print(model.model.count)
//                        for i in 0..<model.model.count{
//                            if model.model[i].username == login && model.model[i].password == password{
//                                showMain.toggle()
//                            }else{
//                                msgError = "Такого пользователя не сущетсвует"
//                                errorFiled.toggle()
//                            }
//                        }
                       
                    }else {
                        msgError = "Заполните все поля"
                        errorFiled.toggle()
                    }
                   
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 4).frame(width: UIScreen.main.bounds.width-50, height: 60, alignment: .center).foregroundColor(Color("red"))
                        Text("Войти").foregroundColor(Color.white)
                            .font(.system(size: 18, weight: .semibold, design: .default))
                    }
                }.alert(isPresented: $errorFiled) {
                    Alert(title: Text("Внимание"), message: Text(msgError), dismissButton: .default(Text("Oк")))
                }
                HStack(spacing:2){
                    Text("У вас нет аккаунта?").foregroundColor(Color("grey"))
                        .font(.system(size: 14, weight: .semibold, design: .default))
                    Button {
                        showSignUp.toggle()
                    } label: {
                        Text("Зарегестрируйтесь").foregroundColor(Color("grey"))
                            .font(.system(size: 14, weight: .semibold, design: .default))
                    }

                }.padding(.top, 27)
                Spacer()
            }
        }.onTapGesture {
            UIApplication.shared.keyWindow?.endEditing(true)
        }.edgesIgnoringSafeArea(.all).fullScreenCover(isPresented: $showSignUp) {
            SignUp()
        }.fullScreenCover(isPresented: $showMain) {
            Main()
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
