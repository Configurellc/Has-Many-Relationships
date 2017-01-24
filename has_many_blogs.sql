DROP USER IF EXISTS has_many_users;
CREATE USER has_many_users;
DROP DATABASE IF EXISTS has_many_blogs;
CREATE DATABASE has_many_blogs;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
  id serial PRIMARY KEY,
  usersname varchar(90),
  first_name varchar(90) DEFAULT NULL,
  last_name varchar(90) DEFAULT NULL,
  created_at timestamp WITH TIME ZONE DEFAULT now(),
  updated_at timestamp WITH TIME ZONE DEFAULT now()
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts(
  id serial PRIMARY KEY,
  title varchar(180) DEFAULT NULL,
  url varchar(510) DEFAULT NULL,
  content text DEFAULT NULL,
  created_at timestamp WITH TIME ZONE DEFAULT now(),
  updated_at timestamp WITH TIME ZONE DEFAULT now(),
  user_fk_id serial REFERENCES users(id)
);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments(
  id serial PRIMARY KEY,
  body varchar(510) DEFAULT NULL,
  created_at timestamp WITH TIME ZONE DEFAULT now(),
  updated_at timestamp WITH TIME ZONE DEFAULT now()
);

\c has_many_blogs
\i scripts/blog_data.sql;