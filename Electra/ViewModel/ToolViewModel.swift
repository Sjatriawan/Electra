//
//  ToolViewModel.swift
//  Electra
//
//  Created by M Yogi Satriawan on 12/04/23.
//

import Foundation

class ToolViewModel: ObservableObject {
    @Published var tools: [Tool] = []

    let budgetPlan = 300000 //Rencana biaya listrik
    let electricityTariff = 1262 // Tarif listrik per KWh
    
    var indexing: Int = 0

    func addTool(name: String, quantity: Int, power: Int, usageTimePerHour: Int, repeatDays: Int) {
        let newTool = Tool(index: indexing, name: name, quantity: quantity, power: power, usageTimePerHour: usageTimePerHour, repeatDays: repeatDays)
        tools.append(newTool)
        saveTools()
        indexing += 1
    }

    func getIndex(index: Int) -> Int {
        var resultIndex: Int = -1
        
        for i in 0..<tools.count {
            if (tools[i].index == index){
                resultIndex = i
            }
        }
        
        return resultIndex
    }
    
    func editTool(index: Int, name: String, quantity: Int, power: Int, usageTimePerHour: Int, repeatDays: Int) {
        let editTool = Tool(index: index, name: name, quantity: quantity, power: power, usageTimePerHour: usageTimePerHour, repeatDays: repeatDays)
        var editedIndex: Int = getIndex(index: index)
        
        tools[editedIndex] = editTool
        saveTools()
    }
    
    func getDetail(index: Int) -> Tool {
        var resultData: Tool = Tool(index: 0, name: "", quantity: 0, power: 0, usageTimePerHour: 0, repeatDays: 0)
        
        for i in tools {
            if (i.index == index){
                resultData = i
            }
        }
        
        return resultData
    }

    func saveTools() {
        if let encodedData = try? JSONEncoder().encode(tools) {
            UserDefaults.standard.set(encodedData, forKey: "tools")
        }
    }
    
    func deleteTool(index: Int) {
        var deletedIndex: Int = getIndex(index: index)
        tools.remove(at: deletedIndex)
        saveTools()
    }

    func loadTools() {
        if let data = UserDefaults.standard.data(forKey: "tools") {
            if let decodedData = try? JSONDecoder().decode([Tool].self, from: data) {
                self.tools = decodedData
            }
        }
    }

    // Calculate budget per day
    func calculateUsagePerday(tool:Tool) -> Double {
        let Wh = Double(tool.power) * Double(tool.quantity) * Double(tool.usageTimePerHour)
        let kWh = Wh/1000
        let budgetDay = kWh * Double(electricityTariff)
        
        return budgetDay
    }
    // Calculate budget per month
    func calculateUsageCost(tool: Tool) -> Double {
        let budgetDay = calculateUsagePerday(tool: tool)
        let budgetMonth = budgetDay * Double(tool.repeatDays * 4)
        
        return budgetMonth
    }
    
    func calculateKwhPerDay(tool: Tool) -> Double {
        let Wh = Double(tool.power) * Double(tool.quantity) * Double(tool.usageTimePerHour)
        let kWh = Wh/1000
        
        return kWh
    }
    
    func calculateKwhPerMonth(tool:Tool) -> Double {
        let kWhPerDay = calculateKwhPerDay(tool: tool)
        let kWhPerMonth = kWhPerDay * Double(tool.repeatDays * 4)
        
        return kWhPerMonth
    }
/*
    let Wh = Double(tool.power) * Double(tool.quantity) * Double(tool.usageTimePerHour)
    let kWh = Wh/1000
    let budgetDay = kWh * Double(electricityTariff)
    let Whm = Wh * Double.(tool.repeatDays)
    let kWhm = Whm / 1000
    let budgetMonth = kWhm * Double(electricityTariff)
    let sisaBudget = budgetPlan - budgetMonth
    let totalDaya = budgetPlan/Double(electricityTariff)
    let sisaDaya = totalDaya - kWhm
    let persentase = (kWhm/totalDaya)*100
 
    */

    var formattedTotalCost: String {
        let totalCost = calculateTotalUsageCost()
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "id_ID")
        return formatter.string(from: NSNumber(value: totalCost)) ?? ""
    }

    func calculateTotalUsageCost() -> Double {
        var totalCost = 0.0
        for tool in tools {
            let cost = calculateUsageCost(tool: tool)
            totalCost += cost
        }
        return totalCost
    }
    
    func calculateTotalKwh() -> Double {
        var totalKwh = 0.0
        for tool in tools {
            let kWh = calculateKwhPerMonth(tool: tool)
            totalKwh += kWh
        }
        return totalKwh
    }
    
    func customFormat(_ number: Double) -> String  {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let decimalValue = number.truncatingRemainder(dividingBy: 1)
        
        if (decimalValue == 0){
            formatter.minimumFractionDigits = 0
        } else {
            formatter.minimumFractionDigits = 2
        }
        
        let formattedString = formatter.string(from: NSNumber(value: number))!
        return formattedString
    }
}
