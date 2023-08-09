CREATE TABLE `users` (
	`user_id` int NOT NULL,
	`email` varchar NOT NULL UNIQUE,
	`phone_number` varchar NOT NULL UNIQUE,
	`hashed_password` varchar(255) NOT NULL,
	`forgot_password` bool NOT NULL,
	`is_buyer` BOOLEAN NOT NULL,
	`is_seller` BOOLEAN NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE `otp` (
	`otp_id` int NOT NULL,
	`user_id` int NOT NULL,
	`password_reset` int NOT NULL,
	`otp_code` varchar(6) NOT NULL,
	`expiration_timestamp` TIMESTAMP NOT NULL,
	PRIMARY KEY (`otp_id`)
);

CREATE TABLE `password_reset` (
	`reset_token_id` int NOT NULL,
	`user_id` int NOT NULL,
	`reset_token` varchar(255) NOT NULL,
	`expiration_timestamp` TIMESTAMP NOT NULL,
	PRIMARY KEY (`reset_token_id`)
);

CREATE TABLE `user_type` (
	`user_type_id` int NOT NULL,
	`user_id` int NOT NULL,
	`is_buyer` BOOLEAN NOT NULL,
	`is_seller` BOOLEAN NOT NULL,
	PRIMARY KEY (`user_type_id`)
);

ALTER TABLE `otp` ADD CONSTRAINT `otp_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `otp` ADD CONSTRAINT `otp_fk1` FOREIGN KEY (`password_reset`) REFERENCES `password_reset`(`reset_token_id`);

ALTER TABLE `password_reset` ADD CONSTRAINT `password_reset_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `user_type` ADD CONSTRAINT `user_type_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);





