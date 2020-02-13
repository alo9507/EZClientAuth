<h1>EZClientAuth Example App</h1>

Complete Code for the tutorial [Domain Driven Authentication](https://www.justkeepclicking.io/domain-driven-authentication/).

This includes all the interfaces of EZClientAuth in the `Auth` folder alongside the main project.

The implementation we configure with is a mock so you can familiarize yourself with the general flow of the AuthManager.

EZClientAuth can also be included as a separate `Framework` dependency.

This EZClientAuth example app is ready to go for `FirebaseAuth` as well, though I have the `FirebaseRemoteAuthProvider` implementation and `Podfile` commented out to prevent the need for a `pod install` for people who just want to poke around.

Follow [these helpful iOS FirebaseAuth docs](https://firebase.google.com/docs/auth/ios/start) to get started if you want a functioning RemoteAuthProvider for your app.
