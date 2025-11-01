//
//  Network.swift
//  WiFiSettings
//
//  Created by Sasha Jaroshevskii on 10/30/25.
//

import Foundation

struct Network: Identifiable, Hashable {
  let id = UUID()
  var name = ""
  var isSecured = true
  var connectivity = 1.0
}

extension Network {
  static let mocks = [
    Network(
      name: "nachos",
      isSecured: true,
      connectivity: 0.5
    ),
    Network(
      name: "nachos 5G",
      isSecured: true,
      connectivity: 0.75
    ),
    Network(
      name: "Blob Jr's LAN PARTY",
      isSecured: true,
      connectivity: 0.2
    ),
    Network(
      name: "Blob's World",
      isSecured: false,
      connectivity: 1
    ),
  ]
}
