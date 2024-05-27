//
//  WeatherButton.swift
//  sui-weather
//
//  Created by Egor Tushev on 12.05.2024.
//

import SwiftUI

struct WeatherButton: View {
    
    init(title: String, textColor: Color, backgroundColor: Color) {
        self.title = title
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }
    
    private let title: String
    private let textColor: Color
    private let backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}


struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(title: "Test Title",
                      textColor: .white,
                      backgroundColor: .blue)
    }
}
