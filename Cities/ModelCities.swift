//
//  ModelCities.swift
//  Cities
//
//  Created by Данила on 05.01.2023.
//

import Foundation





class Model: ObservableObject {
    
    
    //MARK: Variables
    @Published var arrayOfCities: Array<City> = JsonCity().loadJson()
    @Published var array: Array<String> = JsonCity().loadJson().map() { $0.city }
    @Published var cityApp: String = JsonCity().loadJson().randomElement()!.city
    @Published var cityPlayer: String = ""
    @Published var win: Bool = false
    var blockedCities: Array<String> = []
    
    //MARK: Functions
    func sendCity(city: String) {
        cityPlayer = city
        blockedCities.append(city.uppercased())
        blockedCities.append(cityApp.uppercased())
        
    }
//    func createArray() {
//        for i in arrayOfCities {
//            array.append(i.city)
//        }
//    }
    
    func checkCity(city: String) -> Bool {
        if array.contains(city) && !blockedCities.contains(city.uppercased()) {
            print("SCKMSV")
            return true
        }
        print("DCDCDC")
        return false
    }
    
    func lastLetter() -> String {
        return String(cityPlayer.last ?? " ")
    }
    
    func checkLetter(city: String) -> Bool {
        cityPlayer = city
        let a = cityApp.last ?? " "
        let b = cityPlayer.first?.lowercased() ?? " "
        return String(a) == b
    }
    
    func changeCityApp() {
        let letter = cityPlayer.last!
        var count = 0
        if letter != " " {
            for i in 0..<arrayOfCities.count-1 {
                if String(arrayOfCities[i].city.first!) == letter.uppercased() {
                    if !blockedCities.contains(arrayOfCities[i].city.uppercased()) {
                        count += 1
                        cityApp = arrayOfCities[i].city
                        blockedCities.append(arrayOfCities[i].city.uppercased())
                    }
                }
            }
        }
        if count == 0 {
            win = true
        }
    }
}
