CREATE TABLE `sellers` (
	`id` int NOT NULL,
	`seller_name` varchar NOT NULL,
	`seller_contact_info` varchar NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `products` (
	`id` int NOT NULL,
	`seller_id` int NOT NULL,
	`product_name` varchar NOT NULL,
	`product_image` blob NOT NULL,
	`product_description` TEXT NOT NULL,
	PRIMARY KEY (`id`)
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

ALTER TABLE `products` ADD CONSTRAINT `products_fk0` FOREIGN KEY (`seller_id`) REFERENCES `sellers`(`id`);

ALTER TABLE `product_details` ADD CONSTRAINT `product_details_fk0` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`);

ALTER TABLE `skus` ADD CONSTRAINT `skus_fk0` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`);





