import express from 'express'
const router = express.Router();

import { getUserByEmail, addUser } from '../database/queries/users'

router.post('/login', async (req, res) => {
  const user = await getUserByEmail(req.body.email)
  res.json(user);
});

module.exports = router;
