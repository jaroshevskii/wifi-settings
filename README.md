# 📱 Wi-Fi Settings

WiFiSettings showcases a modern UIKit architecture built around Observation, DiffableDataSource, and declarative navigation inspired by SwiftUI.
It demonstrates how to model system-like features in a scalable, reactive UIKit codebase without external dependencies.

## 🎞️ Demo

https://github.com/user-attachments/assets/472a0ff6-0fc8-4683-b8e9-54f43671908f

The demo reproduces the iOS Wi-Fi Settings experience:
- Turning Wi-Fi on/off
- Listing available networks
- Connecting to secured networks
- Viewing and forgetting saved networks

## ⚙️ Architecture Highlights

Observation	Uses Swift’s native @Observable, @Perceptible, and @UIBindable for reactive UIKit bindings.
Declarative Navigation	Powered by UIKitNavigation — allows SwiftUI-style present(item:) and navigationDestination(item:) flows in UIKit.
Diffable Data Source	Dynamically updates collection view sections and items based on model state.
Modern View Composition	Each feature is an independent “Model + ViewController” pair.
Async/Await Integration	Async connection flow (joinButtonTapped()) simulates realistic networking delay.
SwiftUI Previews	Each UIKit view controller is previewable using SwiftUI’s UIViewControllerRepresentable.

## 🧱 Feature Modules

WiFiSettingsFeature	Root screen displaying available networks and managing navigation.
ConnectToNetworkFeature	Modal view to enter password and connect.
NetworkDetailFeature	Network info and “Forget Network” flow.

## 🧠 Modern UIKit Practices
-	Reactive model bindings via @UIBindable
- View updates synchronized with observation transactions
- Stateless view controllers — views render directly from model
- Compositional layouts with .insetGrouped lists
- Async feedback loops (Task { await model.joinButtonTapped() })
- No Storyboards, no Rx/Combine — 100% native and declarative UIKit


## 🧪 Preview & Simulation

Wi-Fi networks randomly appear/disappear in preview mode to simulate real-world scanning behavior:

```swift
#Preview {
  let model = WiFiSettingsModel(foundNetworks: Network.mocks)
  UINavigationController(rootViewController: WiFiSettingsViewController(model: model))
}
```

## 💡 Key Takeaways

- ✅ UIKit can be just as declarative and reactive as SwiftUI.
- ✅ Observation + DiffableDataSource simplifies state-driven UI updates.
- ✅ Navigation composition unifies modals and pushes under a single, predictable model flow.

## Contributing

Contributions are welcome! Feel free to submit pull requests for:  
  - Adding new animations or transitions  
  - Enhancing UI/UX

## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE.md) file for details.
