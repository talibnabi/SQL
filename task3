CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    about TEXT,
    nick VARCHAR(50),
    created_at TIMESTAMP DEFAULT now()
);

-- Create posts table
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    content TEXT,
    created_at TIMESTAMP DEFAULT now(),
    image_url TEXT
);

-- Add MANY TO MANY relation for authors and posts
CREATE TABLE author_posts (
    author_id INT REFERENCES authors(id),
    post_id INT REFERENCES posts(id),
    PRIMARY KEY (author_id, post_id)
);

-- Add additional columns to authors table
ALTER TABLE authors
ADD COLUMN email VARCHAR(100),
ADD COLUMN github VARCHAR(100),
ADD COLUMN updated_at TIMESTAMP;

-- Create subscribers table
CREATE TABLE subscribers (
    id SERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    author_id INT REFERENCES authors(id)
);

-- Add UNIQUE CONSTRAINT for authors.nick and authors.email
ALTER TABLE authors
ADD CONSTRAINT unique_nick_email UNIQUE (nick, email);

-- Add MANY TO MANY relation for posts and tags
CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    tag VARCHAR(50)
);

CREATE TABLE post_tags (
    post_id INT REFERENCES posts(id),
    tag_id INT REFERENCES tags(id),
    PRIMARY KEY (post_id, tag_id)
);

-- CREATE INDEX for tags.tag column
CREATE INDEX idx_tag ON tags(tag);

-- CREATE VIEW authors_posts_view (author_nick, post_title, post_created_at)
CREATE VIEW authors_posts_view AS
SELECT
    a.nick AS author_nick,
    p.title AS post_title,
    p.created_at AS post_created_at
FROM
    authors a
JOIN
    author_posts ap ON a.id = ap.author_id
JOIN
    posts p ON ap.post_id = p.id;

-- Add NOT NULL CONSTRAINT for subscribers.email
ALTER TABLE subscribers
ALTER COLUMN email SET NOT NULL;

-- Example of ONE TO ONE relation
CREATE TABLE profiles (
    id SERIAL PRIMARY KEY,
    author_id INT UNIQUE REFERENCES authors(id),
    bio TEXT
);

-- Example of ONE TO MANY relation
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES posts(id),
    content TEXT,
    created_at TIMESTAMP DEFAULT now()
);
