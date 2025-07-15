//
//  About-us.swift
//  EcoMiles
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI

struct About_us: View
{
    var body: some View
    {
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
                      HStack(alignment: .top, spacing: 16)
                      {
                          Image("ria")
                              .resizable()
                              .scaledToFill()
                              .frame(width: 120, height: 250)
                              .clipShape(RoundedRectangle(cornerRadius: 12))

                          Text("Hello, my name is Ria Garlapadu! My journey in programming started with a genuine curiosity and love for coding. I started my coding journey by taking robotics in middle school, where I learned C++, then by taking Computer Math in high school, where I familiarized myself with Java. Since then, I’ve gone on to pursue my love for coding through programs like Kode With Klossy and Girls Who Code, where I learned about website development, data science, machine learning, and mobile app development. I’ve also always had a passion for environmental sustainability, and making EcoMiles was a clear solution to try and mitigate some of the negative effects that stem from our commuting patterns.")
                              .font(.system(size: 10))
                              .multilineTextAlignment(.center)
                              .fixedSize(horizontal: false, vertical: true)
               
                      }
                      .padding()
                      .background(Rectangle().foregroundColor(Color("box")))
                      .cornerRadius(15)
                      .shadow(radius: 12)
                      .padding(.horizontal)
                      .padding()
                       
                       //Founder #2: Maariya
                       HStack
                       {
                           Image("maariya")
                               .resizable()
                               .scaledToFill()
                               .frame(width: 120, height: 250)
                               .clipShape(RoundedRectangle(cornerRadius: 12))
                           
                            Text("Hi! My name is Maariya Qureshi and I’m one of the co-founders of EcoMiles. My path in coding was something that came to me instantly in Middle School while taking introductory courses to Computer Science, where I learned python and C++. I went from coding my first “Hello World!” to coding projects beyond my imagination in different settings including high school and in platforms that gave me the opportunity to do so like Kode With Klossy. EcoMiles is a very important project to me because it allows people just like me to become more accountable for our decisions in transportation technologies through an app like this!")
                               .font(.system(size: 10))
                               .multilineTextAlignment(.center)
                               .fixedSize(horizontal: false, vertical: true)
                           
                       }
                       .padding()
                       .background(Rectangle().foregroundColor(Color("box")))
                       .cornerRadius(15)
                       .shadow(radius: 12)
                       .padding(.horizontal)
                       .padding()
                       
                       //Founder #3: Avani
                       HStack(alignment: .top, spacing: 16)
                       {
                           Image("avani")
                               .resizable()
                               .scaledToFill()
                               .frame(width: 120, height: 250)
                               .clipShape(RoundedRectangle(cornerRadius: 12))
                           
                            Text("Hii! I’m Avani Shanbhag! My coding experience started in Kode With Klossy back in 2022, where I completed the Web Dev camp. Since then, I’ve dabbled into several areas related to CS, completing several more classes and camps in the field. I’ve always had a passion for helping the environment, and I’ve participated in and started initiatives to protect our planet, from organizing local cleanups to launching awareness campaigns about sustainable living. I’m always looking for new ways to use technology to make a meaningful impact, especially when it comes to preserving the environment for future generations.")
                                    .font(.system(size: 10))
                                    .multilineTextAlignment(.center)
                                    .fixedSize(horizontal: false, vertical: true)
                           
                       }
                       .padding()
                       .background(Rectangle().foregroundColor(Color("box")))
                       .cornerRadius(15)
                       .shadow(radius: 12)
                       .padding(.horizontal)
                       .padding()
                       
                       //Founder #4: Anjali
                       HStack
                       {
                           Image("anjali")
                               .resizable()
                               .scaledToFill()
                               .frame(width: 120, height: 250)
                               .clipShape(RoundedRectangle(cornerRadius: 12))
                           
                            Text("I’m Anjali Joseph! I’m majoring in biomedical engineering and have always loved coding. I have been a member of Kode with Klossy since 2021 where I created a website that focused on the importance of music in mental health and again in 2024 where I created a website that highlighted the disparities of women in finance using interactive graphics. I am also passionate about the environment and have helped in clubs such as Project Greens Schools National Youth Council and Green’s Club.")
                               .font(.system(size: 10))
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true)
                       }
                       .padding()
                       .background(Rectangle().foregroundColor(Color("box")))
                       .cornerRadius(15)
                       .shadow(radius: 12)
                       .padding(.horizontal)
                       .padding()
                       
                       
            }
        }
    }
}

#Preview {
    About_us()
}
