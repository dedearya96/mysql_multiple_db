CREATE DATABASE multi_majikan;
CREATE DATABASE multi_nama_peliharaan;
CREATE DATABASE multi_peliharaan;

CREATE DATABASE multi_peliharaan;

use multi_majikan;
CREATE TABLE majikan(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(50),
    alamat TEXT,
    date DATE
);

INSERT INTO majikan (nama, alamat, date) VALUES
('Surya', 'Pengalongan', '2023-06-18'),
('Andi', 'Magelang', '2023-06-17'),
('Panji', 'Bogor', '2023-06-16'),
('Sinta', 'Semarang', '2023-06-15'),
('Santi', 'Surabaya', '2023-06-14')

use multi_nama_peliharaan;
CREATE TABLE nama_peliharaan(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nama_peliharaan VARCHAR(50)
);
INSERT INTO nama_peliharaan (nama_peliharaan) VALUES
('ANJING'),
('SAPI'),
('KUCING')

CREATE TABLE peliharaan(
	id INT PRIMARY KEY AUTO_INCREMENT,
    majikan_id INT,
    nama_peliharaan_id INT,
    FOREIGN KEY(majikan_id) REFERENCES multi_majikan.majikan(id),
    FOREIGN KEY(nama_peliharaan_id) REFERENCES multi_nama_peliharaan.nama_peliharaan(id)
);
INSERT INTO peliharaan (majikan_id, nama_peliharaan_id) VALUES
(1, 1),
(1,2),
(2,2),
(3,3)

SELECT m.nama, COUNT(n1.nama_peliharaan_id) AS 'ANJING', COUNT(n2.nama_peliharaan_id) AS 'SAPI', COUNT(n3.nama_peliharaan_id ) AS 'KUCING'
FROM multi_majikan.majikan m
LEFT JOIN multi_peliharaan.peliharaan n1 ON m.id = n1.majikan_id AND n1.nama_peliharaan_id = (SELECT id FROM multi_nama_peliharaan.nama_peliharaan WHERE nama_peliharaan = 'ANJING')
LEFT JOIN multi_peliharaan.peliharaan n2 ON m.id = n2.majikan_id AND n2.nama_peliharaan_id = (SELECT id FROM multi_nama_peliharaan.nama_peliharaan WHERE nama_peliharaan = 'SAPI')
LEFT JOIN multi_peliharaan.peliharaan n3 ON m.id = n3.majikan_id AND n3.nama_peliharaan_id = (SELECT id FROM multi_nama_peliharaan.nama_peliharaan WHERE nama_peliharaan = 'KUCING')
GROUP BY m.nama
ORDER BY m.nama DESC;

SELECT m.nama,
       SUM(IF(np.nama_peliharaan = 'ANJING', 1, 0)) AS 'ANJING',
       SUM(IF(np.nama_peliharaan = 'SAPI', 1, 0)) AS 'SAPI',
       SUM(IF(np.nama_peliharaan = 'KUCING', 1, 0)) AS 'KUCING'
FROM multi_majikan.majikan m
LEFT JOIN multi_peliharaan.peliharaan n ON m.id = n.majikan_id
LEFT JOIN multi_nama_peliharaan.nama_peliharaan np ON n.nama_peliharaan_id = np.id
GROUP BY m.nama
ORDER BY m.nama DESC;

SELECT m.nama,
       (SELECT COUNT(*) FROM multi_peliharaan.peliharaan n INNER JOIN multi_nama_peliharaan.nama_peliharaan np ON n.nama_peliharaan_id = np.id WHERE n.majikan_id = m.id AND np.nama_peliharaan = 'ANJING') AS 'ANJING',
       (SELECT COUNT(*) FROM multi_peliharaan.peliharaan n INNER JOIN multi_nama_peliharaan.nama_peliharaan np ON n.nama_peliharaan_id = np.id WHERE n.majikan_id = m.id AND np.nama_peliharaan = 'SAPI') AS 'SAPI',
       (SELECT COUNT(*) FROM multi_peliharaan.peliharaan n INNER JOIN multi_nama_peliharaan.nama_peliharaan np ON n.nama_peliharaan_id = np.id WHERE n.majikan_id = m.id AND np.nama_peliharaan = 'KUCING') AS 'KUCING'
FROM multi_majikan.majikan m
ORDER BY m.nama DESC;


