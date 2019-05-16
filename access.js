'use strict';

module.exports.saveSupplier  = function(db, name, description, callback) {
	db.collection('suppliers_info').save({name : name, description : description, status : true}, callback);
};

module.exports.findProductsCached = function(db, redis, callback) {
	redis.get(name, function(err, reply) {
		if (err)
			callback(null);
		else if (reply) //Book exists in cache
			callback(JSON.parse(reply));
		else {
			//Book doesn't exist in cache - we need to query the main database
			db.collection('products_info').find(function(err, doc) {
				if (err || !doc)
					callback(null);
				else {
                    //Book found in database, save to cache and return to client
					redis.set(name, JSON.stringify(doc), function() {
                        callback(doc);
                    });
				}
			});
		}
	});
};