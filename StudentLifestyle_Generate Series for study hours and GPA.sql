WITH bins AS (
	SELECT generate_series(5, 9, 1) AS lower,
	generate_series(6, 10, 1) AS upper),
study_hours AS (
	SELECT [Study_Hours_Per_Day], GPA
	FROM student_lifestyle_dataset
	)
SELECT lower, upper, AVG([GPA])
FROM bins
LEFT JOIN avg_gpa
ON study_hours_per_day >= lower
AND study_hours_per_day < upper
GROUP BY lower, upper
ORDER BY lower;