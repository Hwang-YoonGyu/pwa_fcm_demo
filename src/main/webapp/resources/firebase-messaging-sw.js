importScripts('https://www.gstatic.com/firebasejs/9.0.0/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/9.0.0/firebase-messaging-compat.js');

// Initialize the Firebase app in the service worker by passing in
// your app's Firebase config object.
// https://firebase.google.com/docs/web/setup#config-object
firebase.initializeApp({
    apiKey: "AIzaSyCdaG0rpvLZ0VmUQGMVFWVfu3eMl56IqGQ",
    authDomain: "pwa-fcm-demo-1e2ed.firebaseapp.com",
    projectId: "pwa-fcm-demo-1e2ed",
    databaseURL: 'https:/pwa-fcm-demo-1e2ed.firebaseio.com',
    storageBucket: "pwa-fcm-demo-1e2ed.appspot.com",
    messagingSenderId: "128275248521",
    appId: "1:128275248521:web:baab78ef850d2073299d58",
    measurementId: "G-1GL25NLE5C"
});

// Retrieve an instance of Firebase Messaging so that it can handle background
// messages.
const messaging = firebase.messaging();
console.log("service worker on");
messaging.onBackgroundMessage((payload) => {
    console.log('[firebase-messaging-sw.js] Received background message ', payload);
    var title = payload.notification.title;
    var options = {
        body: payload.notification.body,
        icon: payload.notification.icon
    };
    var notification = new Notification(title,options);
});
