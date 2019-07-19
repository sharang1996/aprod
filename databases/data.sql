use aprod;

set FOREIGN_KEY_CHECKS = 0;
truncate coupons;
truncate products;
truncate artists;
truncate categories;
set FOREIGN_KEY_CHECKS = 1;

insert into categories (name) values
    ("Category 1"),
    ("Category 2"),
    ("Category 3"),
    ("Category 4")
;

insert into artists (name) values
    ("Artist 1"),
    ("Artist 2"),
    ("Artist 3"),
    ("Artist 4")
;

insert into products (name, price, cid, aid) values
    ("Product 1", 100.00, 1, 1),
    ("Product 2", 140.00, 1, 2),
    ("Product 3", 150.00, 2, 3),
    ("Product 4", 130.00, 2, 4),
    ("Product 5",  50.00, 3, 4),
    ("Product 6", 150.00, 3, 3),
    ("Product 7",  43.50, 4, 2),
    ("Product 8",   4.35, 4, 1)
;

insert into coupons (name, discount_percent) values
    ("50% Off!", 50.00),
    ("10% Off!", 10.00),
    ("15% Off!", 15.00),
    ("90% Off!", 90.00)
;
