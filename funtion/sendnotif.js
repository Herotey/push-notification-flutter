
var admin = require("firebase-admin");

var serviceAccount = require("/Users/ecoinsoft/development/push_notification_firebase/pushnotificationfirebase-ef882-firebase-adminsdk-1ofj9-73eeb158a2.json");

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});


var registrationToken = 'doIwuhx7RDe86x7_T_WQM0:APA91bEdwFc72X0dIAaV2Av3gaoPsLrs4o4MK-li7okBuuXUdb3BAckHAdU8_qkbFv8bL6N7wJBqEjs8GEGphxvnXyfWq0eMd9lirtyJgajZDXgHwZ3JTwTZSx6upm0aSie3udaDgjHz'

var message = {
    data: {
        title: 'Cellcard',
        body: 'You subscribed to cellcard serey $1.5',
        subtext: 'notification about cellcard app'
    },
    token: registrationToken
};

admin.messaging().send(message)
    .then((response) => {
        console.log('Successfully sent message : ', response);
    })
    .catch((error) => {
        console.log('Error send message :', error);
    })

