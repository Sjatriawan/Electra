//
//  OnBoarding_Screen.swift
//  Electra
//
//  Created by Nibras Fitri Zuhra on 14/04/23.
//

import SwiftUI

struct OnBoarding_Screen: View {
    @State private var currentTab = 0
    @StateObject var budgetingViewModel = BudgetingViewModel()
    @StateObject var toolViewModell = ToolViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    TabView(selection: $currentTab,
                            content:  {
                        ForEach(OnboardingData.list) { viewData in
                            OnboardingView(data: viewData)
                                .tag(viewData.id)
                        }
                    })
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
                
                HStack(spacing: 8){
                    ForEach(0 ..< 3) { i in
                        Color("Box")
                            .opacity(i == currentTab ? 1 : 0.5)
                            .frame(width: i == currentTab ? 20 : 8, height: 8)
                            .clipShape(RoundedRectangle(cornerRadius:20))
                    }
                }.padding(.top, 30)
                    .padding(.horizontal, 30)
                VStack{
                    NavigationLink(destination: BudgetingPlan(budgetingViewModel: budgetingViewModel, toolViewModell: toolViewModell)) {
                        Text("Mulai")
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color("Box"))
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .cornerRadius(8)
                    }.padding(.bottom, 60)
                        .padding(.top)
                        .padding(.horizontal)
                }
            }
        }
    }
}

struct OnboardingData: Hashable, Identifiable {
    let id: Int
    let objectImage: String
    let primaryText: String
    let secondaryText: String
    
    static let list: [OnboardingData] = [
        OnboardingData(id: 0, objectImage: "image_0", primaryText: "Khawatir dengan tagihan listrikmu?",
                       secondaryText: "Jangan panik! Ayo kita hitung tagihan listrik bulananmu"),
        OnboardingData(id: 1, objectImage: "image_1", primaryText: "Hitung estimasi biaya dengan mudah", secondaryText: "Kamu bisa hitung estimasi biaya listrik bulanan agar sesuai dengan anggaran biaya bulananmu"),
        OnboardingData(id: 2, objectImage: "image_2", primaryText: "Tentukan rencana tagihan listrikmu", secondaryText: "Dengan membuat rencana, kamu bisa menghindari tingginya tagihan listrik di akhir bulan, loh!")
    ]
}

struct OnboardingView: View {
    var data: OnboardingData
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Spacer()
                Image(data.objectImage)
                    .resizable()
                    .frame(width: 260, height: 285)
                    .scaledToFill()
                    .offset(x: 0, y: 50)
            }
            
            Spacer()
            Spacer()
            VStack(alignment: .center, spacing: 35){
                Text(data.primaryText)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color("titleOnboarding"))
                    .multilineTextAlignment(.center)
                
                Text(data.secondaryText)
                    .foregroundColor(Color("captionOnboarding"))
                    .multilineTextAlignment(.center)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        
    }
}


struct OnBoarding_Screen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding_Screen()
    }
}
