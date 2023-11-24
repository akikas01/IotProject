var express = require('express');

var request = require('request');

var app = express();

var http = require('http').Server(app);



var mysql = require('mysql');

var connection = mysql.createConnection({

  host: '38.242.214.62',

  port: '3990',

  user: 'root', // Replace with your MySQL username

  password: 'cooja123!', // Replace with your MySQL password

  database: 'cooja' // Replace with your database name

});



connection.connect(function(err) {

  if (err) throw err;

  console.log("Connected to MySQL!");

});



// Define the route for '/'

app.get('/', function(req, res) {

  res.send('<h1>Hello World</h1>');

});



// Retrieve sensor data every five seconds

setInterval(function () {

    request.get('http://[fd00::302:304:506:708]/', function(err, res, body) {

        if (err) {

            console.log('Error during HTTP request:', err);

            return;

        }



       try { console.log(body);

            var obj = JSON.parse(body);

            console.log(obj);

          





            connection.query({

                sql: 'INSERT INTO sensors(sensor_name, type, value) VALUES (?, ?, ?)',

                timeout: 80000, // 40s

                values: ['Sensor 1','Temperature',obj.temp]

                

                //values: [obj.temp, obj.hum]

            }, function (error, results, fields) {

                if (error) {

                    console.log('Error during MySQL query:', error);

                    return;

                }

                

                console.log('Inserted data to MySQL');

            });



        } catch (parseError) {

            console.log('Error parsing JSON:', parseError);

        }

    });

}, 5000);



// Start the server

http.listen(3000, function() {

  console.log('listening on *:3000');

});
