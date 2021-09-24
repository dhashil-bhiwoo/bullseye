//
//  PointsView.swift
//  bullseyes
//
//  Created by Dhashil Bhiwoo on 26/08/2021.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    
    var body: some View {
        
        let roundedValue: Int = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack(spacing: 10){
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) points \n 🎉🎉🎉")
            Button(action: {
                withAnimation{
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            }){
                ButtonText(text: "Start New Round")
            }
        }
            .padding()
            .frame(maxWidth:300)
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.roundRectCornerRadius)
            .shadow(radius:10, x:5, y:5)
            .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView(game: game, sliderValue: sliderValue, alertIsVisible: alertIsVisible)
        PointsView(game: game, sliderValue: sliderValue, alertIsVisible: alertIsVisible)
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView(game: game, sliderValue: sliderValue, alertIsVisible: alertIsVisible)
            .preferredColorScheme(.dark)
        PointsView(game: game, sliderValue: sliderValue, alertIsVisible: alertIsVisible)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
