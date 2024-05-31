const mongoose = require("mongoose");

mongoose.connect(process.env.MONGO_URL);

const db = mongoose.connection;

db.on('connected',()=>console.log("database connected"));

db.on('disconnected',()=>console.log("database disconnected"));

db.on('error',()=>{
    console.log("error occured");
    process.exit(1);
})

module.export = db;