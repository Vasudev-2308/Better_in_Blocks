const express = require("express");
const bodyParser = require("body-parser");
//var mongoose = require('mongoose');
const mongoose = require("mongoose");
const cors = require("cors");
const auth = require("./auth");
const morgan = require("morgan");
const orgData = require("./orgData");
const addRecords = require("./addRecords");
const studentData = require("./studentData");
const validateRecord = require("./validateRecord");
//const mongooseModels = require("./mongooseModels");



//Set up default mongoose connection
mongoose.connect("mongodb://127.0.0.1:27017/BetterBlock", {useUnifiedTopology: true, useNewUrlParser: true,}, console.log('Connecting to MongoShell'))

//Get the default connections
var db = mongoose.connection;

//Bind connection to error event (to get notification of connection errors)
db.on('error', console.error.bind(console, 'MongoDB connection error:'))
const app = express();

app.use(morgan("tiny"));
app.use(cors());
app.use(bodyParser.urlencoded({ extended: true, limit: "50mb" }));
app.use(bodyParser.json({ limit: "50mb", extended: true }));
app.use(auth);
app.use(orgData);
app.use(addRecords);
app.use(studentData);
app.use(validateRecord);
//app.use(mongooseModels);

const port = process.env.PORT || 5000;

app.listen(port, () => console.log(`Server running on port ${port} 🔥`));
