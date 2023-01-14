//
//  ContentView.swift
//  Cities
//
//  Created by Данила on 05.01.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = Model()
//    var city = "sfmvkdnvmkmk"
//    var letter = "K"
    @State private var cityPlayer = ""
    @State private var anim: Bool = false
    @State private var lastLetter: Bool = false
    var body: some View {
        ZStack {
            Color(.sRGB, red: 57/255, green: 57/255, blue: 57/255, opacity: 1)
            VStack(spacing: 40) {
                VStack(spacing: 17) {
                    Text("Ответ приложения")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold, design: .default))
                    Text(model.cityApp)
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .frame(width: 280, height: 65, alignment: .center)
                        .background()
                        .border(Color(.sRGB, red: 0/255, green: 137/255, blue: 214/255, opacity: 1), width: 4)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .textCase(.uppercase)
                }
                
                VStack(spacing: 17) {
                    Text("Буква")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold, design: .default))
                    Text(String(model.cityApp.last ?? " "))
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .frame(width: 58, height: 40, alignment: .center)
                        .background()
                        .border(Color(.sRGB, red: 158/255, green: 214/255, blue: 0, opacity: 1), width: 4)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .textCase(.uppercase)
                }
                
                VStack(spacing: 17) {
                    Text("Введите город")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold, design: .default))
                    TextField(text: $cityPlayer) { }
                    .foregroundColor(.black)
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .frame(width: 280, height: 65, alignment: .center)
                    .background()
                    .border(Color(.sRGB, red: 214/255, green: 128/255, blue: 0, opacity: 1), width: 4)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .textCase(.uppercase)
                    .rotationEffect(.degrees(anim ? 15 : 0))
                    .animation(.default, value: (anim ? 15 : 0))
                    .rotationEffect(.degrees(anim ? -15 : 0))
                    .animation(.spring(), value: (anim ? 15 : 0))
                    .rotationEffect(.degrees(anim ? 15 : 0))
                    .animation(.spring(), value: (anim ? 15 : 0))
                    .rotationEffect(.degrees(anim ? -15 : 0))
                    .animation(.spring(), value: (anim ? 15 : 0))
                    
                    if anim {
                        Text("Этот город написан неверно или уже был назван")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .animation(.spring(), value: (anim ? 15 : 0))
                    }
                    else { }
                    if lastLetter {
                        Text("Город должен начинаться на букву \(String(model.cityApp.last!))")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .animation(.spring(), value: (anim ? 15 : 0))
                    }
                    else { }
                    
                }
                
                Button {
                    if !model.checkLetter(city: cityPlayer) {
                        lastLetter = true
                    }
                    else {
                        lastLetter = false
                        if model.checkCity(city: cityPlayer) {
                            model.sendCity(city: cityPlayer)
                            model.changeCityApp()
                            anim = false
                            cityPlayer = ""
                        }
                        else {
                            anim = true
                        }
                    }
                    
                } label: {
                    Text("Отправить")
                        .foregroundColor(.black)
                        .frame(width: 151, height: 40, alignment: .center)
                        .background()
                        .cornerRadius(12)
                }
            }
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Model())
    }
}
