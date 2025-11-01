//
//  NetworkDetailFeature.swift
//  WiFiSettings
//
//  Created by Sasha Jaroshevskii on 10/30/25.
//

import Observation
import UIKit
import UIKitNavigation
import SwiftUI

@Observable
final class NetworkDetailModel {
  var forgetAlertIsPresented: Bool
  let onConfirmForget: () -> Void
  let network: Network
  
  init(
    forgetAlertIsPresented: Bool = false,
    network: Network,
    onConfirmForget: @escaping () -> Void
  ) {
    self.forgetAlertIsPresented = forgetAlertIsPresented
    self.onConfirmForget = onConfirmForget
    self.network = network
  }
  
  func forgetNetworkButtonTapped() {
    forgetAlertIsPresented = true
  }
  
  func confirmForgetNetworkButtonTapped() {
    onConfirmForget()
  }
}

final class NetworkDetailViewController: UIViewController {
  @UIBindable var model: NetworkDetailModel
  
  init(model: NetworkDetailModel) {
    self.model = model
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    navigationItem.title = model.network.name
    
    let forgetButton = UIButton(type: .system, primaryAction: UIAction { [weak self] _ in
      self?.model.forgetNetworkButtonTapped()
    })
    forgetButton.setTitle("Forget network", for: .normal)
    forgetButton.setTitleColor(.red, for: .normal)
    forgetButton.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(forgetButton)
    NSLayoutConstraint.activate([
      forgetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      forgetButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])
    
    present(isPresented: $model.forgetAlertIsPresented) { [model] in
      let controller = UIAlertController(
        title: "Forget Wi-Fi Network \(model.network.name)?",
        message: "You devices using iCloud Keychain will no longer join this Wi-Fi network.",
        preferredStyle: .alert
      )
      controller.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
        
      })
      controller.addAction(UIAlertAction(title: "Destructive", style: .destructive) { _ in
        model.confirmForgetNetworkButtonTapped()
      })
      return controller
    }
  }
}

#Preview {
  UINavigationController(
    rootViewController: NetworkDetailViewController(
      model: NetworkDetailModel(
        forgetAlertIsPresented: true,
        network: Network(name: "Blob's WiFi"),
        onConfirmForget: {}
      )
    )
  )
}
