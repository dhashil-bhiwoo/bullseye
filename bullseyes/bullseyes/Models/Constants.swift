//
//  Models.swift
//  bullseyes
//
//  Created by Dhashil Bhiwoo on 26/08/2021.
//  File to declare constant values, to be used throughout the app/code
//

import Foundation
import UIKit

enum Constants {
    enum General{
        public static let strokeWidth = CGFloat(2.0)
        public static let roundedViewLength = CGFloat(56.0)
        public static let roundRectViewWidth = CGFloat(68.0)
        public static let roundRectViewHeight = CGFloat(56.0)
        public static let roundRectCornerRadius = CGFloat(21.0)
    }
    
    enum Slider{
        public static let sliderMinValue = 1.00
        public static let sliderMaxValue = 100.00
        public static let sliderDefaultValue = 50.0
    }
    
    enum Leaderboard{
        public static let leaderboardScoreColWidth = CGFloat(50.0)
        public static let leaderboardDateColWidth = CGFloat(170.0)
        public static let leaderboardMaxRowWidth = CGFloat(480.0)
    }
}
