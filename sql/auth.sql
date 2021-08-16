CREATE SCHEMA IF NOT EXISTS tv_auth;
CREATE TABLE IF NOT EXISTS tv_auth.user
(
    id                   serial PRIMARY KEY,
    login                varchar(50),
    email                varchar(50),
    password             varchar(256),
    block                integer default 0,
    confirm_email_code   varchar(256),
    remind_password_code varchar(256),
    remember_token       varchar(256)
);
CREATE UNIQUE INDEX IF NOT EXISTS user_id ON tv_auth.user (id);

CREATE TABLE IF NOT EXISTS tv_auth.sessions
(
    id            serial PRIMARY KEY,
    access_token  varchar(500),
    refresh_token varchar(500),
    user_ip       varchar(50),
    time_creation timestamp default now()
);
CREATE UNIQUE INDEX IF NOT EXISTS session_id ON tv_auth.sessions (id);

CREATE TABLE IF NOT EXISTS tv_auth.permissions
(
    id          serial PRIMARY KEY,
    name        varchar(50),
    description varchar(100)
);
CREATE UNIQUE INDEX IF NOT EXISTS permissions_id ON tv_auth.permissions (id);

CREATE TABLE IF NOT EXISTS tv_auth.role
(
    id          serial PRIMARY KEY,
    name        varchar(50),
    description varchar(100)
);
CREATE UNIQUE INDEX IF NOT EXISTS role_id ON tv_auth.role (id);

CREATE TABLE IF NOT EXISTS tv_auth.group
(
    id          serial PRIMARY KEY,
    name        varchar(50),
    description varchar(100)
);
CREATE UNIQUE INDEX IF NOT EXISTS group_id ON tv_auth.group (id);

CREATE TABLE IF NOT EXISTS tv_auth.group_to_roles
(
    group_id int,
    role_id  int,
    PRIMARY KEY (group_id, role_id)
);
CREATE UNIQUE INDEX IF NOT EXISTS group_to_roles_group_id ON tv_auth.group_to_roles (group_id);
CREATE UNIQUE INDEX IF NOT EXISTS group_to_roles_role_id ON tv_auth.group_to_roles (role_id);

CREATE TABLE IF NOT EXISTS tv_auth.role_to_permissions
(
    role_id       int,
    permission_id int,
    PRIMARY KEY (permission_id, role_id)
);
CREATE UNIQUE INDEX IF NOT EXISTS role_to_permissions_role_id ON tv_auth.role_to_permissions (role_id);
CREATE UNIQUE INDEX IF NOT EXISTS role_to_permissions_permission_id ON tv_auth.role_to_permissions (permission_id);

