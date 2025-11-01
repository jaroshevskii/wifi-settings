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
