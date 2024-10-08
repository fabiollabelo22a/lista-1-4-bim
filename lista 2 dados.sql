--1.
CREATE VIEW alunos_cursos AS
SELECT a.nome AS nome_aluno, d.nome_disciplina, c.nome_curso
FROM Alunos a
JOIN Matrículas m ON a.aluno_id = m.aluno_id
JOIN Disciplinas d ON m.disciplina_id = d.disciplina_id
JOIN Cursos c ON d.curso_id = c.curso_id;

--2.
CREATE VIEW total_alunos_por_disciplina AS
SELECT d.nome_disciplina, COUNT(m.aluno_id) AS total_alunos
FROM Disciplinas d
JOIN Matrículas m ON d.disciplina_id = m.disciplina_id
GROUP BY d.nome_disciplina;

--3. 
CREATE VIEW alunos_status_matricula AS
SELECT a.nome AS nome_aluno, d.nome_disciplina, m.status
FROM Alunos a
JOIN Matrículas m ON a.aluno_id = m.aluno_id
JOIN Disciplinas d ON m.disciplina_id = d.disciplina_id;

--4. 
CREATE VIEW professores_turmas AS
SELECT p.nome_professor, d.nome_disciplina, t.horario
FROM Professores p
JOIN Turmas t ON p.professor_id = t.professor_id
JOIN Disciplinas d ON t.disciplina_id = d.disciplina_id;

--5.
CREATE VIEW alunos_maiores_20 AS
SELECT nome, data_nascimento
FROM Alunos
WHERE EXTRACT(YEAR FROM AGE(data_nascimento)) > 20;

--6. 
CREATE VIEW carga_horaria_por_curso AS
SELECT c.nome_curso, COUNT(d.disciplina_id) AS total_disciplinas, SUM(d.carga_horaria) AS carga_horaria_total
FROM Cursos c
JOIN Disciplinas d ON c.curso_id = d.curso_id
GROUP BY c.nome_curso;

--7.  
CREATE VIEW professores_especialidades AS
SELECT nome_professor, especialidade
FROM Professores;

--8. 
CREATE VIEW alunos_multiplas_disciplinas AS
SELECT a.nome AS nome_aluno, COUNT(m.disciplina_id) AS total_disciplinas
FROM Alunos a
JOIN Matrículas m ON a.aluno_id = m.aluno_id
GROUP BY a.nome
HAVING COUNT(m.disciplina_id) > 1;

--9. 
CREATE VIEW alunos_disciplinas_concluidas AS
SELECT a.nome AS nome_aluno, COUNT(m.disciplina_id) AS total_concluidas
FROM Alunos a
JOIN Matrículas m ON a.aluno_id = m.aluno_id
WHERE m.status = 'Concluído'
GROUP BY a.nome;

--10.
CREATE VIEW turmas_por_semestre AS
SELECT t.turma_id, d.nome_disciplina, t.horario
FROM Turmas t
JOIN Disciplinas d ON t.disciplina_id = d.disciplina_id
WHERE t.semestre = '2024.1';

--11.
CREATE VIEW alunos_matriculas_trancadas AS
SELECT a.nome
FROM Alunos a
JOIN Matrículas m ON a.aluno_id = m.aluno_id
WHERE m.status = 'Trancado';

--12.
CREATE VIEW disciplinas_sem_alunos AS
SELECT d.nome_disciplina
FROM Disciplinas d
LEFT JOIN Matrículas m ON d.disciplina_id = m.disciplina_id
WHERE m.aluno_id IS NULL;

--13.
CREATE VIEW alunos_por_status AS
SELECT m.status, COUNT(m.aluno_id) AS total_alunos
FROM Matrículas m
GROUP BY m.status;

--14.
CREATE VIEW total_professores_especialidade AS
SELECT especialidade, COUNT(professor_id) AS total_professores
FROM Professores
GROUP BY especialidade;

--15.
CREATE VIEW alunos_idades AS
SELECT nome, EXTRACT(YEAR FROM AGE(data_nascimento)) AS idade
FROM Alunos;

--16.
CREATE VIEW alunos_ultimas_matriculas AS
SELECT a.nome, MAX(m.data_matricula) AS ultima_matricula
FROM Alunos a
JOIN Matrículas m ON a.aluno_id = m.aluno_id
GROUP BY a.nome;

--17.
CREATE VIEW disciplinas_por_curso AS
SELECT d.nome_disciplina
FROM Disciplinas d
JOIN Cursos c ON d.curso_id = c.curso_id
WHERE c.nome_curso = 'Engenharia de Software';

--18.
CREATE VIEW professores_sem_turmas AS
SELECT p.nome_professor
FROM Professores p
LEFT JOIN Turmas t ON p.professor_id = t.professor_id
WHERE t.turma_id IS NULL;

--19.

CREATE VIEW alunos_cpf_email AS
SELECT nome, cpf, email
FROM Alunos;

--20. 

CREATE VIEW total_disciplinas_por_professor AS
SELECT p.nome_professor, COUNT(t.disciplina_id) AS total_disciplinas
FROM Professores p
JOIN Turmas t ON p.professor_id = t.professor_id
GROUP BY p.nome_professor;