CREATE TABLE inventory (
    product_id INT,
    warehouse_id INT,
    date DATE,
    quantity INT
);

INSERT INTO inventory (product_id, warehouse_id, date, quantity)
VALUES
    (101, 1, '2023-09-01', 100),
    (101, 1, '2023-09-02', 150),
    (101, 2, '2023-09-01', 200),
    (101, 2, '2023-09-02', 250),
    (102, 1, '2023-09-01', 300),
    (102, 1, '2023-09-02', 350),
    (102, 2, '2023-09-01', 400),
    (102, 2, '2023-09-02', 450);

WITH LatestInventory AS (SELECT product_id, warehouse_id,MAX(date) AS latest_date FROM inventory GROUP BY product_id, warehouse_id)
SELECT i.product_id,i.warehouse_id,i.quantity AS total_quantity FROM inventory i JOIN LatestInventory li ON i.product_id = li.product_id
AND i.warehouse_id = li.warehouse_id AND i.date = li.latest_date;
