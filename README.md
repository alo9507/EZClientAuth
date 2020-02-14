<h1>EZClientAuth Example App</h1>

Complete EZClientAuth code for the tutorial [Domain Driven Authentication](https://www.justkeepclicking.io/domain-driven-authentication/).

For simplicity, EZClientAuth is included in the same project as the demo app, but it can also be extracted to its own Framework and imported as a dependency into multiple apps.

By default, the demo app is [configured](https://github.com/alo9507/EZClientAuth/blob/master/EZClientAuth/SceneDelegate.swift) with a [MockRemoteAuthProvider](https://github.com/alo9507/EZClientAuth/blob/master/EZClientAuth/EZClientAuth/RemoteAuthProvider/Implementations/MockRemoteAuthProvider.swift).

<h2>How to Configure Firebase Auth as a RemoteAuthProvider</h2>

1. Run `pod install`
2. Open `EZClientAuth.xcworkspace`. Make sure you're not still in `EZClientAuth.xcodeproj` because it is not aware of your dependencies.
3. Uncomment [FirebaseRemoteAuthProvider](https://github.com/alo9507/EZClientAuth/blob/master/EZClientAuth/EZClientAuth/RemoteAuthProvider/Implementations/FirebaseRemoteAuthProvider.swift). Uncomment [AuthProviderConfiguration](https://github.com/alo9507/EZClientAuth/blob/master/EZClientAuth/EZClientAuth/Enums/AuthProviderConfiguration.swift).
4. Follow [the official Google FirebaseAuth documentation for iOS](https://firebase.google.com/docs/auth/ios/start) to integrate the Firebase SDK into your project.</br>
   <b>NOTE:</b> <i>Recent changes in XCode projects paving the way for SwiftUI mean you should call `FirebaseApp.configure` in `SceneDelegate` not `AppDelegate` as it says in the Google documentation.</i>
5. Be sure to enable `Email/Password` sign-in in the Authentication tab of your iOS Firebase project.
6. Sign up a new user. Then sign-in or sign-out as you please!
