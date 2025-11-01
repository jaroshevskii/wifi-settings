//
//  WiFiSettingsApp.swift
//  WiFiSettings
//
//  Created by Sasha Jaroshevskii on 10/30/25.
//

import SwiftUI
import UIKitNavigation

@main
struct WiFiSettingsApp: App {
  var body: some Scene {
    WindowGroup {
      UIViewControllerRepresenting {
        UINavigationController(
          rootViewController: WiFiSettingsViewController(
            model: WiFiSettingsModel(
              foundNetworks: Network.mocks,
              selectedNetworkID: Network.mocks[1].id,
              destination: .detail(
                NetworkDetailModel(
                  network: Network.mocks[1],
                  onConfirmForget: {}
                )
              )
            )
          )
        )
      }
      .ignoresSafeArea()
    }
  }
}
