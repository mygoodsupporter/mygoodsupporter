create table user
(
    id         bigint(20) PRIMARY KEY AUTO_INCREMENT,
    username       varchar(255)     UNIQUE not null,
    password varchar(255)     not null,
    name     varchar(255)     not null,
    phone    varchar(255)     not null,
    email    varchar(500)     null,
    ENABLED    bit default 1 null
);

create table authority
(
    username varchar(255),
    authority varchar(255)
);

CREATE TABLE category (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL
);


create table project
(
    id bigint auto_increment
        primary key,
    user_id bigint not null,
    category_id bigint(2) not null,
    title varchar(255) not null,
    subtitle varchar(255) null,
    target_amount int(10) null,
    current_amount int(10) null,
    status varchar(255) not null,
    start_date datetime null,
    end_date datetime null,
    title_image_url varchar(500) null,
    contents_image_url varchar(500) null,
    constraint project_category_id_fk
        foreign key (category_id) references category (id),
    constraint project_user_user_id_fk
        foreign key (user_id) references user (id)
);



create table item
(
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    project_id BIGINT(20),
    title varchar(255),
    constraint item_project_id_fk
        foreign key (project_id) references project (id)
            on delete cascade
);

CREATE TABLE reward (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    project_id BIGINT(20),
    title VARCHAR(255),
    description VARCHAR(255),
    amount INT(11),
    CONSTRAINT reward_project_id_fk
        FOREIGN KEY (project_id) references project (id)
            ON DELETE CASCADE
);

CREATE TABLE reward_item (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    reward_id BIGINT(20),
    item_id BIGINT(20),
    quantity int(11),
    CONSTRAINT reward_item_reward_id_fk FOREIGN KEY (reward_id) REFERENCES reward (id) ON DELETE CASCADE,
    CONSTRAINT reward_item_item_id_fk FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE CASCADE
);

create table card
(
    id bigint auto_increment primary key,
    user_id varchar(255) null,
    card_number varchar(255) null,
    expired_date varchar(255) null,
    card_password varchar(255) null,
    date_of_birth varchar(255) null
);

create table orders (
    id bigint(20) primary key auto_increment,
    user_id bigint(20) not null,
    project_id bigint(20) not null,
    reward_id bigint(20) not null,
    amount int(11),
    order_date int(11),
    order_status varchar(255) not null
);

create table address (
                         id bigint(20) primary key auto_increment,
                         user_id bigint(20) not null,
                         name varchar(255) not null ,
                         postcode varchar(255) not null,
                         phone varchar(255) not null,
                         road varchar(255) not null,
                         jibun varchar(255) null,
                         detail varchar(255) not null,
                         chamgo varchar(255) null,
                         constraint fk_address foreign key (user_id) references user(id) on delete cascade
);