//
//  View_Network_Profile.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/24/23.
//

import SwiftUI

struct View_Network_Profile: View {
    
    let myColor = Color("darkBg")
    
    let myColor1 = Color("darkBgLighter")
    
    let myColor2 = Color("darkBgDarker")
    
    let pfps = ["profile", "pro1", "pr2"]
    
    @State var isLiked: Bool = false
    
    @State var showAbout: Bool = false
    
    @State var pageDisabled: Bool = false
    
    @State var showPfp: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack (alignment: .leading) {
                ScrollView {
                    
                    Spacer()
                        .frame(height: 100)
                    
                    VStack (spacing: 16) {
                        
                        VStack (spacing: 0) {
                            Image("profile")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100, alignment: .center)
                                .clipShape(Circle())
                                .onTapGesture {
                                    pageDisabled = true
                                    showPfp = true
                                }
                            
                            Text("Abhinav,  20")
                                .font(.system(size: 24))
                                .fontDesign(.rounded)
                                .fontWeight(.semibold)
                                .foregroundColor(.accentColor)
                                .padding(.top, 8)
                            
                            Text("He/Him")
                                .font(.system(size: 14))
                                .fontDesign(.rounded)
                                .fontWeight(.semibold)
                                .foregroundColor(.secondary)
                            
                            
                            HStack (spacing: 32) {
                                Image(systemName: "fleuron")
                                    .foregroundColor(.accentColor.opacity(0.8))
                                    .font(.system(size: 20))
                                
                                Image(systemName: "pencil.slash")
                                    .foregroundColor(.accentColor.opacity(0.8))
                                    .font(.system(size: 20))
                                
                                Image(systemName: "menucard")
                                    .foregroundColor(.accentColor.opacity(0.8))
                                    .font(.system(size: 20))
                            }
                            .padding(.top, 14)
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack (spacing: 4) {
                            Text("Founder/CEO at Kobble")
                                .font(.system(size: 16))
                                .fontDesign(.rounded)
                                .fontWeight(.semibold)
                                .foregroundColor(.accentColor.opacity(0.8))
                            
                            Text("Junior at University of Pennsylvania")
                                .font(.system(size: 16))
                                .fontDesign(.rounded)
                                .fontWeight(.semibold)
                                .foregroundColor(.accentColor.opacity(0.8))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 6)
                    }
                    .frame(maxWidth: .infinity)
                    
                    
                    HStack (spacing: 72) {
                        Image(systemName: "heart.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.accentColor)
                        
                        
                        Image(systemName: "gamecontroller.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.accentColor)
                        
                        Image(systemName: "message.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.accentColor)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 24)
                    
                    VStack (alignment: .leading) {
                        
                        Text("Basic info")
                            .font(.system(size: 16))
                            .fontDesign(.rounded)
                            .fontWeight(.semibold)
                            .foregroundColor(.accentColor)
                            .padding(.horizontal)
                            .padding(.top, showAbout ? 24 : 14)
                        
                        VStack(spacing: 8) {
                            HStack {
                                Text("5' 8\" (173 cm)")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                                    .foregroundColor(.accentColor.opacity(0.8))
                                    .padding(8)
                                    .background {
                                        RoundedRectangle(cornerRadius: 24)
                                            .foregroundColor(myColor2)
                                    }
                                
                                Text("Hindu")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                                    .foregroundColor(.accentColor.opacity(0.8))
                                    .padding(8)
                                    .background {
                                        RoundedRectangle(cornerRadius: 24)
                                            .foregroundColor(myColor2)
                                    }
                                
                                Text("Doesn't smoke")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                                    .foregroundColor(.accentColor.opacity(0.8))
                                    .padding(8)
                                    .background {
                                        RoundedRectangle(cornerRadius: 24)
                                            .foregroundColor(myColor2)
                                    }
                                
                                Spacer()
                                
                            }
                            
                            HStack {
                                Text("Drinks socially")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                                    .foregroundColor(.accentColor.opacity(0.8))
                                    .padding(8)
                                    .background {
                                        RoundedRectangle(cornerRadius: 24)
                                            .foregroundColor(myColor2)
                                    }
                                
                                Text("Regular exerciser")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                                    .foregroundColor(.accentColor.opacity(0.8))
                                    .padding(8)
                                    .background {
                                        RoundedRectangle(cornerRadius: 24)
                                            .foregroundColor(myColor2)
                                    }
                                
                                Spacer()
                                
                            }
                            
                            HStack {
                                Text("Quality time")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                                    .foregroundColor(.accentColor.opacity(0.8))
                                    .padding(8)
                                    .background {
                                        RoundedRectangle(cornerRadius: 24)
                                            .foregroundColor(myColor2)
                                    }
                                
                                Text("Long term commitment")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                                    .foregroundColor(.accentColor.opacity(0.8))
                                    .padding(8)
                                    .background {
                                        RoundedRectangle(cornerRadius: 24)
                                            .foregroundColor(myColor2)
                                    }
                                
                                Spacer()
                                
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                        
                        
                        if showAbout {
                            Text("About me")
                                .font(.system(size: 16))
                                .fontDesign(.rounded)
                                .fontWeight(.semibold)
                                .foregroundColor(.accentColor)
                                .padding(.horizontal)
                                .padding(.top, 12)
                            
                            Text("Hi, I am Abhinav, I am a junior at Penn looking for some fun!\n\nPS: I am on the app because I hate my girlfriend 😝")
                                .font(.system(size: 16))
                                .fontDesign(.rounded)
                                .fontWeight(.medium)
                                .foregroundColor(.accentColor.opacity(0.8))
                                .padding(.horizontal)
                                .padding(.top, 4)
                            
                            Text("Interests")
                                .font(.system(size: 16))
                                .fontDesign(.rounded)
                                .fontWeight(.semibold)
                                .foregroundColor(.accentColor)
                                .padding(.horizontal)
                                .padding(.top, 12)
                            
                            VStack(spacing: 8) {
                                HStack {
                                    Text("Formula 1")
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.accentColor.opacity(0.8))
                                        .padding(8)
                                        .background {
                                            RoundedRectangle(cornerRadius: 24)
                                                .foregroundColor(myColor2)
                                        }
                                    
                                    Text("Football")
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.accentColor.opacity(0.8))
                                        .padding(8)
                                        .background {
                                            RoundedRectangle(cornerRadius: 24)
                                                .foregroundColor(myColor2)
                                        }
                                    
                                    Text("Esports")
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.accentColor.opacity(0.8))
                                        .padding(8)
                                        .background {
                                            RoundedRectangle(cornerRadius: 24)
                                                .foregroundColor(myColor2)
                                        }
                                    
                                    Spacer()
                                    
                                }
                                
                                HStack {
                                    Text("Thriller movies")
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.accentColor.opacity(0.8))
                                        .padding(8)
                                        .background {
                                            RoundedRectangle(cornerRadius: 24)
                                                .foregroundColor(myColor2)
                                        }
                                    
                                    Text("Sci-fi movies")
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.accentColor.opacity(0.8))
                                        .padding(8)
                                        .background {
                                            RoundedRectangle(cornerRadius: 24)
                                                .foregroundColor(myColor2)
                                        }
                                    
                                    Spacer()
                                    
                                }
                                
                                HStack {
                                    Text("Pop music")
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.accentColor.opacity(0.8))
                                        .padding(8)
                                        .background {
                                            RoundedRectangle(cornerRadius: 24)
                                                .foregroundColor(myColor2)
                                        }
                                    
                                    Text("Hip-Hop music")
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.accentColor.opacity(0.8))
                                        .padding(8)
                                        .background {
                                            RoundedRectangle(cornerRadius: 24)
                                                .foregroundColor(myColor2)
                                        }
                                    
                                    Spacer()
                                    
                                }
                            }
                            .padding(.horizontal)
                            .padding(.top, 8)
                            
                            Spacer()
                                .frame(height: 15)
                            
                        }
                    }
                    .frame(maxWidth: .infinity, minHeight: 190, maxHeight: 750)
                    .background {
                        RoundedRectangle(cornerRadius: 24)
                            .foregroundColor(myColor)
                    }
                    .overlay (alignment: .bottom) {
                        if !showAbout {
                            LinearGradient(colors: [myColor, myColor1, Color.black], startPoint: .top, endPoint: .bottom)
                                .frame(height: 38)
                                .mask(LinearGradient(gradient: Gradient(colors: [myColor, myColor, .black, .clear]), startPoint: .bottom, endPoint: .top))
                        }
                    }
                    .padding()
                    .padding(.top, 12)
                    .onTapGesture {
                        showAbout = true
                    }
                    
                    
                    VStack {
                        
                        HStack (spacing: 12) {
                            Color("darkBg")
                                .frame(maxWidth: .infinity, minHeight: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            Color("darkBg")
                                .frame(maxWidth: .infinity, minHeight: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            Color("darkBg")
                                .frame(maxWidth: .infinity, minHeight: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .padding(.horizontal)
                        
                        Color("darkBg")
                            .frame(maxWidth: .infinity, minHeight: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding(.horizontal)
                            .padding(.top, 4)
                        
                        HStack (spacing: 12) {
                            Color("darkBg")
                                .frame(maxWidth: .infinity, minHeight: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            Color("darkBg")
                                .frame(maxWidth: .infinity, minHeight: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            Color("darkBg")
                                .frame(maxWidth: .infinity, minHeight: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .padding(.horizontal)
                        .padding(.top, 4)
                        
                        Color("darkBg")
                            .frame(maxWidth: .infinity, minHeight: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding(.horizontal)
                            .padding(.top, 4)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .overlay(alignment: .top) {
                View_Network_Profile_TopBar()
            }
            .disabled(pageDisabled)
            
            if showPfp {
                VStack (alignment: .leading, spacing: 0) {
                    Button {
                        showPfp = false
                        pageDisabled = false
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    .padding(.top, 72)
                    
                    TabView {
                        ForEach(pfps, id: \.self) {i in
                            Image(i)
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 24))
                                .scaledToFit()
                                .padding(.horizontal)
                                .padding(.bottom, 16)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                }
                .padding(.bottom, 24)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Material.ultraThinMaterial)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .gesture(showPfp == true ? DragGesture() : nil)
    }
    
}

/**
 
 if showPfp {
 VStack (alignment: .leading, spacing: 0) {
 Button {
 showPfp = false
 pageDisabled = false
 } label: {
 Image(systemName: "xmark")
 .font(.system(size: 24))
 .foregroundColor(.white)
 }
 .padding(.horizontal)
 .padding(.top)
 
 TabView {
 ForEach(pfps, id: \.self) {i in
 Image(i)
 .resizable()
 .clipShape(RoundedRectangle(cornerRadius: 24))
 .scaledToFit()
 .padding(.horizontal)
 .padding(.bottom, 16)
 }
 }
 .tabViewStyle(PageTabViewStyle())
 }
 .frame(maxWidth: .infinity, maxHeight: .infinity)
 .background(Material.ultraThinMaterial)
 }
 
 **/

struct View_Network_Profile_Previews: PreviewProvider {
    static var previews: some View {
        View_Network_Profile()
    }
}

struct View_Network_Profile_TopBar: View {
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Text("Profile")
                    .fontDesign(.rounded)
                    .fontWeight(.semibold)
                    .foregroundColor(.accentColor)
                    .padding(.bottom, 8)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 80)
        .background(Color.black)
    }
}

/**
 
 var body: some View {
 VStack (alignment: .leading) {
 ScrollView {
 Spacer()
 .frame(height: 50)
 VStack {
 HStack {
 Image("profile")
 .resizable()
 .scaledToFill()
 .frame(width: 110, height: 110, alignment: .center)
 .clipShape(Circle())
 
 Spacer()
 
 HStack (spacing: 48) {
 VStack (spacing: 12) {
 Image(systemName: !isLiked ? "heart" : "heart.fill")
 .font(.system(size: 36))
 .foregroundColor(!isLiked ? .pink : .pink)
 .fontWeight(.semibold)
 .onTapGesture {
 isLiked.toggle()
 }
 }
 
 VStack (spacing: 12) {
 Image(systemName: "gamecontroller.fill")
 .font(.system(size: 36))
 .foregroundColor(.accentColor)
 }
 }
 .padding(.leading, 24)
 .padding(.top, 12)
 
 Spacer()
 }
 .padding()
 .padding(.leading, 8)
 
 VStack (alignment: .leading, spacing: 4) {
 Text("Abhinav,  20")
 .font(.system(size: 24))
 .fontDesign(.rounded)
 .fontWeight(.semibold)
 
 Text("He/Him")
 .font(.system(size: 16))
 .fontDesign(.rounded)
 .fontWeight(.semibold)
 
 Text("Software engineer at Meta")
 .font(.system(size: 16))
 .fontDesign(.rounded)
 .fontWeight(.semibold)
 .padding(.top, 12)
 
 Text("Junior at University of Pennsylvania")
 .font(.system(size: 16))
 .fontDesign(.rounded)
 .fontWeight(.semibold)
 }
 .frame(maxWidth: .infinity, alignment: .topLeading)
 .padding(.horizontal)
 .padding(.leading, 8)
 
 VStack (alignment: .leading, spacing: 12) {
 
 Text("About me")
 .font(.system(size: 16))
 .fontDesign(.rounded)
 .fontWeight(.semibold)
 .opacity(0.75)
 .padding(.top, 4)
 
 Text("Hi, I am Abhinav, I am a junior at Penn looking for some fun!\n\nPS: I am on the app because I hate my girlfriend 😝")
 .font(.system(size: 16))
 .fontDesign(.rounded)
 .fontWeight(.semibold)
 
 
 Text("Basic info")
 .font(.system(size: 16))
 .fontDesign(.rounded)
 .fontWeight(.semibold)
 .opacity(0.75)
 .padding(.top, 24)
 
 VStack(spacing: 16) {
 HStack {
 Text("5' 8\" (173 cm)")
 .font(.system(size: 14))
 .fontWeight(.semibold)
 .fontDesign(.rounded)
 .padding(8)
 .background {
 RoundedRectangle(cornerRadius: 24)
 .foregroundColor(.pink.opacity(0.4))
 }
 
 Text("Hindu")
 .font(.system(size: 14))
 .fontWeight(.semibold)
 .fontDesign(.rounded)
 .padding(8)
 .background {
 RoundedRectangle(cornerRadius: 24)
 .foregroundColor(.accentColor.opacity(0.4))
 }
 
 Text("Doesn't smoke")
 .font(.system(size: 14))
 .fontWeight(.semibold)
 .fontDesign(.rounded)
 .padding(8)
 .background {
 RoundedRectangle(cornerRadius: 24)
 .foregroundColor(.pink.opacity(0.4))
 }
 
 Spacer()
 
 }
 
 HStack {
 Text("Drinks socially")
 .font(.system(size: 14))
 .fontWeight(.semibold)
 .fontDesign(.rounded)
 .padding(8)
 .background {
 RoundedRectangle(cornerRadius: 24)
 .foregroundColor(.accentColor.opacity(0.4))
 }
 
 Text("Regular exerciser")
 .font(.system(size: 14))
 .fontWeight(.semibold)
 .fontDesign(.rounded)
 .padding(8)
 .background {
 RoundedRectangle(cornerRadius: 24)
 .foregroundColor(.pink.opacity(0.4))
 }
 
 Spacer()
 
 }
 
 HStack {
 Text("Quality time")
 .font(.system(size: 14))
 .fontWeight(.semibold)
 .fontDesign(.rounded)
 .padding(8)
 .background {
 RoundedRectangle(cornerRadius: 24)
 .foregroundColor(.pink.opacity(0.4))
 }
 
 Text("Long term commitment")
 .font(.system(size: 14))
 .fontWeight(.semibold)
 .fontDesign(.rounded)
 .padding(8)
 .background {
 RoundedRectangle(cornerRadius: 24)
 .foregroundColor(.accentColor.opacity(0.4))
 }
 
 Spacer()
 
 }
 
 }
 
 Text("My traits")
 .font(.system(size: 16))
 .fontDesign(.rounded)
 .fontWeight(.semibold)
 .opacity(0.75)
 .padding(.top, 24)
 
 
 
 Spacer()
 
 
 }
 .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
 .padding()
 .padding(.leading, 8)
 .background {
 Color.pink.opacity(0.3)
 }
 .padding(.top, 16)
 }
 .frame(maxWidth: .infinity, maxHeight: .infinity)
 }
 .frame(maxWidth: .infinity, maxHeight: .infinity)
 }
 .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
 .overlay(alignment: .top) {
 View_Network_Profile_TopBar()
 }
 }
 
 
 
 
 
 **/


/**
 
 VStack (alignment: .leading, spacing: 16) {
 Text("Pictures")
 .font(.system(size: 20))
 .fontDesign(.rounded)
 .fontWeight(.bold)
 .foregroundColor(.secondary)
 
 ScrollView (.horizontal, showsIndicators: false) {
 HStack (spacing: 16) {
 Image("pr2")
 .resizable()
 .scaledToFill()
 .frame(width: 150, height: 250)
 .clipShape(RoundedRectangle(cornerRadius: 14))
 
 Image("pro1")
 .resizable()
 .scaledToFill()
 .frame(width: 150, height: 250)
 .clipShape(RoundedRectangle(cornerRadius: 14))
 
 Image("profile")
 .resizable()
 .scaledToFill()
 .frame(width: 150, height: 250)
 .clipShape(RoundedRectangle(cornerRadius: 14))
 }
 }
 
 }
 .frame(maxWidth: .infinity, alignment: .topLeading)
 .padding()
 .padding(.leading, 8)
 
 
 **/
