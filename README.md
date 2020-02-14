<h1>EZClientAuth Example App</h1>

Complete EZClientAuth code for the tutorial [Domain Driven Authentication](https://www.justkeepclicking.io/domain-driven-authentication/).

For simplicity, EZClientAuth is included in the same project as the demo app, but it can also be extracted to its own Framework and imported as a dependency into multiple apps.

By default, the demo app is [configured](https://github.com/alo9507/EZClientAuth/blob/master/EZClientAuth/SceneDelegate.swift) with a [MockRemoteAuthProvider](https://github.com/alo9507/EZClientAuth/blob/master/EZClientAuth/EZClientAuth/RemoteAuthProvider/Implementations/MockRemoteAuthProvider.swift).

<h2>How to Configure Firebase Auth as a RemoteAuthProvider</h2>

1. Run `pod install`
2. Uncomment [FirebaseRemoteAuthProvider](https://github.com/alo9507/EZClientAuth/blob/master/EZClientAuth/EZClientAuth/RemoteAuthProvider/Implementations/FirebaseRemoteAuthProvider.swift)
3. Follow [the official Google FirebaseAuth documentation for iOS](https://firebase.google.com/docs/auth/ios/start).</br>
   <b>NOTE:</b> <i>Recent changes in XCode projects paving the way for SwiftUI mean you should call `FirebaseApp.configure` in `SceneDelegate` not `AppDelegate` as it says in the Google documentation.</i>
