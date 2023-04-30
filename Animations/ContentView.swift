//
//  ContentView.swift
//  Animations
//
//  Created by Nilesh Rathod on 30/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var stepperAnimationAmount = 1.0
    @State private var rotationAnimationAmount = 0.0
    
    var body: some View {
        VStack {
            
            Button("Tap me"){
                withAnimation (.interpolatingSpring(stiffness: 5, damping: 1)){
                    rotationAnimationAmount += 360
                }
            }
            .padding(20)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(rotationAnimationAmount), axis: (x:0, y:1, z:0))
            Spacer()
            Section {
                Stepper("Scale Amount", value: $stepperAnimationAmount.animation(
                    .easeInOut(duration: 2)
                    .repeatCount(3, autoreverses: true)), in: 1...10)
                Spacer()
                    .frame(height: 50)
                Button("Tap me"){
                    stepperAnimationAmount += 1
                }
                .padding(20)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(stepperAnimationAmount)
            }
            Spacer()
            Button("Tap me"){
            }
            .padding(20)
            .background(.green)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 2).repeatForever(autoreverses: false) ,
                        value: animationAmount)
                
            )
            .onAppear{
                animationAmount = 2
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
