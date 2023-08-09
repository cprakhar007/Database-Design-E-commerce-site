CREATE TABLE `products` (
	`product_id` int NOT NULL,
	`product_name` varchar NOT NULL,
	`product_details` TEXT NOT NULL,
	`product_image` blob NOT NULL,
	`price` DECIMAL NOT NULL,
	PRIMARY KEY (`product_id`)
);

CREATE TABLE `notifications` (
	`notification_id` int NOT NULL,
	`user_id` int NOT NULL,
	`notification_text` TEXT NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`notification_id`)
);

CREATE TABLE `subscriptions` (
	`subscription_id` int NOT NULL,
	`user_id` int NOT NULL,
	`product_id` int NOT NULL,
	`subscription_type` varchar NOT NULL,
	`is_active` BOOLEAN NOT NULL,
	PRIMARY KEY (`subscription_id`)
);

CREATE TABLE `orders` (
	`order_id` int NOT NULL,
	`user_id` int NOT NULL,
	`product_id` int NOT NULL,
	`order_date` DATE NOT NULL,
	PRIMARY KEY (`order_id`)
);

CREATE TABLE `OrderStatusUpdates` (
	`update_id` int NOT NULL,
	`order_id` int NOT NULL,
	`status_type` varchar NOT NULL,
	`update_date` DATE NOT NULL,
	PRIMARY KEY (`update_id`)
);

CREATE TABLE `promotions` (
	`promotion_id` int NOT NULL,
	`promotion_name` varchar NOT NULL,
	`promotion_description` TEXT NOT NULL,
	`start_date` DATE NOT NULL,
	`end_date` DATE NOT NULL,
	PRIMARY KEY (`promotion_id`)
);

CREATE TABLE `UserPromotionSubscriptions` (
	`subscription_id` int NOT NULL,
	`user_id` int NOT NULL,
	`promotion_id` int NOT NULL,
	PRIMARY KEY (`subscription_id`)
);

CREATE TABLE `users` (
	`user_id` int NOT NULL,
	`user_type_id` int NOT NULL,
	`username` varchar NOT NULL,
	`email` varchar NOT NULL UNIQUE,
	`phone_number` bigint NOT NULL UNIQUE,
	`hashed_password` varchar(255) NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE `user_type` (
	`user_type_id` int NOT NULL,
	`user_id` int NOT NULL,
	`is_buyer` BOOLEAN NOT NULL,
	`is_seller` BOOLEAN NOT NULL,
	PRIMARY KEY (`user_type_id`)
);

ALTER TABLE `notifications` ADD CONSTRAINT `notifications_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `subscriptions` ADD CONSTRAINT `subscriptions_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `subscriptions` ADD CONSTRAINT `subscriptions_fk1` FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk1` FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`);

ALTER TABLE `OrderStatusUpdates` ADD CONSTRAINT `OrderStatusUpdates_fk0` FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`);

ALTER TABLE `UserPromotionSubscriptions` ADD CONSTRAINT `UserPromotionSubscriptions_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `UserPromotionSubscriptions` ADD CONSTRAINT `UserPromotionSubscriptions_fk1` FOREIGN KEY (`promotion_id`) REFERENCES `promotions`(`promotion_id`);

ALTER TABLE `users` ADD CONSTRAINT `users_fk0` FOREIGN KEY (`user_type_id`) REFERENCES `user_type`(`id`);

ALTER TABLE `user_type` ADD CONSTRAINT `user_type_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);










