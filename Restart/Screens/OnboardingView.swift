//
//  OnboardingView.swift
//  Restart
//
//  Created by Douglas Matheus da Silva on 23/06/24.
//

import SwiftUI

struct OnboardingView: View {
  //MARK: - PROPERTY
  
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  
  @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
  @State private var buttonOffset: CGFloat = 0
  @State private var isAnimating: Bool = false
  
  //MARK: - BODY
  
  
  var body: some View {
    ZStack {
      Color("ColorBlue")
        .ignoresSafeArea(.all, edges: .all)
      
      VStack(spacing: 20) {
        //MARK: - HEADER
        Spacer()
        VStack(spacing: 0) {
          Text("Share.")
            .font(.system(size: 60))
            .fontWeight(.heavy)
            .foregroundColor(.white)
          
          Text("It's not how much we give but how much love we put into giving . ..")
            .font(.title3)
            .fontWeight(.light)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 10)
        }//header
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : -40)
        .animation(.easeOut(duration: 1), value: isAnimating)
        
        
        //MARK: - CENTER
        ZStack {
          CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
          Image("character-1")
            .resizable()
            .scaledToFit()
            .opacity(isAnimating ? 1 : 0)
            .animation(.easeOut(duration: 0.5), value: isAnimating)
        }//: center
        Spacer()
        
        //MARK: - FOOTER
        ZStack {
          Capsule()
            .fill(Color.white.opacity(0.2))
          Capsule()
            .fill(Color.white.opacity(0.2))
            .padding(8)
          
          Text("Get Started")
            .font(.system(.title3, design: .rounded))
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .offset(x: 20)
          
          HStack {
            Capsule()
              .fill(Color("ColorRed"))
              .frame(width: buttonOffset + 80)
            
            Spacer()
          }
          
          HStack {
            ZStack {
              Circle()
                .fill(Color("ColorRed"))
              Circle()
                .fill(.black.opacity(0.15))
                .padding(8)
              Image(systemName: "chevron.right.2")
                .font(.system(size: 24,weight: .bold))
            }
            .foregroundColor(.white)
            .frame(width: 80, height: 80, alignment: .center)
            .offset(x: buttonOffset)
            .gesture(
              DragGesture()
                .onChanged { gesture in
                  if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80{
                    buttonOffset = gesture.translation.width
                  }
                }
                .onEnded { _ in
                  withAnimation(Animation.easeOut(duration: 0.4)) {
                    if buttonOffset > buttonWidth / 2 {
                      buttonOffset = buttonWidth - 80
                      isOnboardingViewActive = false
                    } else {
                      buttonOffset = 0
                    }
                  }
                }
            )
            
            Spacer()
          }//hstack
        }//footer
        .frame(width: buttonWidth, height: 80, alignment: .center)
        .padding()
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : 40)
        .animation(.easeOut(duration: 1 ), value: isAnimating)
      }//vstack
    }//zstack
    .onAppear(perform: {
      isAnimating = true
    })
  }
}

#Preview {
  OnboardingView()
}
