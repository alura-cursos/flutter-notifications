importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyB_Wm9LBeug6uDDrSdQpvlypK1CGz75e2k",
  authDomain: "dev-meetups-99be6.firebaseapp.com",
  projectId: "dev-meetups-99be6",
  storageBucket: "dev-meetups-99be6.appspot.com",
  messagingSenderId: "503887868860",
  appId: "1:503887868860:web:b94c059d111bd39afff1b9",
  measurementId: "G-PG6X48DC6H"
});

// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
  console.log("onBackgroundMessage", m);
});