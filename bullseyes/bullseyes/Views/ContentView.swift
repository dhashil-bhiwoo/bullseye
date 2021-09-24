//
//  ContentView.swift
//  bullseyes
//
//  Created by Dhashil Bhiwoo on 23/08/2021.
//  Main content of the app
//  Containing the @State of variable, can be bind @Binding in other Views files
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    
    @State private var sliderValue = Constants.Slider.sliderDefaultValue
    
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible{
                    PointsView(game: $game, sliderValue: $sliderValue, alertIsVisible: $alertIsVisible)
                        .transition(.scale)
                } else {
                    HitMeButton(game: $game, sliderValue: $sliderValue, alertIsVisible: $alertIsVisible)
                        .transition(.scale)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
            }
        }
    }
}

struct InstructionsView: View {
    
    @Binding var game: Game
    
    var body: some View{
        VStack{
            InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing,30.0)
            
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    
    @Binding var sliderValue: Double
    
    var body: some View{
        HStack {
            SliderLabelText(text: "1")
            
            Slider(value: $sliderValue, in: Constants.Slider.sliderMinValue...Constants.Slider.sliderMaxValue)
            
            SliderLabelText(text: "100")
        }
        .padding()
    }
    
}

struct HitMeButton: View {
    
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    
    var body: some View{
        Button(action: {
            //print("Hello")
            withAnimation{
                alertIsVisible = true
            }
        }) {
            Text("Hit Me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3),Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
        /*.alert(isPresented: $alertIsVisible, content: {
            let roundedValue: Int = Int(sliderValue.rounded())
            let points = game.points(sliderValue: roundedValue)
            return Alert(title: Text("Hello there!"), message: Text("Slider value is \(roundedValue).\n" + "You scored \(points) points this round."), dismissButton: .default(Text("Awesome")){
                game.startNewRound(points: points)
            })
        })*/
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
