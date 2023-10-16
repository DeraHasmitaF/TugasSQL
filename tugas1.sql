create database penjualandvd;
use penjualandvd;

CREATE TABLE kecamatan (
    id_kecamatan SMALLINT PRIMARY KEY,
    kecamatan VARCHAR(45)
);

CREATE TABLE kelurahan (
    id_kelurahan SMALLINT PRIMARY KEY,
    id_kecamatan SMALLINT REFERENCES kecamatan(id_kecamatan),
    kelurahan VARCHAR(45)
);

CREATE TABLE pelanggan (
    kode_pelanggan VARCHAR(10) PRIMARY KEY,
    id_kelurahan SMALLINT REFERENCES kelurahan(id_kelurahan),
    nama VARCHAR(45),
    alamat VARCHAR(60),
    jenis_kelamin CHAR(1),
    CHECK (jenis_kelamin IN ('P', 'L'))
);

CREATE TABLE movie (
    kode_dvd VARCHAR(10) PRIMARY KEY,
    judul VARCHAR(60),
    harga_sewa DOUBLE,
    denda DOUBLE,
    tahun_rilis SMALLINT
);

CREATE TABLE genre (
    id_genre SMALLINT PRIMARY KEY,
    genre VARCHAR(45)
);

CREATE TABLE genre_movie (
    id_genre SMALLINT REFERENCES genre(id_genre),
    kode_dvd VARCHAR(10) REFERENCES movie(kode_dvd),
    PRIMARY KEY (id_genre, kode_dvd)
);

CREATE TABLE transaksi (
    kode_dvd VARCHAR(10) REFERENCES movie(kode_dvd),
    kode_pelanggan VARCHAR(10) REFERENCES pelanggan(kode_pelanggan),
    tanggal_sewa DATE,
    tanggal_wajib_kembali DATE,
    tanggal_realisasi_kembali DATE,
    PRIMARY KEY (kode_dvd, kode_pelanggan, tanggal_sewa)
);

CREATE TABLE kontak_pelanggan (
    no_hp VARCHAR(25) UNIQUE,
    kode_pelanggan VARCHAR(10) REFERENCES pelanggan(kode_pelanggan)
);

ALTER TABLE movie MODIFY tahun_rilis YEAR(4);
