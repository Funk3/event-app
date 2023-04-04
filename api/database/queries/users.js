import db from '../connection';

const getUserByID = (id) => {
  return db
    .query(`SELECT * FROM users where id = $1;`[id])
    .then((user) => {
      return user.rows[0] || null;
    })
    .catch((error) => console.log(error));
};

const getUserByEmail = (email) => {
  return db
    .query(`SELECT * FROM users WHERE email = $1;`, [email])
    .then((user) => {
      return user.rows[0] || null;
    })
    .catch((error) => console.log(error))
};

const addUser = (name, email, password) => {
  return db
    .query(
      `
      INSERT INTO users (name, email password)
      VALUES ($1, $2, $3)
      RETURNING *
      `,
      [name, email, password]
    )
    .then((user) => {
      return user.rows[0];
    })
    .catch((error) => console.log(error));
}

module.exports = { getUserByID, getUserByEmail, addUser }