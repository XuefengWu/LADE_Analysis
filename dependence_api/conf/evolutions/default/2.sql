# --- !Ups

CREATE TABLE `Configure` (
  `id` char(36) CHARACTER SET utf8 NOT NULL,
  `type` char(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` char(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` char(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


# --- !Downs

DROP TABLE Configure;