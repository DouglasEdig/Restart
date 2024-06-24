//
//  HomeView.swift
//  Restart
//
//  Created by Douglas Matheus da Silva on 23/06/24.
//

import SwiftUI

struct HomeView: View {
  //MARK: - PROPERTY
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
  
  //MARK: - BODY
  
  var body: some View {
    
    VStack(spacing: 20) {
      Text("Home")
        .font(.largeTitle)
      
      Button(action: {
        isOnboardingViewActive = true
      }) {
        Text("Restart")
      }
    }//: VSTACK
    
  }
}

#Preview {
  HomeView()
}
