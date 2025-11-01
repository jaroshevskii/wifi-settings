//
//  WiFiSettingsFeature.swift
//  WiFiSettings
//
//  Created by Sasha Jaroshevskii on 10/30/25.
//

import Observation
final class WiFiSettingsFeature {
  enum Destination {
    case connect(ConnectToNetworkModel)
    case detail(NetworkDetailModel)
  }
  var destination: Destination?
  var foundNetworks: [Network]
  var isOn: Bool
  var selectedNetworkID: Network.ID?
  
  init(
    foundNetworks: [Network],
    isOn: Bool = false,
    selectedNetworkID: Network.ID? = nil
  ) {
    self.foundNetworks = foundNetworks
    self.isOn = isOn
    self.selectedNetworkID = selectedNetworkID
  }
  
  func networkTapped(_ network: Network) {
    if network.id == selectedNetworkID {
      destination = .detail(
        NetworkDetailModel(
          network: network,
          onConfirmForget: { [weak self] in
            guard let self else { return }
            destination = nil
            selectedNetworkID = nil
          }
        )
      )
    } else if network.isSecured {
      destination = .connect(
        ConnectToNetworkModel(
          network: network,
          onConnect: { [weak self] network in
            guard let self else { return }
            destination = nil
            selectedNetworkID = network.id
          }
        )
      )
    } else {
      selectedNetworkID = network.id
    }
  }
  
  func infoButtonTapped(network: Network) {
    destination = .detail(
      NetworkDetailModel(
        network: network,
        onConfirmForget: { [weak self] in
          guard let self else { return }
          destination = nil
          selectedNetworkID = nil
        }
      )
    )
  }
}
