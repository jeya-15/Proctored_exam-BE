const express = require("express");
require("dotenv").config();
const db = require("./database/db.js");

const cors = require("cors");
const app = express();

const PORT = process.env.PORT;

app.use("/", require("./routes/routes"));


app.listen(PORT, () => {
  console.log(`Server is listening on port ${PORT}`);
});