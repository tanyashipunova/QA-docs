/*Задача. В таблице orders есть три столбца order_id, user_id, date_time. Вывести пользователей и номера заказов, оформленных пользователями в первый раз. При решении использовать оконную функцию и подзапрос.*/

--Решение задачи через подзапрос
SELECT 
  temp.user_id, 
  o.order_id 
FROM 
  orders AS o 
  JOIN (
    SELECT 
      user_id, 
      min(date_time) AS date_min 
    FROM 
      orders 
    ORDER BY 
      user_id
  ) AS temp ON o.user_id = temp.user_id 
  AND o.date_time = temp.date_min 
ORDER BY 
  temp.user_id


--Решение задачи через оконную функцию
SELECT 
  min_d.user_id, 
  min_d.order_id 
FROM 
  (
    SELECT 
      order_id, 
      user_id, 
      min(date_time) OVER(PARTITION BY user_id) AS min_date 
    FROM 
      orders
  ) AS min_d 
WHERE 
  min_d.min_date = min_d.date_time 
ORDER BY 
  min_d.user_id;