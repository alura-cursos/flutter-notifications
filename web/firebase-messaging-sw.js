importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js");

firebase.initializeApp({
      apiKey: "sua api key aqui",
      authDomain: "seu auth domain aqui
      projectId: "seu projetc id aqui",
      storageBucket: "seu storage bucket aqui",
      messagingSenderId: "seu messaging id aqui",
      appId: "seu app id aqui",
      measurementId: "seu meansurement aqui"
});

// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
  console.log("onBackgroundMessage", m);
});