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
  
  //MARK: - BODY
  
  
  var body: some View {
    VStack(spacing: 20) {
      Text("onboarding")
        .font(.largeTitle)
      
      Button(action : {
        isOnboardingViewActive = false
      }) {
        Text("Start")
      }
      
    }//VSTACK
  }
}

#Preview {
  OnboardingView()
}
