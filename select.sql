# 1.Query the existence of 1 course
SELECT * FROM student_course WHERE courseId = "1";

# 2.Query the presence of both 1 and 2 courses
SELECT * FROM student_course WHERE courseId = "1" OR courseId = "2" ;

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
SELECT student.id,student.name,AVG(student_course.score)
FROM student,student_course
WHERE student.id = student_course.studentId
GROUP BY student_course.studentId
HAVING AVG(student_course.score)>=60;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
SELECT * 
FROM student_course 
WHERE student_course.score IS NULL;

# 5.Query all SQL with grades
SELECT * 
FROM student_course 
WHERE student_course.score IS NOT NULL;

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
SELECT student_course.studentId
FROM student_course
WHERE student_course.courseId='1' AND student_course.studentId IN
(	SELECT student_course.studentId 
	FROM student_course
	WHERE student_course.courseId='2');

# 7.Retrieve 1 student score with less than 60 scores in descending order
SELECT student_course.studentId,student_course.score
FROM student_course
WHERE student_course.courseId='1' AND student_course.studentId IN
(	SELECT student_course.studentId 
	FROM student_course
	WHERE student_course.score < 60)
ORDER BY student_course.score DESC;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT student_course.courseId,AVG(student_course.score)
FROM student_course
GROUP BY student_course.courseId
ORDER BY AVG(student_course.score) DESC;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
SELECT student.`name`,student_course.score
FROM student_course,student,course
WHERE course.`name`="Math" 
	AND course.id=student_course.courseId
		AND student_course.studentId=student.id
			AND student_course.score < 60;

