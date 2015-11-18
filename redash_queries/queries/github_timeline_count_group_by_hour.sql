SELECT
  STRFTIME_UTC_USEC(created_at, "%Y-%m-%d %H:00:00") AS hour,
  COUNT(*) AS cnt
FROM
  TABLE_DATE_RANGE(
    githubarchive:day.events_,
    DATE_ADD(CURRENT_TIMESTAMP(), -3, 'DAY'),
    CURRENT_TIMESTAMP()
  )
GROUP BY
  hour
ORDER BY
  hour
