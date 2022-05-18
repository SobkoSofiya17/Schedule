//
//  Main.swift
//  Schedule
//
//  Created by Тест on 09.03.2022.
//

import SwiftUI

struct Main: View {
 
    @State var login = ""
    @State var password = ""
    @State var group = ""
    @State var repassword = ""

    @State var show = false
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
                HStack{
                    
                    Button {
                        show = false
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8).frame(width: 110, height: 38, alignment: .center).foregroundColor(Color("red"))
                            Text("Сегодня").foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular, design: .default))
                        }
                    }
                    Button {
                        show = true
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8).frame(width: 110, height: 38, alignment: .center).foregroundColor(Color("grey"))
                            Text("Завтра").foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular, design: .default))
                        }
                    }

                }
                Divider().padding(.top, 10)
                if !show{
                ScrollView{
                VStack(spacing: 16){
                    CardView(time: "09:10 – 10:40", title: "Базы данных", teacher: "403, Ночка Е.И", color: "grey")
                  CardView(time: "10:50 – 12:20", title: "Проектная деятельность", teacher: "302, Ильина Е.Ю ", color: "red")
                    CardView(time: "12:50 – 14:20", title: "Физическая культура", teacher: "100, Виноградов В.В. ", color: "grey")
                    CardView(time: "14:50 – 16:20", title: "Учебная практика", teacher: "205, Тихонова С.В. ", color: "red")
                    CardView(time: "16:30 – 18:00", title: "Операционные системы", teacher: "303, Сапелов В.А.", color: "grey")
                }
                }.padding(.top, 10)
                }else{
                    ScrollView{
                    VStack(spacing: 16){
                        CardView(time: "09:10 – 10:40", title: "Учебная практика", teacher: "208, Тихонова С.В", color: "grey")
                        CardView(time: "09:10 – 10:40", title: "Учебная практика", teacher: "208, Тихонова С.В", color: "red")
                        CardView(time: "09:10 – 10:40", title: "Учебная практика", teacher: "208, Тихонова С.В", color: "grey")
                        CardView(time: "09:10 – 10:40", title: "Учебная практика", teacher: "208, Тихонова С.В", color: "red")
                        
                       
                    }
                    }.padding(.top, 10)
                }
                Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
           
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}

struct CardView:View{
    @State var time:String
    @State var title:String
    @State var teacher:String
    @State var color:String
    var body: some View{
        ZStack(alignment:.leading){
            RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1).frame(width: 342, height: 96, alignment: .center).background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color(color)))
            VStack(alignment:.leading, spacing: 8){
                Text(time).foregroundColor(.white)
                    .font(.system(size: 14, weight: .regular, design: .default))
                Text(title).foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold, design: .default))
                Text(teacher).foregroundColor(.white)
                    .font(.system(size: 12, weight: .regular, design: .default))
            }.padding(.leading, 30)
        }
    }
}
