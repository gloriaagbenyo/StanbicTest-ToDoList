//
//  ProfileHeader.swift
//  InstagramProfile
//
//  Created by Stephen Dowless on 2/22/20.
//  Copyright © 2020 Stephan Dowless. All rights reserved.
//

import SwiftUI

struct ProfileHeader: View {
    let gradient = Gradient(colors: [.blue, .purple])
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                VStack {
                    Image("venom-10")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .clipped()
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .padding(.top, 44)
                    
                    Text("Eddie Brock").font(.system(size: 20)).bold().foregroundColor(.white)
                        .padding(.top, 12)
                    
                    Text("@venom").font(.system(size: 18)).foregroundColor(.white)
                    .padding(.top, 4)
                }
                Spacer()
            }
            Spacer()
        }
        .background(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

