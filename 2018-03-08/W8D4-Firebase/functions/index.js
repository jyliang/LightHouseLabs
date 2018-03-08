const functions = require('firebase-functions');

// Create and Deploy Your First Cloud Functions
// https://firebase.google.com/docs/functions/write-firebase-functions

exports.helloWorld = functions.https.onRequest((request, response) => {
 response.send("Hello from Firebase!");
});


const admin = require('firebase-admin');
admin.initializeApp(functions.config().firebase);


exports.notifyAddition = functions.database.ref('/entries/{entryId}')
.onCreate( event => {
	const entry = event.data.val()
	console.log(`entry added ${entry} with id ${event.params.entryId}`)
	const uppercase = entry.toUpperCase()
	const object = {"original":entry, "uppercase":uppercase}
	return event.data.ref.parent.child(`${event.params.entryId}`).set(object)

	// const original = event.data.val();
 //      console.log('Uppercasing', event.params.pushId, original);
 //      const uppercase = original.toUpperCase();
 //      // You must return a Promise when performing asynchronous tasks inside a Functions such as
 //      // writing to the Firebase Realtime Database.
 //      // Setting an "uppercase" sibling in the Realtime Database returns a Promise.
 //      return event.data.ref.parent.child('uppercase').set(uppercase);
})