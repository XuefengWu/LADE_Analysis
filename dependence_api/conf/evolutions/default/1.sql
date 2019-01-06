
# --- !Ups


CREATE TABLE `JClass` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `module` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `JField` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `JMethod` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `returntype` char(255) COLLATE utf8mb4_unicode_ci,
  `name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clzname` char(255) COLLATE utf8mb4_unicode_ci,
  `updatedAt` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `module` char(128) COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `_ClassDependences` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `b` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `A` (`a`),
  KEY `B` (`b`),
  CONSTRAINT `_ClassDependences_ibfk_1` FOREIGN KEY (`A`) REFERENCES `JClass` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_ClassDependences_ibfk_2` FOREIGN KEY (`B`) REFERENCES `JClass` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `_ClassFields` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `b` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `A` (`a`),
  KEY `B` (`b`),
  CONSTRAINT `_ClassFields_ibfk_1` FOREIGN KEY (`A`) REFERENCES `JClass` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_ClassFields_ibfk_2` FOREIGN KEY (`B`) REFERENCES `JField` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `_ClassMethods` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `b` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `A` (`a`),
  KEY `B` (`b`),
  CONSTRAINT `_ClassMethods_ibfk_1` FOREIGN KEY (`A`) REFERENCES `JClass` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_ClassMethods_ibfk_2` FOREIGN KEY (`B`) REFERENCES `JMethod` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `_ClassParent` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `b` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `A` (`a`),
  KEY `B` (`b`),
  CONSTRAINT `_ClassParent_ibfk_1` FOREIGN KEY (`A`) REFERENCES `JClass` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_ClassParent_ibfk_2` FOREIGN KEY (`B`) REFERENCES `JClass` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `_MethodCallees` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `b` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `A` (`a`),
  KEY `B` (`b`),
  CONSTRAINT `_MethodCallees_ibfk_1` FOREIGN KEY (`A`) REFERENCES `JMethod` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_MethodCallees_ibfk_2` FOREIGN KEY (`B`) REFERENCES `JMethod` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `_MethodCaller` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `b` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `A` (`a`),
  KEY `B` (`b`),
  CONSTRAINT `_MethodCaller_ibfk_1` FOREIGN KEY (`A`) REFERENCES `JMethod` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_MethodCaller_ibfk_2` FOREIGN KEY (`B`) REFERENCES `JMethod` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


# --- !Downs


DROP TABLE _MethodCaller;
DROP TABLE _MethodCallees;
DROP TABLE _ClassParent;
DROP TABLE _ClassMethods;
DROP TABLE _ClassFields;
DROP TABLE _ClassDependences;
DROP TABLE JMethod;
DROP TABLE JField;
DROP TABLE JClass;

