//
//  BudgetPlanScreen.swift
//  Electra
//
//  Created by Rival Fauzi on 14/04/23.
//

import SwiftUI

struct BudgetPlanScreen: View {
    @ObservedObject var budgetingViewModel = BudgetingViewModel()
    @ObservedObject var toolViewModell = ToolViewModel()
    @State private var budgetInput: Double = 0
    @State private var tarifInput: Double = 0
    private let numberFormatter: NumberFormatter
    
    init() {
        numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale.current
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.zeroSymbol = ""
        //        Use Symbol
        //        numberFormatter.currencyCode = "IDR"
        //        numberFormatter.numberStyle = .currency
        //        numberFormatter.maximumFractionDigits = 2
        
        
    }
    var body: some View {
        
        NavigationStack{
            VStack {
                Image("cash_wallet")
                    .shadow(color: .white.opacity(0.6), radius: 40)
                    .position(.init(x: 200, y: 167))
                
                VStack {
                    ZStack{
                        Color.white.cornerRadius(32)
                            .edgesIgnoringSafeArea(.bottom)
                            .frame(minHeight: 312)
                        //                            .ignoresSafeArea()
                        VStack {
                            Grid(alignment: .leading){
                                GridRow{
                                    Text("Budget")
                                        .font(.system(size: 15, weight: .medium))
                                        .foregroundColor(CustomColor1.textColor)
                                    TextField("Target Tagihan Listrik/Bulan", value: $budgetInput, formatter: numberFormatter
                                    )
                                    .font(.system(size: 15, weight: .regular))
                                    .keyboardType(.decimalPad)
                                    .overlay(
                                        VStack{Divider().offset(x: 0, y: 15)})
                                    
                                }
                                .padding(.horizontal, 32)
                                .padding(.vertical, 22)
                                
                                GridRow{
                                    Text("Tarif")
                                        .font(.system(size: 15, weight: .medium))
                                        .foregroundColor(CustomColor1.textColor)
                                    TextField("Tarif Listrik/kWh", value: $tarifInput, formatter: numberFormatter)
                                    
                                        .font(.system(size: 15, weight: .regular))
                                        .keyboardType(.decimalPad)
                                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                                }
                                .padding(.horizontal, 32)
                                .padding(.vertical, 22)
                            }
                            
                            NavigationLink {
                                Home(budgetHomeViewmodel: budgetingViewModel, toolViewmodell: toolViewModell)
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                Text("Simpan")
                                    .frame(maxWidth: .infinity, minHeight: 58)
                            }
                            .frame(maxWidth: .infinity, minHeight: 58)
                            .background((budgetInput != 0 && tarifInput != 0) ? CustomColor1.boxColor : CustomColor1.disabledColor)
                            .foregroundColor(Color.white)
                            .font(.headline)
                            .cornerRadius(8)
                            .padding(.horizontal, 32)
                            .padding(.vertical, 22)
                            .disabled(budgetInput == 0 || tarifInput == 0)
                            .simultaneousGesture(TapGesture().onEnded({
                                budgetingViewModel.addBudgeting(tarif: tarifInput ?? 0, biaya: budgetInput ?? 0)
                                tarifInput = 0
                                budgetInput = 0
                                print(budgetingViewModel.budgetingList[0])
                            }))
                        }
                    }
                }
            }
            .background(
                CustomColor1.boxColor)
            .toolbar{
                ToolbarItem(placement: .principal)
                {
                    Text("Atur Budget")
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }.navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CustomColor1 {
    static let boxColor = Color("Box")
    static let boxColor1 = Color("Box 1")
    static let textColor = Color("text Color")
    static let disabledColor = Color("disable")
}

struct BudgetPlanScreen_Previews: PreviewProvider {
    static var previews: some View {
        BudgetPlanScreen()
    }
}
