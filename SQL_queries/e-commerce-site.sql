CREATE TABLE `products` (
	`product_id` int NOT NULL,
	`seller_id` int NOT NULL,
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
	`buyer_id` int NOT NULL,
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
	`email` varchar NOT NULL UNIQUE,
	`phone_number` varchar NOT NULL UNIQUE,
	`hashed_password` varchar(255) NOT NULL,
	`forgot_password` bool NOT NULL,
	`is_buyer` BOOLEAN NOT NULL,
	`is_seller` BOOLEAN NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE `user_type` (
	`user_type_id` int NOT NULL,
	`user_id` int NOT NULL,
	`is_buyer` BOOLEAN NOT NULL,
	`is_seller` BOOLEAN NOT NULL,
	PRIMARY KEY (`user_type_id`)
);

CREATE TABLE `product_details` (
	`id` int NOT NULL,
	`product_id` int NOT NULL,
	`price` DECIMAL NOT NULL,
	`discount` DECIMAL NOT NULL,
	`specification` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `skus` (
	`id` int NOT NULL,
	`product_id` int NOT NULL,
	`sku_code` varchar NOT NULL,
	`stock_quantity` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `sellers` (
	`seller_id` int NOT NULL,
	`seller_name` varchar NOT NULL,
	`seller_contact_info` varchar NOT NULL,
	PRIMARY KEY (`seller_id`)
);

CREATE TABLE `OrderDetails` (
	`order_detail_id` int NOT NULL,
	`order_id` int NOT NULL,
	`product_id` int NOT NULL,
	`quantity` int NOT NULL,
	PRIMARY KEY (`order_detail_id`)
);

CREATE TABLE `buyers` (
	`buyer_id` int NOT NULL,
	`buyer_name` varchar NOT NULL,
	`buyer_contact_info` bigint NOT NULL,
	PRIMARY KEY (`buyer_id`)
);

CREATE TABLE `carts` (
	`cart_id` int NOT NULL,
	`buyer_id` int NOT NULL,
	`product_id` int NOT NULL,
	`quantity` int NOT NULL,
	PRIMARY KEY (`cart_id`)
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

ALTER TABLE `products` ADD CONSTRAINT `products_fk0` FOREIGN KEY (`seller_id`) REFERENCES `sellers`(`seller_id`);

ALTER TABLE `notifications` ADD CONSTRAINT `notifications_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `subscriptions` ADD CONSTRAINT `subscriptions_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `subscriptions` ADD CONSTRAINT `subscriptions_fk1` FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk1` FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk2` FOREIGN KEY (`buyer_id`) REFERENCES `buyers`(`buyer_id`);

ALTER TABLE `OrderStatusUpdates` ADD CONSTRAINT `OrderStatusUpdates_fk0` FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`);

ALTER TABLE `UserPromotionSubscriptions` ADD CONSTRAINT `UserPromotionSubscriptions_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `UserPromotionSubscriptions` ADD CONSTRAINT `UserPromotionSubscriptions_fk1` FOREIGN KEY (`promotion_id`) REFERENCES `promotions`(`promotion_id`);

ALTER TABLE `user_type` ADD CONSTRAINT `user_type_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `product_details` ADD CONSTRAINT `product_details_fk0` FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`);

ALTER TABLE `skus` ADD CONSTRAINT `skus_fk0` FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`);

ALTER TABLE `OrderDetails` ADD CONSTRAINT `OrderDetails_fk0` FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`);

ALTER TABLE `OrderDetails` ADD CONSTRAINT `OrderDetails_fk1` FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`);

ALTER TABLE `carts` ADD CONSTRAINT `carts_fk0` FOREIGN KEY (`buyer_id`) REFERENCES `buyers`(`buyer_id`);

ALTER TABLE `carts` ADD CONSTRAINT `carts_fk1` FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`);

ALTER TABLE `otp` ADD CONSTRAINT `otp_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `otp` ADD CONSTRAINT `otp_fk1` FOREIGN KEY (`password_reset`) REFERENCES `password_reset`(`reset_token_id`);

ALTER TABLE `password_reset` ADD CONSTRAINT `password_reset_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);


















