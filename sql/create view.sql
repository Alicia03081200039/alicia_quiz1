CREATE VIEW Alicia_data AS 
SELECT
mahasiswa.StudentID AS StudentID, mahasiswa.Nama AS Nama, krs.kode_term AS term, SUM(matakuliah.sks) AS total_sks
FROM mahasiswa
LEFT JOIN krs ON mahasiswa.StudentID = krs.StudentID
LEFT JOIN krs_detail ON krs.kode_krs = krs_detail.kode_krs
LEFT JOIN matakuliah ON krs_detail.kode_matakuliah = matakuliah.kode_matakuliah
GROUP BY mahasiswa.StudentID, mahasiswa.Nama, krs.kode_term;

CREATE VIEW Alicia_matakuliah AS
SELECT
mahasiswa.StudentID AS StudentID, matakuliah.nama_matakuliah AS nama, matakuliah.kode_matakuliah AS kode, matakuliah.sks AS sks
FROM mahasiswa
LEFT JOIN krs ON mahasiswa.StudentID = krs.StudentID
LEFT JOIN krs_detail ON krs.kode_krs = krs_detail.kode_krs
LEFT JOIN matakuliah ON krs_detail.kode_matakuliah = matakuliah.kode_matakuliah