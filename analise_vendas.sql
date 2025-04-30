mysql> CREATE DATABASE analise_vendas;
Query OK, 1 row affected (0.118 sec)

mysql> USE analise_vendas;
Database changed
mysql> CREATE TABLE vendas (
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> produto VARCHAR(100),
    -> quantidade INT,
    -> preco_unitario DECIMAL (10, 2),
    -> data_venda DATE
    -> );
Query OK, 0 rows affected (0.249 sec)

mysql> INSERT INTO vendas (produto, quantidade, preco_unitario, data_venda)
    -> VALUES
    -> ('Camiseta', 5, 30.00, '2025-01-01'),
    -> ('Calça Jeans', 3, 80.00, '2025-01-03'),
    -> ('Boné', 7, 20.00, '2025-01-05'),
    -> ('Tênis', 2, 120.00, '2025-01-10'),
    -> ('Jaqueta', 1, 150.00, '2025-01-12');
Query OK, 5 rows affected (0.159 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM vendas;
+----+--------------+------------+----------------+------------+
| id | produto      | quantidade | preco_unitario | data_venda |
+----+--------------+------------+----------------+------------+
|  1 | Camiseta     |          5 |          30.00 | 2025-01-01 |
|  2 | Calça Jeans  |          3 |          80.00 | 2025-01-03 |
|  3 | Boné         |          7 |          20.00 | 2025-01-05 |
|  4 | Tênis        |          2 |         120.00 | 2025-01-10 |
|  5 | Jaqueta      |          1 |         150.00 | 2025-01-12 |
+----+--------------+------------+----------------+------------+
5 rows in set (0.122 sec)

mysql> SELECT produto, quantidade, preco_unitario,
    -> (quantidade * preco_unitario) AS total_venda
    -> FROM vendas;
+--------------+------------+----------------+-------------+
| produto      | quantidade | preco_unitario | total_venda |
+--------------+------------+----------------+-------------+
| Camiseta     |          5 |          30.00 |      150.00 |
| Calça Jeans  |          3 |          80.00 |      240.00 |
| Boné         |          7 |          20.00 |      140.00 |
| Tênis        |          2 |         120.00 |      240.00 |
| Jaqueta      |          1 |         150.00 |      150.00 |
+--------------+------------+----------------+-------------+
5 rows in set (0.085 sec)

mysql> SELECT produto, SUM(quantidade) AS total_vendido
    -> FROM vendas
    -> GROUP BY produto
    -> ORDER BY total_vendido DESC
    -> LIMIT 1;
+---------+---------------+
| produto | total_vendido |
+---------+---------------+
| Boné    |             7 |
+---------+---------------+
1 row in set (0.154 sec)

mysql> SELECT MONTH (data_venda) AS mes,
    -> SUM(quantidade * preco_unitario) AS total_vendas
    -> FROM vendas
    -> GROUP BY mes
    -> ORDER BY mes;
+------+--------------+
| mes  | total_vendas |
+------+--------------+
|    1 |       920.00 |
+------+--------------+
1 row in set (0.060 sec)

                                                                                                        