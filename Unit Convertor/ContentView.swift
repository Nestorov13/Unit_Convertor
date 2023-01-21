//
//  ContentView.swift
//  Unit Convertor
//
//  Created by Borislav on 21.01.23.
//

import SwiftUI

struct ContentView: View {
    
    //  @State private var convertCToF:Double = 0.0
    //  @State private var tempInC: Double = 0.0
    //  @State private var tempInF: Double = 0.0
    @State private var tempNumber: Double = 0.0
    @State private var selectedTempUnits = "Celsius"
    @State private var selectedTempUnitsTo = "Celsius"
    let tempUnitsFrom = ["Celsius", "Fahrenheit", "Kelvin"]
    let tempUnitsTo = ["Celsius", "Fahrenheit", "Kelvin"]
    @FocusState private var numberFocused: Bool
    
    
    
    var conversionTempCToF:Int  {
        let calculatedTempToF = Double((tempNumber * 1.8) + 32)
        return Int(calculatedTempToF)
    }
    var conversionTempFToC:Int  {
        let calculatedTempToC = Double((tempNumber - 32) * 0.5556)
        return Int(calculatedTempToC)
    }
    var conversionTempCToK:Int  {
        let calculatedTempCToK = Double((tempNumber + 273.15))
        return Int(calculatedTempCToK)
    }
    var conversionTempKToC:Int  {
        let calculatedTempKToC = Double((tempNumber - 273.15))
        return Int(calculatedTempKToC)
    }
    var conversionTempKToF:Int  {
        let calculatedTempKToF = Double(((tempNumber * 1.8) + 32))+273.15
        return Int(calculatedTempKToF)
    }
    var conversionTempFToK:Int  {
        let calculatedTempFToK = Double(((tempNumber - 32) * 0.5556))-273.15
        return Int(calculatedTempFToK)
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    
                    Picker("Select Unit:", selection: $selectedTempUnits){
                        ForEach(tempUnitsFrom, id: \.self){
                            Text(($0))
                        }
                    }.pickerStyle(.segmented)
                    
                    TextField("Enter value: ", value: $tempNumber, format: .number) .keyboardType(.numberPad).focused($numberFocused)
                    Picker("Select Unit:", selection: $selectedTempUnitsTo){
                        ForEach(tempUnitsTo, id: \.self){
                            Text(($0))
                        }
                    }.pickerStyle(.segmented)
                    
                   if selectedTempUnits == "Celsius" && selectedTempUnitsTo == "Fahrenheit"
                    {
                       Text("Converted value is \(conversionTempCToF) ˚F")
                   }
                    if selectedTempUnits == "Celsius" && selectedTempUnitsTo == "Kelvin"
                     {
                        Text("Converted value is \(conversionTempCToK) ˚F")
                    }
                    if selectedTempUnits == "Fahrenheit" && selectedTempUnitsTo == "Celsius"
                     {
                        Text("Converted value is \(conversionTempFToC) ˚C")
                    }
                    if selectedTempUnits == "Kelvin" && selectedTempUnitsTo == "Celsius"
                     {
                        Text("Converted value is \(conversionTempKToC) ˚K")
                    }
                     if selectedTempUnits == "Kelvin" && selectedTempUnitsTo == "Fahrenheit"
                         {
                            Text("Converted value is \(conversionTempKToF) ˚F")
                        }
                     if selectedTempUnits == "Fahrenheit" && selectedTempUnitsTo == "Kelvin"
                         {
                            Text("Converted value is \(conversionTempFToK) ˚K")
                        }
                    
                    
                    
                    
                    
                    
                    
                    
                }header: {
                    Text("Temperature Conversion:")
                }
                .navigationTitle("Units converter")
                
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
