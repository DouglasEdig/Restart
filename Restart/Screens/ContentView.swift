//
//  ContentView.swift
//  Restart
//
//  Created by Douglas Matheus da Silva on 22/06/24.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  
  var body: some View {
    ZStack {
      if isOnboardingViewActive {
        OnboardingView()
      } else {
        HomeView()
      }
    }
  }
}

#Preview {
  ContentView()
}
