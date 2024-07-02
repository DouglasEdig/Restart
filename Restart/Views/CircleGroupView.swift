//
//  CircleGroupView.swift
//  Restart
//
//  Created by Douglas Matheus da Silva on 28/06/24.
//

import SwiftUI

struct CircleGroupView: View {
  
  @State var ShapeColor: Color
  @State var ShapeOpacity: Double
  @State private var isAnimation: Bool = false
  
  
    var body: some View {
      ZStack {
        Circle()
          .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
          .frame(width: 260, height: 260, alignment: .center)
        Circle()
          .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
          .frame(width: 260, height: 260, alignment: .center)
      }//: zstack
      .blur(radius: isAnimation ? 0 : 10)
      .opacity(isAnimation ? 1 : 0)
      .scaleEffect(isAnimation ? 1 : 0.5)
      .animation(.easeOut(duration: 1), value: isAnimation)
      .onAppear(perform: {
        isAnimation = true
      })
    }
}

#Preview {
  ZStack {
    Color("ColorBlue")
      .ignoresSafeArea(.all, edges: .all)
    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
  }
}
