'use strict';

var express = require('express'),
    app = express(),
    MongoClient = require('mongodb').MongoClient,
    bodyParser  = require("body-parser"),
    methodOverride = require("method-override"),
    //mongoose = require('mongoose'),
    mongoUrl = 'mongodb://10.0.0.6:27021';

var redisClient = require('redis').createClient;
var redis = redisClient(6379, "10.0.0.8");
var access = require('./access.js');


app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(methodOverride());
//    console.log("ssss");

var router = express.Router();
app.use(router);

router.get('/', function(req, res) {
    res.send("Hello World FUNCIONA!");
});

const PORT = process.env.PORT || 3000;

MongoClient.connect(mongoUrl, {useNewUrlParser: true}, function (err, db) {
    if (err) { throw 'Error connecting to database - ' + err; }

    console.log(`connected to db    `);


    app.get('/product/all-products', function (req, res) { access.findBookByTitleCached(db, redis, function (product) { if (!text) res.status(500).send("Server error");
                                                                       else res.status(200).send(product);
                                                                      });    
    });
        
    app.post('/supplier', function(req,res) {
		if (!req.supplier.name || !req.supplier.description)
			res.status(400).send("Please send a name and a description for the supplier");
		else {
			access.saveSupplier(db, req.supplier.name, req.supplier.description, function(err) {
				if (err)
					res.status(500).send("Server error");
				else
					res.status(201).send("Saved");
			});
		}
	});
  

});
app.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}`);
});


