//
//  About-us.swift
//  EcoMiles
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI

struct About_us: View {
    var body: some View {
        ZStack
        {
            VStack
            {
                //Title + Subtitle
                VStack
                {
                    Text("About Us")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Text("Meet the team!")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                }
                
                //Founder #1: Ria
                HStack
                {
                    Image("ria")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                    
                    VStack {
                        Text("Ria Garlapadu")
                        
                        Text("description here")
                    }
                    
                }
                .background(Rectangle()
                .foregroundColor(Color("black")))
                .cornerRadius(15)
                .shadow(radius: 15)
                .padding()
                
                //Founder #2: Maariya
                HStack {
                    
                    Image("maariya")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                    
                    VStack {
                        Text("Maariya Qureshi")
                        Text("description here")
                    }
                }
                .background(Rectangle()
                .foregroundColor(Color("black")))
                .cornerRadius(15)
                .shadow(radius: 15)
                .padding()
                
                //Founder #3: Avani
                HStack {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
                }
                
                //Founder #4: Anjali
                HStack {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
                }
                
                
            }
        }
    }
}

#Preview {
    About_us()
}
