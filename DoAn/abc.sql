use master 

drop database movieWebnew



create database movieWebnew
use movieWebnew


CREATE TABLE NguoiDung
(
    MaNguoiDung CHAR    (5 ) NOT NULL ,
    HoTen       NVARCHAR(35)          ,
    GioiTinh    NVARCHAR(3 )          ,
    Email       VARCHAR (35)          ,
    SDT         CHAR    (10)          ,
    TaiKhoan    VARCHAR (20)          ,
    MatKhau     VARCHAR (30)          ,
        PRIMARY KEY (MaNguoiDung)

)
go


-- Table DatNuoc

CREATE TABLE DatNuoc
(
    MaNuoc        CHAR    (5 ) NOT NULL ,
    TenNuoc       NVARCHAR(20)          ,
    MoTaVeDatNuoc NVARCHAR(50)          ,
        PRIMARY KEY (MaNuoc)

)
go


-- Table NgonNgu

CREATE TABLE NgonNgu
(
    MaNgonNgu CHAR(5) NOT NULL ,
    TenNgonNgu NVARCHAR(10) ,
    MoTaVeNgonNgu NVARCHAR(20),
        PRIMARY KEY (MaNgonNgu),

)

-- Table Phim

CREATE TABLE Phim
(
    MaPhim             CHAR    (5) NOT NULL ,
    TenPhim            NVARCHAR(35)         ,
    NgaySanXuat        DATE                 ,
    NgayLenSong        DATE                 ,
    NoiDungPhim        NVARCHAR(200)        ,
    DiemIMDB           FLOAT                ,
    LuotXem            INT                  ,
    ThoiLuong          DATE                 ,
    HinhBanner         VARCHAR (50)         ,
    LinkPhimBinhThuong VARCHAR (50)         ,
    TrailerPhim        VARCHAR (50)         ,
    LinkPhimVip        VARCHAR (50)         ,
    MaNuoc             CHAR    (5)          ,
    MaNgonNgu          CHAR    (5)          ,
    PRIMARY KEY (MaPhim),
    FOREIGN KEY (MaNuoc) REFERENCES DatNuoc (MaNuoc) ,
    FOREIGN KEY (MaNgonNgu) REFERENCES NgonNgu (MaNgonNgu)

)
go


-- Table TheLoai

CREATE TABLE TheLoai
(
    MaTheLoai     CHAR    (5 ) NOT NULL ,
    TenTheLoai    NVARCHAR(19)          ,
    MoTaVeTheLoai NVARCHAR(50)          ,
        PRIMARY KEY (MaTheLoai)

)
go


-- Table TheLoaiCuaPhim

CREATE TABLE TheLoaiCuaPhim
(
    MaTheLoai CHAR(5) NOT NULL ,
    MaPhim    CHAR(5) NOT NULL ,
        PRIMARY KEY (MaTheLoai,MaPhim),
    FOREIGN KEY (MaTheLoai) REFERENCES TheLoai (MaTheLoai),
    FOREIGN KEY (MaPhim) REFERENCES Phim (MaPhim)

)
go


-- Table DienVien

CREATE TABLE DienVien
(
    MaDienVien      CHAR     (5  ) NOT NULL ,
    TenDienVien     NVARCHAR (35 )          ,
    HinhAnhDienVien VARCHAR  (50 )          ,
    MoTaVeDienVien  VARCHAR  (50 )          ,
        PRIMARY KEY (MaDienVien)

)
go


-- Table DienVienDongPhim

CREATE TABLE DienVienDongPhim
(
    MaPhim     CHAR    (5 ) NOT NULL ,
    MaDienVien CHAR    (5 ) NOT NULL ,
    TenVaiDien NVARCHAR(15)          ,
        PRIMARY KEY (MaPhim,MaDienVien),
    FOREIGN KEY (MaPhim) REFERENCES Phim (MaPhim),
    FOREIGN KEY (MaDienVien) REFERENCES DienVien (MaDienVien)

)
go


-- Table TheThanhVien

CREATE TABLE TheThanhVien
(
    MaTheThanhVien CHAR(5) NOT NULL ,
    NgayBatDau     DATE             ,
    NgayKetThuc    DATE             ,
    MaNguoiDung    CHAR(5) NOT NULL ,
        PRIMARY KEY (MaTheThanhVien,MaNguoiDung),
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung (MaNguoiDung)

)
go


-- Table Admin

