//
//  ContentView.swift
//  Temperature
//
//  Created by Nikita Volozhanin on 26.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var inputTemperature = ""
    @State private var outputTemperature = ""
    @State private var selectedUnit = 0
    
    private let temperatureUnits = ["Celsius", "Fahrenheit", "Kalvin"]
    
    var convertedTemperature: Double{
        let input = Double(inputTemperature) ?? 0
        let inputUnit = temperatureUnits[selectedUnit]
        
        switch inputUnit {
            case "Celsius":
                return input * 9/5 + 32
        case "Fahrenheit":
            return (input - 32) * (5/9)
        case "Kalvin":
            return input - 273.15
        default:
            return 0
        }
    }
    
   
    
    var body: some View {
        VStack {
           TextField("Input tempterature", text: $inputTemperature)
                .textFieldStyle(.roundedBorder)
                .padding()
            Picker("Choose units", selection: $selectedUnit){
                ForEach(0 ..< temperatureUnits.count){
                    Text(self.temperatureUnits[$0])
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            Button(action: {
                outputTemperature = String(format: "%.2f", convertedTemperature)
            }){
                Text("Конвертировать")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Text("Temperature is \(outputTemperature)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
