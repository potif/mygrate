-- Minimal information to create an account.
CREATE TABLE users (
    id serial primary key,
    user_name varchar(32),
    email varchar(64),
    password varchar(64),

    deleted boolean,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);


-- Once a person adds a bounty, he is added to this database.
CREATE TABLE people (
    id serial primary key,
    first_name varchar(128),
    last_name varchar(128),
    address1 varchar(256),
    address2 varchar(256),
    city varchar(128),
    state char(2),
    zip char(10),
    email varchar,

    deleted boolean,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);


-- Projects.
CREATE TABLE projects (
    id serial primary key,
    name varchar(255),
    markdown varchar,

    deleted boolean,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);


-- A project has 1 or more items to which bounties are attached.
CREATE TABLE project_items (
    id serial primary key,
    project_id int references projects(id),
    markdown varchar,
    user_id int references users(id),

    deleted boolean,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);


-- A project has 1 or more items to which bounties are attached.
CREATE TABLE project_item_bounties (
    id serial primary key,
    item_id int references project_items(id),
    user_id int references users(id),
    amount decimal,

    deleted boolean,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);


-- project owners may provide status updates independent of the comments
CREATE TABLE project_statuses (
    id serial primary key,
    project_d int references projects(id),
    user_id int references users(id),
    markdown varchar,

    deleted boolean,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);


-- users may comment on the project
CREATE TABLE project_comments (
    id serial primary key,
    project_id int references projects(id),
    user_id int references users(id),
    markdown varchar,

    deleted boolean,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);


-- users may comment on the project items
CREATE TABLE project_item_comments (
    id serial primary key,
    item_id int references project_items(id),
    user_id int references users(id),
    markdown varchar,

    deleted boolean,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);
