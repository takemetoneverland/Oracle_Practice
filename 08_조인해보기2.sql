-- �̳� ����
SELECT * FROM info
INNER JOIN auth 
ON info.auth_id = auth.auth_id;

-- ����Ŭ ���� (�� ��� ���Ѵ�.)
SELECT * 
FROM info, auth
WHERE info.auth_id = auth.auth_id;

-- auth_id �÷��� �׳� ���ø� ��ȣ�ϴ� ��� ���.
-- �� ������ ���� ���̺� ��� �����ϱ� �����̴�.
-- �̷� �� �÷��� ���̺� �̸��� ������, ��Ī�� �Ἥ 
-- ������ Ȯ���ϰ� �ؾ��Ѵ�..
SELECT info.auth_id, title, content, name
FROM info
INNER JOIN auth
ON info.auth_id = auth.auth_id;

-- �ʿ��� �����͸� ��ȸ�ϰڴ�! ��� �Ѵٸ�
-- WHERE ������ ���� �Ϲ� ���� �ɾ��ָ� �ȴ�.
SELECT
    i.auth_id, i.title, i.content, a.name
FROM info i
INNER JOIN auth a
ON i.auth_id = a.auth_id
WHERE a.name = 'ȫ����';

-- �ƿ��� ����
SELECT *
FROM info i LEFT JOIN auth a
ON i.auth_id = a.auth_id;

-- ����Ŭ ����
SELECT *
FROM info i, auth a
WHERE i.auth_id = a.auth_id(+);

-- ���� ���̺�� ���� ���̺� �����͸� ��� �о� �ߺ��� �����ʹ� �����Ǵ� �ܺ� ����
SELECT *
FROM info i FULL OUTER JOIN auth a
ON i.auth_id = a.auth_id;

-- CROSS JOIN�� JOIN������ �������� �ʱ� ������
-- ��� �÷��� ���� JOIN�� �����Ѵ�.
-- �����δ� ���� ������� �ʴ´�.
SELECT * FROM info 
CROSS JOIN auth
ORDER BY id ASC;

-- ���� ���̺� ���� -> Ű ���� ã�Ƽ� ������ �����ؼ� ���� �ȴ�.
SELECT *
FROM employees e
LEFT OUTER JOIN departments d ON e.department_id = d.department_id
LEFT OUTER JOIN locations loc ON d.department_id = loc.location_id;

/*
- ���̺� ��Ī a, i�� �̿��Ͽ� LEFT OUTER JOIN ���
- info, auth ���̺��� ���
- job �÷��� scientist�� ����� id, title, content, job�� ���.
*/
SELECT
    i.id, i.title, i.content, a.job
FROM info i RIGHT OUTER JOIN auth a
ON i.auth_id = a.auth_id
WHERE a.job = 'scientist';