/* eslint-disable no-console */
require('dotenv').config();

const express = require('express');
const router = require('./routes');

const app = express();
const port = process.env.PORT || 3000;

app.use('/', router);

app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});

module.exports = {
  router,
};