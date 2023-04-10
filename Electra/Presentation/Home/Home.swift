//
//  ContentView.swift
//  Listrik
//
//  Created by Ghita Aulia Hidayat on 04/04/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView{
            VStack(spacing:38){
                BlueBox()
                ScrollView{
                    HomeView()
                }
            }
            .edgesIgnoringSafeArea(.top)
            .tabItem{
                Image(systemName: "house")
                Text("Home")
            }
            Text("Info")
                .tabItem{
                    Image(systemName: "questionmark.circle")
                    Text("Info")
                }
        }
        .onAppear(){
            UITabBar.appearance().isTranslucent = false
            UITabBar.appearance().unselectedItemTintColor = UIColor(Color("IconTabBar"))
//            UITabBar.appearance().backgroundColor = #colorLiteral(red: 0.2980392157, green: 0.4901960784, blue: 0.8588235294, alpha: 1)
        }
        .accentColor(Color("Box"))
//        .accentColor(.white)
    }
}
struct BlueBox: View{
    var body: some View{
        VStack(spacing: 22){
            HStack{
                Text("Atur Budgetmu")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 22, weight: .regular, design: .default))
                        .foregroundColor(.white)
                    
                })
            }
            HStack{
                VStack{
                    VStack(alignment: .leading, spacing: 8){
                        Text("Biaya listrikmu saat ini")
                            .font(.system(size: 15, weight: .medium, design: .default))
                            .foregroundColor(Color("IconTabBar"))
                        HStack (alignment: .bottom){
                            Text("Rp")
                                .font(.system(size: 12, weight: .bold, design: .default))
                                .foregroundColor(.white)
                            Text("90000")
                                .font(.system(size: 22, weight: .bold, design: .default))
                                .foregroundColor(.white)
                        }
                        HStack{
                            Text("Sisa budget")
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .foregroundColor(Color("IconTabBar"))
                            Text("110,000")
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .foregroundColor(.white)
                        }
                        HStack{
                            Text("Sisa daya listrik")
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .foregroundColor(Color("IconTabBar"))
                            Text("73.3kWh")
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .foregroundColor(.white)
                        }
                    }
                }
                Spacer()
                ProgressBar()
            }
            .frame(width: 328, height: 129)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 64)
        .background(LinearGradient(gradient: Gradient(colors: [Color("ShadowBox1"), Color("ShadowBox2")]), startPoint: .top, endPoint: .center))
        .cornerRadius(32)
        .shadow(color: Color("Shadow"), radius: 24, x: 8, y: 2)
    }
}

struct HomeView: View{
    var body: some View{
        VStack(spacing: 22){
            HStack{
                Text("Peralatan Elektronik")
                    .font(.headline)
                    .foregroundColor(Color("TextColor"))
                Spacer()
                Button(
                    action: {
                        
                    },
                    label: {
                        Text("Tambah")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 121, height: 44)
                            .background(Color("tambahButtonColor"))
                            .cornerRadius(12)
                    })
            }
            .padding(.horizontal, 32)
            VStack(spacing: 22){
                List()
                List()
                List()
                List()
                List()
                List()
                List()
                List()
                List()
                List()
            }
            .padding(.horizontal, 32)
        }
    }
}

struct ProgressBar: View {
    var body: some View{
        ZStack{
            Circle()
                .stroke(
                    Color.white.opacity(0.55),
                    lineWidth: 14)
            Circle()
                .trim(from: 0, to: 0.45)
                .stroke(
                    Color("tambahButtonColor"), style: StrokeStyle(lineWidth: 16, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))
            VStack{
                Text("45%")
                    .font(.system(size: 22, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                Text("60/133.3kWh")
                    .font(.system(size: 11, weight: .regular, design: .default))
                    .foregroundColor(.white)
            }
            
        }
    }
}

struct List: View{
    var body: some View{
        HStack(spacing: 16){
            Text("4x")
                .font(.system(size: 12, weight: .medium, design: .default))
                .foregroundColor(Color("TextColor"))
            VStack(alignment: .leading, spacing: 4){
                Text("Lampu Rumah")
                    .font(.system(size: 15, weight: .medium, design: .default))
                    .foregroundColor(Color("TextColor"))
                Text("12 jam/hari")
                    .font(.caption)
                    .italic()
                    .foregroundColor(Color("TextColor"))
            }
            Spacer()
            Text("Rp10,800")
                .font(.system(size: 15, weight: .semibold, design: .default))
                .foregroundColor(Color("TextColor"))
            Button(action: {
                
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 22, weight: .regular, design: .default))
                    .foregroundColor(Color("Chevron"))
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
