SELECT
  u.id AS user_id,
  CONCAT(u.last_name, ' ', u.first_name) AS name,
  MAX(s.point) AS score
FROM
  users AS u
    LEFT OUTER JOIN scores AS s
    ON u.id = s.user_id
GROUP BY u.id;
