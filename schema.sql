CREATE TABLE games(
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    multiplayer BOOLEAN,
    last_played_at DATE NOT NULL,
    genre_id INT NOT NULL,
    author_id INT NOT NULL,
    label_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE authors(
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE music_album (
    id INT GENERATED ALWAYS AS IDENTITY,
    genre VARCHAR(25),
    author VARCHAR(50),
    label VARCHAR (50),
    publish_date  DATE,
    on_spotify BOOLEAN, 
    archived BOOLEAN,
    genre_id INT NOT NULL,
    author_id INT NOT NULL,
    label_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE genre (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    PRIMARY KEY(id)
);
