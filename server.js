const express = require("express");
require("dotenv").config();
const db = require("./Database/db.js");

const cors = require("cors");
const app = express();

const PORT = process.env.PORT;

app.get("/", (req, res) => {
  res.send("Server is running!");
});

app.listen(PORT, () => {
  console.log(`Server is listening on port ${PORT}`);
});
