//
//  InfoPage.swift
//  Listrik
//
//  Created by Ghita Aulia Hidayat on 11/04/23.
//

import SwiftUI

struct InfoPage: View {
    var captColor: UIColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
    var imgColor: UIColor = #colorLiteral(red: 0.323367238, green: 0.5219809413, blue: 0.9421694875, alpha: 1)
    @State var urlColor: UIColor = #colorLiteral(red: 0.3098039216, green: 0.4980392157, blue: 0.8862745098, alpha: 1)
    
    var body: some View {
        VStack{
            ScrollView{
                ZStack(alignment: .top){
                    Rectangle()
                        .foregroundColor(Color(captColor))
                        .frame(height: 260)
                        .cornerRadius(16)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 12)
                    VStack{
                        ZStack(alignment: .center){
                            Rectangle()
                                .foregroundColor(Color(imgColor))
                                .frame(height: 150)
                                .cornerRadius(12)
                                .padding(.horizontal, 32)
                                .padding(.top, 16)
                            Image(systemName: "lamp.desk.fill")
                                .font(.system(size: 70))
                                .foregroundColor(.white)
                                .padding(.top, 20)
                        }
                        HStack(alignment: .center){
                            VStack (alignment: .leading, spacing: 4){
                                Text("Daya Alat Elektronik")
                                    .font(.system(size: 17, weight: .semibold, design: .default))
                                    .foregroundColor(Color("TextColor"))
                                Text("Daftar perkiraan daya atau beban alat elektronik dalam satuan Watt")
                                    .font(.system(size: 10, weight: .thin, design: .default))
                                    .foregroundColor(Color("TextColor"))
                            }
                            Spacer()
                            firstURL(urlColor: $urlColor)
                        }
                        .padding(.horizontal, 32)
                    }
                }
                ZStack(alignment: .top){
                    Rectangle()
                        .foregroundColor(Color(captColor))
                        .frame(height: 260)
                        .cornerRadius(16)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 12)
                    VStack{
                        ZStack(alignment: .center){
                            Rectangle()
                                .foregroundColor(Color(imgColor))
                                .frame(height: 150)
                                .cornerRadius(12)
                                .padding(.horizontal, 32)
                                .padding(.top, 16)
                            Image(systemName: "banknote.fill")
                                .font(.system(size: 70))
                                .foregroundColor(.white)
                                .padding(.top, 20)
                        }
                        HStack(alignment: .center){
                            VStack (alignment: .leading, spacing: 4){
                                Text("Daftar Tarif Listrik")
                                    .font(.system(size: 17, weight: .semibold, design: .default))
                                    .foregroundColor(Color("TextColor"))
                                Text("Daftar tarif listrik per kWh berdasarkan jenis golongan listrik")
                                    .font(.system(size: 10, weight: .thin, design: .default))
                                    .foregroundColor(Color("TextColor"))
                            }
                            Spacer()
                            secondURL(urlColor: $urlColor)
                        }
                        .padding(.horizontal, 32)
                        .padding(.top, 12)
                    }
                }
                ZStack(alignment: .top){
                    Rectangle()
                        .foregroundColor(Color(captColor))
                        .frame(height: 260)
                        .cornerRadius(16)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 12)
                    VStack{
                        ZStack(alignment: .center){
                            Rectangle()
                                .foregroundColor(Color(imgColor))
                                .frame(height: 150)
                                .cornerRadius(12)
                                .padding(.horizontal, 32)
                                .padding(.top, 16)
                            Image(systemName: "bolt.fill")
                                .font(.system(size: 70))
                                .foregroundColor(.white)
                                .padding(.top, 20)
                        }
                        HStack(alignment: .center){
                            VStack (alignment: .leading, spacing: 4){
                                Text("Apakah Kamu Tahu?")
                                    .font(.system(size: 17, weight: .semibold, design: .default))
                                    .foregroundColor(Color("TextColor"))
                                Text("Simak informasi mengenai komponen dalam perhitungan tagihan listrik")
                                    .font(.system(size: 10, weight: .thin, design: .default))
                                    .foregroundColor(Color("TextColor"))
                            }
                            Spacer()
                            thirdURL(urlColor: $urlColor)
                        }
                        .padding(.horizontal, 32)
                    }
                }
            }
        }
        .padding(.top, 16)
    }
}

struct firstURL: View{
    @Binding var urlColor: UIColor
    var body: some View{
        Link(destination: URL(string: "https://balsam-bird-0c8.notion.site/Daya-Alat-Elektronik-9914b27119f84d3989a6d65f56e5c534")!){
            Text("Baca")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 100, height: 44)
                .background(Color(urlColor))
                .cornerRadius(12)
        }
    }
}

struct secondURL: View {
    @Binding var urlColor: UIColor
    var body: some View {
        Link(destination: URL(string: "https://balsam-bird-0c8.notion.site/Daftar-Tarif-Listrik-478ce3f6862148c1aa8110721d3ca3f2")!) {
            Text("Baca")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 100, height: 44)
                .background(Color(urlColor))
                .cornerRadius(12)
        }
    }
}

struct thirdURL: View {
    @Binding var urlColor: UIColor
    var body: some View {
        Link(destination: URL(string: "https://balsam-bird-0c8.notion.site/Apakah-Kamu-Tahu-b19ab4dbf6df4beba30837da5a158ff2")!) {
            Text("Baca")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 100, height: 44)
                .background(Color(urlColor))
                .cornerRadius(12)
        }
    }
}

struct InfoPage_Previews: PreviewProvider {
    static var previews: some View {
        InfoPage()
    }
}
