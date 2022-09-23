//
//  ContentView.swift
//  ButtonGolorStateBinding
//
//  Created by N N on 23/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var backgroundColor = Color.white
    
    var body: some View {
        
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            HStack {
                MyButtons(buttonImage: "wand.and.stars", buttonName: "Red", buttonColor: .red, otherColor: .red, colorSwitch: $backgroundColor)
                MyButtons(buttonImage: "leaf", buttonName: "Green", buttonColor: .green, otherColor: .green, colorSwitch: $backgroundColor)
                MyButtons(buttonImage: "paintbrush", buttonName: "Blue", buttonColor: .blue, otherColor: .blue, colorSwitch: $backgroundColor)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyButtons: View {
    
    var buttonImage: String
    var buttonName: String
    var buttonColor: Color
    var otherColor: Color
    
    @Binding var colorSwitch: Color
//    @Binding could have been called as @State above > backgroundColor
    var body: some View {
        
        Button {
            colorSwitch = otherColor
        } label: {
            Image(systemName: buttonImage)
            Text(buttonName)
        }
        .padding()
        .background(buttonColor)
        .cornerRadius(30)
        .foregroundColor(.white)
        .fontWeight(.bold)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(.white, lineWidth: 2)
        )
    }
}
