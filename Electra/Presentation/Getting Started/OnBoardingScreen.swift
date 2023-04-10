//
//  OnBoardingScreen.swift
//  Electra
//
//  Created by M Yogi Satriawan on 05/04/23.
//

import SwiftUI

let customFont = "SF-Pro-Text-Bold-Italic"

struct OnBoardingScreen: View {
    @State var index = 0
    var body: some View {
        NavigationStack{
            VStack{
                TabView(selection: $index){
                    ForEach(0 ..< 3) { i in
                        Image("image_\(i)")
                            .resizable()
                            .frame(width: 250, height: 250)
                            .padding()
                            .aspectRatio( contentMode: .fit)
                        
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                
                VStack{
                    Text("Khawatir dengan tagihan listrikmu?")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color("textOnboarding"))
                        .padding()

                    Text("Jangan panik! Ayo kita hitung tagihan listrik bulananmu")
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)

                }.padding()
                
                HStack(spacing: 8){
                    ForEach(0 ..< 3) { i in
                        Color("Box")
                            .opacity(i == index ? 1 : 0.5)
                            .frame(width: i == index ? 20 : 8, height: 8)
                            .clipShape(RoundedRectangle(cornerRadius:20))
                    }
                }
                
                NavigationLink(destination: BudgetingPlan()) {
                    Text("Mulai")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color("Box"))
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .cornerRadius(8)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            
        }
        
        
    }
}

struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreen()
    }
}
