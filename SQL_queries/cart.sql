CREATE TABLE `products` (
	`product_id` int NOT NULL,
	`product_name` varchar NOT NULL,
	`product_details` TEXT NOT NULL,
	`product_image` blob NOT NULL,
	`price` DECIMAL NOT NULL,
	PRIMARY KEY (`product_id`)
);

CREATE TABLE `buyers` (
	`buyer_id` int NOT NULL,
	`buyer_name` varchar NOT NULL,
	`buyer_contact_info` bigint NOT NULL,
	PRIMARY KEY (`buyer_id`)
);

CREATE TABLE `sellers` (
	`seller_id` int NOT NULL,
	`seller_name` varchar NOT NULL,
	`seller_contact_info` bigint NOT NULL,
	PRIMARY KEY (`seller_id`)
);

CREATE TABLE `carts` (
	`cart_id` int NOT NULL,
	`buyer_id` int NOT NULL,
	`product_id` int NOT NULL,
	`quantity` int NOT NULL,
	PRIMARY KEY (`cart_id`)
);

CREATE TABLE `orders` (
	`order_id` int NOT NULL,
	`buyer_id` int NOT NULL,
	`seller_id` int NOT NULL,
	`order_date` DATE NOT NULL,
	PRIMARY KEY (`order_id`)
);

CREATE TABLE `OrderDetails` (
	`order_detail_id` int NOT NULL,
	`order_id` int NOT NULL,
	`product_id` int NOT NULL,
	`quantity` int NOT NULL,
	PRIMARY KEY (`order_detail_id`)
);

ALTER TABLE `carts` ADD CONSTRAINT `carts_fk0` FOREIGN KEY (`buyer_id`) REFERENCES `buyers`(`buyer_id`);

ALTER TABLE `carts` ADD CONSTRAINT `carts_fk1` FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`buyer_id`) REFERENCES `buyers`(`buyer_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk1` FOREIGN KEY (`seller_id`) REFERENCES `sellers`(`seller_id`);

ALTER TABLE `OrderDetails` ADD CONSTRAINT `OrderDetails_fk0` FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`);

ALTER TABLE `OrderDetails` ADD CONSTRAINT `OrderDetails_fk1` FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`);







