//
//  CardView.swift
//  Card Flip Game
//
//  Created by Mac on 19/08/2563 BE.
//  Copyright © 2563 DND. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @Binding var symbol : String
    @Binding var background : Color
    
    var body: some View {
       Image(symbol)
       .resizable()
       .aspectRatio(1,contentMode: .fit)
       .background(background.opacity(0.3))
       .cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("apple"), background: Binding.constant(Color.green))
    }
}
