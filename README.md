<h1>EZClientAuth Example App</h1>

Complete EZClientAuth code for the tutorial [Domain Driven Authentication](https://www.justkeepclicking.io/domain-driven-authentication/).

For simplicity, EZClientAuth is included in the same project as the demo app, but it can also be extracted to its own Framework and imported as a dependency into multiple apps.

By default, the demo app is configured with a MockRemoteAuthProvider.

<h2>How to Configure Firebase as a RemoteAuthProvider</h2>

1. Uncomment `FirebaseRemoteAuthProvider`
2. Run `pod install`
3. Follow [the official Google FirebaseAuth documentation for iOS](https://firebase.google.com/docs/auth/ios/start).
