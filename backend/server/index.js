"use strict";
exports.__esModule = true;
var express_1 = require("express");
//import cors from "cors";
//import bodyParser from "body-parser"
var db_1 = require("./db");
//import { Url } from "url";
var app = (0, express_1["default"])();
app.use(function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', 'http://localhost:3000');
    res.setHeader('Access-Control-Allow-Methods', 'GET,POST,PUT,DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Access-Control-Allow-Headers');
    next();
});
app.use(express_1["default"].json());
//app.use(cors());
//app.use(express.urlencoded({ extended: true }));
app.get('/employees/:years/:country', function (req, res) {
    db_1["default"].getByExperAndCountry(req.body);
});
app.listen(4000, function () {
    console.log('The application is listening on port 4000!');
});
