import { Pool } from 'pg';

const pool = new Pool({
  user: 'postgres',
  password: 'googlepixel',
  host: 'localhost',
  port: 5432,
  database: 'appdb'
});

export default pool;