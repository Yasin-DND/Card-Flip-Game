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
    @State private var backgrounds = Array(repeating: Color.black, count: 9)
    @State private var matches = 0
    //Attributes
    private var betAmount = 5
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.black)
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(.white).opacity(0.9)
                .rotationEffect(Angle(degrees: 90))
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Image(systemName:"star.fill")
                    Text("SwiftUI Slots")
                        .bold()
                    Image(systemName:"star.fill")
                }.foregroundColor(.white)
                    .scaleEffect(2)
                    .offset(y :-50)
                Text("Credits : \(String(credits))")
                    .foregroundColor(.white)
                    .padding(.all,10)
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(20)
                    .offset(x: 122,y : -30)
                VStack{
                    HStack{
                        Spacer()
                        
                        CardView(symbol: $images[indexs[0]], background: $backgrounds[0])
                        CardView(symbol: $images[indexs[1]], background: $backgrounds[1])
                        CardView(symbol: $images[indexs[2]], background: $backgrounds[2])
                        
                        Spacer()
                    }.offset(y : -20)
                    HStack{
                        Spacer()
                        
                        CardView(symbol: $images[indexs[3]], background: $backgrounds[3])
                        CardView(symbol: $images[indexs[4]], background: $backgrounds[4])
                        CardView(symbol: $images[indexs[5]], background: $backgrounds[5])
                        
                        Spacer()
                    }.offset(y : -20)
                    HStack{
                        Spacer()
                        
                        CardView(symbol: $images[indexs[6]], background: $backgrounds[6])
                        CardView(symbol: $images[indexs[7]], background: $backgrounds[7])
                        CardView(symbol: $images[indexs[8]], background: $backgrounds[8])
                        
                        Spacer()
                    }.offset(y : -20)
                    
                    
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
                            .background(Color.white.opacity(0.4))
                            .cornerRadius(20)
                        
                    }.offset(y : 20)
                    Button(action: {
                        //Index Generation and update of images
                        self.spinForFiveThousand()
                    }) {
                        Text("Spin For $500")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all,10)
                            .padding([.leading,.trailing], 30)
                            .background(Color.white.opacity(0.4))
                            .cornerRadius(20)
                        
                    }.offset(y : 20)
                        .scaledToFit()
                    
                }
            }
        }
    }
    func spinForFive(){
        //Index Generation and update of images
        self.indexs[3] = Int.random(in: 0...images.count - 1)
        self.indexs[4] = Int.random(in: 0...images.count - 1)
        self.indexs[5] = Int.random(in: 0...images.count - 1)
        //Check Images and Update Score
        if match(3 , 4 , 5){
            self.credits += self.betAmount * 50
        }
        else{
            self.backgrounds = self.backgrounds.map{ _ in
                Color.black
            }
            self.credits -= self.betAmount
        }
    }
    func spinForFiveThousand(){
        self.matches = 0
        self.indexs = self.indexs.map{ _ in
            Int.random(in: 0...images.count - 1)
        }
        match(0 , 4 , 8)
        match(0 , 3 , 6)
        match(2 , 4 , 6)
        match(2 , 5 , 8)
        match(1 , 4 , 7)
        match(0 , 1 , 2)
        print(matches)
        if matches == 0{
            self.backgrounds = self.backgrounds.map{ _ in
                Color.black
            }
            
            self.credits -= self.betAmount * 50
        }else{
            self.credits += self.betAmount * 500 * matches
        }
        
    }
    func match(_ x : Int , _ y : Int , _ z : Int)->Bool{
        if indexs[x] == indexs[y] && indexs[y] == indexs[z]{
            print(x,y,z)
            self.matches += 1
            changeBackground(x, y, z)
            return true
        }else{
            return false
        }
    }
    func changeBackground(_ x : Int , _ y : Int , _ z : Int){
        print(x,y,z)
        backgrounds[x] = Color.green
        backgrounds[y] = Color.green
        backgrounds[z] = Color.green
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
