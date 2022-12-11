<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
</head>

<body>

Hello World!

</body>
<script type="module">
    import { initializeApp } from "https://www.gstatic.com/firebasejs/9.0.0/firebase-app.js";
    import { getMessaging, getToken, onMessage } from "https://www.gstatic.com/firebasejs/9.0.0/firebase-messaging.js";
    // if ('serviceWorker' in navigator) {
    //     window.addEventListener('load', () => {
    //         navigator.serviceWorker.register('/resources/firebase-messaging-sw.js');
    //     });
    // }

    function requestPermission() {
        console.log('Requesting permission...');
        Notification.requestPermission().then((permission) => {
            if (permission === 'granted') {
                console.log('Notification permission granted.');
            }
        });
    };
    requestPermission();
    let firebaseConfig = {
        apiKey: "AIzaSyCdaG0rpvLZ0VmUQGMVFWVfu3eMl56IqGQ",
        authDomain: "pwa-fcm-demo-1e2ed.firebaseapp.com",
        projectId: "pwa-fcm-demo-1e2ed",
        databaseURL: 'https:/pwa-fcm-demo-1e2ed.firebaseio.com',
        storageBucket: "pwa-fcm-demo-1e2ed.appspot.com",
        messagingSenderId: "128275248521",
        appId: "1:128275248521:web:baab78ef850d2073299d58",
        measurementId: "G-1GL25NLE5C"
    };
    // Initialize Firebase
    const app = initializeApp(firebaseConfig);
    const messaging = getMessaging(app);

    getToken(messaging, {
        vapidKey:
            "BE9pe6qJ-wKCv8QShOR7hZyX_pi8A-uBnMcHYzbdsnVepp20S_aJn-GzCWv-dgtQUfZVSk1f_girVsb0IwOPgj0"
    })
        .then((currentToken) => {
            if (currentToken) {
                console.log(currentToken);
            } else {
                console.log(
                    "No registration token available. Request permission to generate one."
                );
            }
        })
        .catch((err) => {
            console.log("An error occurred while retrieving token. ", err);
        });

    //포그라운드 메시지 수신
    onMessage(messaging, (payload) => {
        console.log("Message received. ", payload);
        var title = payload.notification.title;
        var options = {
            body: payload.notification.body,
            icon: payload.notification.icon
        };
        var notification = new Notification(title,options);
    });
</script>

</html>
