// this uses /login to authorize a use

var express = require("express");
var app = express();
const fetch = require("node-fetch");
var bodyParser = require("body-parser");
// body parser extracts the entire body portion of an incoming request stream and exposes it on req.body
// the middleware was a part of Express.js earlier but now you have to install it separately.
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json({}));
const port = 3001;
// authenticate is a middleware function that checks for a secret token in the url
// if the token is present, it calls next() to call the next route
// if the token is not present, it sends a 401 error
const authenticate = (req, res, next) => {
  const url = req.url;
  if (url) {
    let path = url.split("=");
    // not so secret token is in the url
    if (path[1] == "secret-token") {
      req.user = "editor"; // we don't use this but it could be used to identify the user
      next();
    }
  } else {
    res.sendStatus(401);
  }
};
// store contacts in an arrays
// role is a property of each contact that is either "reader" or "editor"
// reader can only read contacts
// editor can read and write contacts
var contacts = [
  {
    name: "peter parker",
    age: 21,
    email: "peter@mit.edu",
    role: "none",
    password: "test1"
  },
  {
    name: "bruce",
    age: 32,
    email: "bruce@mit.edu",
    role: "editor",
    password: "test2"
  },
  {
    name: "diana prince",
    age: 25,
    email: "diana@mit.edu",
    role: "admin",
    password: "test3"
  },
];
// app.get("/", function (req, res) {
app.get("/", function (req, res) {
  res.send(`<h1> Routes: Try http://localhost:${port}/login </h1>`);
});
// login form with a post request to /auth  and a get request to /login
app.get("/login", (req, res) => {
  // send back a login form
  let form = `<form action="/auth" method="post">
    <label for="name">Enter name: </label>
    <input id="name" type="text" name="name" value="name">
    <input id="password" type="text" name="password" value="password">
    <input type="submit" value="OK">
    </form>`;
  res.send(form);
});

app.post("/auth", (req, res) => {
  let { name, password } = req.body;
  // check the user name and password

  // find the object with a particular user name first
  var cred = contacts.find(pass => pass.name === name);

  //catching exceptions
  if (cred == undefined)
  res.redirect(401, '/login');
 
  //Check if password and roles are correct
  if(password == cred.password && cred.role == "editor") {

  let form = `<form action="/contacts" method="get">
  <label for="name">Get Contacts </label>
  <input id="token" type="hidden" name="token" value="secret-token">
  <input type="submit" value="OK">
  </form>`;

  res.send(form);
}
else //if it doesnt match, give a prompt to return
res.redirect(401, '/login');

});

//athenticate is used to check if the  secret token is correct
app.get("/contacts", authenticate, (req, res) => {
  //authenticate adds user=admin to the request object if the token is correct
  // we can use this to check if the user is an admin
  if(req.user == "editor") {
    res.json(contacts);
  } else {
    res.sendStatus(401);
  }
});

// add authentication to the post request to /contact to allow only users with role = admin to add a contact
app.post("/contact", (req, res) => {
  // add a contact
  let contact = req.body;
  contacts.push(contact);
  res.redirect("/contacts/" + req.body.name);
});

app.listen(port, ()=> {console.log(`Running on port: ${port}`);});
