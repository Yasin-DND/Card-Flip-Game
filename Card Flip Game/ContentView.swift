//
//  ContentView.swift
//  Card Flip Game
//
//  Created by Mac on 18/08/2563 BE.
//  Copyright © 2563 DND. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //Mark :- State Variables
    @State private var images = ["apple" , "cherry" , "star"]
    @State private var indexs = Array(repeating: 0, count: 9)
    @State private var credits = 1000
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
    //Attributes
    private var betAmount = 5
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(.black).opacity(0.9)
                //.foregroundColor(Color(red: 0.75, green: 0.1, blue: 0.3))
                .rotationEffect(Angle(degrees: 90))
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Image(systemName:"star.fill")
                    
                    Text("SwiftUI Slots")
                        .bold()
                    Image(systemName:"star.fill")
                }.scaleEffect(2)
                    .offset(y :-50)
                Text("Credits : \(String(credits))")
                    .foregroundColor(.white)
                    .padding(.all,10)
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(20)
                    .offset(x: 122,y : -30)
                VStack{
                    HStack{
                        Spacer()
                        
                        CardView(symbol: $images[indexs[0]], background: $backgrounds[0])
                        CardView(symbol: $images[indexs[1]], background: $backgrounds[1])
                        CardView(symbol: $images[indexs[2]], background: $backgrounds[2])
                        
                        Spacer()
                    }.offset(y : -30)
                    HStack{
                        Spacer()
                        
                        CardView(symbol: $images[indexs[3]], background: $backgrounds[3])
                        CardView(symbol: $images[indexs[4]], background: $backgrounds[4])
                        CardView(symbol: $images[indexs[5]], background: $backgrounds[5])
                        
                        Spacer()
                    }.offset(y : -30)
                    HStack{
                        Spacer()
                        
                        CardView(symbol: $images[indexs[6]], background: $backgrounds[6])
                        CardView(symbol: $images[indexs[7]], background: $backgrounds[7])
                        CardView(symbol: $images[indexs[8]], background: $backgrounds[8])
                        
                        Spacer()
                    }.offset(y : -30)
                    
                    
                }
                HStack{
                    Button(action: {
                        self.spinForFive()
                    }) {
                        Text("Spin For $5")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all,10)
                            .padding([.leading,.trailing], 30)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(20)
                        
                    }.offset(y : 20)
                    Button(action: {
                        //Index Generation and update of images
                        self.indexs = self.indexs.map{ _ in
                            Int.random(in: 0...self.images.count - 1)
                        }
                        //Check Images and Update Score
                        if self.indexs[0] == self.indexs[1] && self.indexs[1] == self.indexs[2]{
                            
                            self.credits += self.betAmount * 500
                            
                            self.backgrounds = self.backgrounds.map{ _ in
                                Color.green
                            }
                        }else{
                            self.backgrounds = self.backgrounds.map{ _ in
                                Color.white
                            }
                            
                            self.credits -= self.betAmount
                        }
                    }) {
                        Text("Spin For $500")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all,10)
                            .padding([.leading,.trailing], 30)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(20)
                        
                    }.offset(y : 20)
                    
                }
            }
        }
    }
    func spinForFive(){
        //Index Generation and update of images
        self.indexs = self.indexs.map{ _ in
            Int.random(in: 0...self.images.count - 1)
        }
        //Check Images and Update Score
        if self.indexs[3] == self.indexs[4] && self.indexs[4] == self.indexs[5]{
            
            self.credits += self.betAmount * 5
            
            self.backgrounds = self.backgrounds.map{ _ in
                Color.green
            }
        }else{
            self.backgrounds = self.backgrounds.map{ _ in
                Color.white
            }
            self.credits -= self.betAmount
        }
    }
    func spinForFiveThousand(){
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
