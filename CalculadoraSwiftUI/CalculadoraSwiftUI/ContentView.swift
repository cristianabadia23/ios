//
//  ContentView.swift
//  CalculadoraSwiftUI
//
//  Created by user207074 on 10/14/21.
//

import SwiftUI

struct ContentView: View {
    let grid = [
        ["AC","⌦","%","/"],
        ["7","8","9","X"],
        ["4","5","6","-"],
        ["1","2","3","+"],
        [".","0","","="]
    ]
    let operators = ["/","+","X","%"]
    @State var visibleWorking = ""
    @State var visibleResult = ""
    @State var showAlert = false
    var body: some View {
        VStack {
             HStack{
                 Spacer()
                Text(visibleWorking)
                    .padding()
                    .foregroundColor(Color.white)
                    .font(.system(size: 30, weight: .heavy))
                 
            }
             .frame(maxWidth:.infinity,maxHeight: .infinity)
            HStack{
                Spacer()
               Text(visibleResult)
                   .padding()
                   .foregroundColor(Color.white)
                   .font(.system(size: 50, weight: .heavy))
                
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            ForEach(grid,id: \.self){
                row in
                HStack {
                    ForEach(row,id: \.self){
                        cell in
                        Button(action: { buttonPressed(cell: cell)}, label:{
                            Text(cell)
                                .foregroundColor(buttonColor(cell))
                                .font(.system(size: 40, weight: .heavy))
                                .frame(maxWidth:.infinity,maxHeight: .infinity)
                        } )
                    }
                }
            }
        }
        .background(Color.black.ignoresSafeArea())
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Entrada no valida"),
                message: Text("Vuelva a introducir los datos"),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
    func buttonColor(_ cell: String) -> Color{
        if cell == "AC" || cell == "⌦" {
            return .red
        }
        if cell == "-" || cell == "=" || operators.contains(cell){
            return .orange
        }
        return .blue
    }
    
    func buttonPressed(cell:String){
        switch cell {
            case "AC":
                visibleResult = ""
                visibleWorking = ""
            case "⌦":
                visibleWorking = String(visibleWorking.dropLast())
            case "=":
                visibleResult = calcularResultado()
            case "-":
                addMinus()
            case "X","/","%","+":
                addOperator(cell)
            default:
                visibleWorking += cell
        }
    }
    func addOperator(_ cell:String){
        let last = String(visibleWorking.last!)
        if (operators.contains(last) || last == "-") && !visibleWorking.isEmpty{
            visibleWorking.removeLast()
        }
        visibleWorking+=cell
    }
    func addMinus(){
        if visibleWorking.isEmpty || visibleWorking.last! != "-"{
            visibleWorking += "-"
        }
    }
    func calcularResultado() -> String{
        if isValid(){
            var working = visibleWorking.replacingOccurrences(of: "%", with: "*0,01")
            working = visibleWorking.replacingOccurrences(of: "X", with: "*")
            let expresion = NSExpression(format: working)
            let result = expresion.expressionValue(with: nil, context: nil) as! Double
            showAlert = false
            return formatResult(val: result)
        }
        showAlert = true
        return " "
    }
    func isValid() -> Bool{
        if visibleWorking.isEmpty{
            return false
        }
        if visibleWorking.last! == "-" || operators.contains(String(visibleWorking.last!)){
            if visibleWorking.last! != "%" || visibleWorking.count == 1{
                return false
            }
        }
        showAlert = true
        return true
    }
    func formatResult(val: Double) -> String{
        if val.truncatingRemainder(dividingBy: 1) == 0{
            return String(format: "%.0f", val)
        }
        return String(format: "%.2f", val)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
