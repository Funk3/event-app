// load .env data into process.env
import dotenv from 'dotenv';
dotenv.config();

// other dependencies
import fs from 'fs';
import chalk from 'chalk'
import db from '../database/connection.js';

// Loads the schema files from db/schema
const runSchemaFiles = async () => {
  console.log(chalk.cyan(`-> Loading Schema Files ...`));
  const schemaFilenames = fs.readdirSync('./database/schema');

  for (const fn of schemaFilenames) {
    const sql = fs.readFileSync(`./database/schema/${fn}`, 'utf8');
    console.log(`\t-> Running ${chalk.green(fn)}`);
    await db.query(sql);
  }
};

const runSeedFiles = async () => {
  console.log(chalk.cyan(`-> Loading Seeds ...`));
  const schemaFilenames = fs.readdirSync('./database/seeds');

  for (const fn of schemaFilenames) {
    const sql = fs.readFileSync(`./database/seeds/${fn}`, 'utf8');
    console.log(`\t-> Running ${chalk.green(fn)}`);
    await db.query(sql);
  }
};

const runResetDB = async () => {
  try {
    process.env.DB_HOST &&
      console.log(
        `-> Connecting to PG on ${process.env.DB_HOST} as ${process.env.DB_USER}...`
      );

    await runSchemaFiles();
    await runSeedFiles();
    process.exit();
  } catch (err) {
    console.error(chalk.red(`Failed due to error: ${err}`));
    process.exit();
  }
};

runResetDB();