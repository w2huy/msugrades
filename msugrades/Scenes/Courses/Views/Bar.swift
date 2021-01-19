//
//  Bar.swift
//  msugrades
//
//  Created by William Huynh on 12/29/20.
//

import SwiftUI

struct Bar: View {
    
    var gpa: Int
    var total: Int
    var color: Color
    var score: String
    var height: Float
    var showCounts: Bool = false
    
    var body: some View {
        VStack {
            if showCounts {
                Text("\(gpa)")
                    .font(.caption2)
                    .bold()
            }
            
            if gpa != 0 {
                Rectangle()
                    .frame(maxWidth: .infinity, minHeight: 0, maxHeight: CGFloat(height) * CGFloat((Float(gpa)/Float(total))))
                    .cornerRadius(3.0)
                    .foregroundColor(color)
                
            }
            else {
                Rectangle()
                    .frame(maxWidth: .infinity, minHeight: 0, maxHeight: 5)
                    .cornerRadius(3.0)
                    .foregroundColor(color)
                    .opacity(0.1)
            }
            Divider()
            
            Text(score)
                .font(.caption2)
                .bold()
        }
    }
}

struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        Bar(gpa: 50, total: 182, color: .blue, score: "4.0", height: 300)
    }
}
