CREATE TABLE "user" (
    id serial NOT NULL,
    name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    deleted boolean NOT NULL,
    created timestamp NOT NULL,
    edited timestamp NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY (id)
);

INSERT INTO "user" (name, email, deleted, created, edited)
VALUES
    ('Kert', 'klillenb@tlu.ee', false, NOW(), NOW()),
    ('Saskia', 'saskia.kriibi@tlu.ee', false, NOW(), NOW()),
    ('Ragnar', 'roki1567@tlu.ee', false, NOW(), NOW()),
    ('Rico', 'ricon@tlu.ee', false, NOW(), NOW()),
    ('Kädi', 'kadiri@tlu.ee', false, NOW(), NOW());
