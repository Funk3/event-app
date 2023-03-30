//import BCrypt to create hashed password for user seed database

const bcrypt = require('bcrypt');
const saltRounds = 10;
const plainTextPW = 'password';

bcrypt.hash(plainTextPW, saltRounds).then((result) => {
  console.log(result);
});