CREATE TABLE Admin
(
    MaAdmin       CHAR     (5) NOT NULL ,
    TaiKhoanAdmin CHAR     (20)         ,
    MatKhauAdmin  VARCHAR  (30)         ,
    tenAdmin      NVARCHAR(35)          ,
    NgayKhoiTao   DATE                  ,
        PRIMARY KEY (MaAdmin)

)
go




-- Table DanhGiaCuaPhim

CREATE TABLE DanhGiaCuaPhim
(
    MaPhim          CHAR(5) NOT NULL ,
    ThoiGianDanhGia DATE             ,
        PRIMARY KEY (MaPhim),
    FOREIGN KEY (MaPhim) REFERENCES Phim (MaPhim)
)
go


-- Table Tag

CREATE TABLE Tag
(
    MaTag        CHAR    (5 ) NOT NULL ,
    TenTag       NVARCHAR(15)          ,
    NoiDungVeTag VARCHAR (50)          ,
        PRIMARY KEY (MaTag)

)
go


-- Table TagCuaPhim

CREATE TABLE TagCuaPhim
(
    MaPhim CHAR(5) NOT NULL ,
    MaTag  CHAR(5) NOT NULL ,
        PRIMARY KEY (MaPhim,MaTag),
    FOREIGN KEY (MaPhim) REFERENCES Phim (MaPhim),
    FOREIGN KEY (MaTag) REFERENCES Tag (MaTag)


)

go


-- Table DaoDien

CREATE TABLE DaoDien
(
    MaDaoDien      CHAR    (5 ) NOT NULL ,
    TenDaoDien     NVARCHAR(35)          ,
    HinhAnhDaoDien VARCHAR (50)          ,
    MoTaVeDaoDien  VARCHAR (50)          ,
        PRIMARY KEY (MaDaoDien)

)
go


-- Table DaoDienCuaPhim

CREATE TABLE DaoDienCuaPhim
(
    MaPhim    CHAR    (5 ) NOT NULL ,
    MaDaoDien CHAR    (5 ) NOT NULL ,
    VaiTro    NVARCHAR(10)          ,
        PRIMARY KEY (MaPhim,MaDaoDien),
    FOREIGN KEY (MaPhim) REFERENCES Phim (MaPhim),
    FOREIGN KEY (MaDaoDien) REFERENCES DaoDien (MaDaoDien)

)
go


-- Table DanhGiaPhim

CREATE TABLE DanhGiaPhim
(
    MaPhim           CHAR    (5) NOT NULL ,
    MaNguoiDung      CHAR    (5) NOT NULL ,
    SoSao            BIT                  ,
    ThoiGianBinhLuan DATE                 ,
    NoiDungBinhLuan  NVARCHAR(50)         ,
        PRIMARY KEY (MaPhim,MaNguoiDung),
    FOREIGN KEY (MaPhim) REFERENCES Phim (MaPhim),
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung (MaNguoiDung)

)
go


-- Table PhuongThucThanhToan

CREATE TABLE PhuongThucThanhToan
(
    MaPhuongThucTT  CHAR    (5 ) NOT NULL ,
    TenPhuongThucTT NVARCHAR(20)          ,
        PRIMARY KEY (MaPhuongThucTT)
)
go


-- Table ChiTietPhuongThucTT

CREATE TABLE ChiTietPhuongThucTT
(
    MaNguoiDung    CHAR   (5) NOT NULL ,
    MaPhuongThucTT CHAR   (5) NOT NULL ,
    SoThe          VARCHAR(19)         ,
    SoHuu          VARCHAR(35)         ,
    MaXacThuc      CHAR   (8)          ,
    NgayHetHan     DATE                ,
        PRIMARY KEY (MaNguoiDung,MaPhuongThucTT),
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung (MaNguoiDung),
    FOREIGN KEY (MaPhuongThucTT) REFERENCES PhuongThucThanhToan (MaPhuongThucTT)
)
go


-- Table DangKyThanhVienVip

CREATE TABLE DangKyThanhVienVip
(
    MaDangKy       CHAR    (5) NOT NULL ,
    SoTien         INT                  ,
    NgayThanhToan  DATE                 ,
    MoTaVeDangKy   NVARCHAR(50)         ,
    MaTheThanhVien CHAR    (5)          ,
    MaNguoiDung    CHAR    (5)          ,
    PRIMARY KEY (MaDangKy),
    FOREIGN KEY (MaTheThanhVien, MaNguoiDung) REFERENCES TheThanhVien (MaTheThanhVien, MaNguoiDung)
)
go
