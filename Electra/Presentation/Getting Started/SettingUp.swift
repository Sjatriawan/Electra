//
//  SettingUp.swift
//  Electra
//
//  Created by M Yogi Satriawan on 05/04/23.
//

import SwiftUI




struct SettingUp: View {
    @State private var budgetInput:String = ""
    @State private var tarifInput:String = ""
    var body: some View {
        NavigationView{
            ZStack{
                Color
                    .blue
                    .ignoresSafeArea()
                VStack{
                    
                    Image("image_1")
                        .resizable()
                        .padding()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.blue)
                    
                    
                    Text("Yuk atur budget yang kamu punya dan berapa tarif listrik mu")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(Color.gray)
                        TextField("Budget", text: $budgetInput)
                    }
                    .keyboardType(.numberPad)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                    
                    
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(Color.gray)
                        TextField("Tarif", text:$tarifInput)
                    }
                    .padding(.vertical, 14)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                    
                    
                    
                    NavigationLink(destination: OnBoardingScreen()) {
                        Text("Simpan")
                        
                    }.frame(maxWidth: .infinity, maxHeight: 50)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .fontWeight(.bold)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 1.5)
                        )
                    
                    
                    
                }.padding()
 
                Spacer(minLength: 10)
                
            }

        }
    }
}

struct SettingUp_Previews: PreviewProvider {
    static var previews: some View {
        SettingUp()
    }
}
