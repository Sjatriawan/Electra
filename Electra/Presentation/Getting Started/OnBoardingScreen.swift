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
        NavigationView{
            VStack{
//                TabView(selection: $index){
//                    ForEach(0 ..< 3) { i in
//                        Image("image_\(i)")
//                            .resizable()
//                            .frame(width: 250, height: 250)
//                            .padding()
//                            .aspectRatio( contentMode: .fit)
//
//                    }
//                }
//                .tabViewStyle(PageTabViewStyle())
                
    
                HStack(spacing: 4){
                    ForEach(0 ..< 3) { i in
                        Color(.black)
                            .opacity(i == index ? 1 : 0.5)
                            .frame(width: i == index ? 8 : 16, height: 8)
                            .clipShape(RoundedRectangle(cornerRadius:20))
                    }
                }
                VStack{
                    Text("Electricity")
                        .fontWeight(.bold)
                        .padding()
                    
                    Text("Kamu bisa hitung estimasi biaya listrik bulanan agar sesuai dengan anggaran biaya bulananmu")
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                    
                }.padding()
                
               
                
                NavigationLink(destination: SettingUp()) {
                    Text("Mulai")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.blue)
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
