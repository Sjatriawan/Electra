//
//  ContentView.swift
//  practice1
//
//  Created by Nibras Fitri Zuhra on 31/03/23.
//

import SwiftUI

struct BudgetingPlan: View {
    @StateObject var budgetingViewModel = BudgetingViewModel()
    @StateObject var toolViewModell = ToolViewModel()
    @State private var tarif: String = ""
    @State private var biaya: String = ""
    @State private var navigateToHome = false

    
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
                                        .foregroundColor(CustomColor.textColor)
                                    TextField("Target Tagihan Listrik/Bulan", text: $biaya)
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
                                        .foregroundColor(CustomColor.textColor)
                                    TextField("Tarif Listrik/kWh", text: $tarif)
                                        .font(.system(size: 15, weight: .regular))
                                        .keyboardType(.decimalPad)
                                        .overlay(VStack{Divider().offset(x: 0, y: 15)})

                                }
                                .padding(.horizontal, 32)
                                .padding(.vertical, 22)
                            }
                            
                            NavigationLink {
                                Home()
                                    .navigationBarBackButtonHidden(true)
                            }
                            
                        label: {
                            Text("Simpan")
                                .frame(maxWidth: .infinity, minHeight: 58)
                        }
                        
                        VStack{
                            Button(action: {
                                budgetingViewModel.addBudgeting(tarif: Double(tarif) ?? 0, biaya: Double(biaya) ?? 0)
                                tarif = ""
                                biaya = ""
                                navigateToHome = true
                            }, label: {
                                Text("Save")
                                    .frame(maxWidth: .infinity, maxHeight: 58)
                                    .background(CustomColor.boxColor)
                                    .foregroundColor(Color.white)
                                    .font(.headline)
                                    .cornerRadius(8)
                                    .padding(.horizontal, 32)
                                
                            }).background(
                                NavigationLink(
                                    destination:
                                        Home(
                                            budgetHomeViewmodel: budgetingViewModel, toolViewmodell: toolViewModell), isActive: $navigateToHome) {
                                EmptyView()
                            })
                            
                        }
                    }
                }
            }
            .background(
                CustomColor.boxColor)
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

struct CustomColor {
    static let boxColor = Color("Box")
    static let boxColor1 = Color("Box 1")
    static let textColor = Color("text Color")
    static let disabledColor = Color("disable")
}

struct BudgetingPlan_Previews: PreviewProvider {
    static var previews: some View {
        BudgetingPlan()
    }
}

