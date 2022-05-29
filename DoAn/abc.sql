use master 

drop database movieWebnew



create database movieWebnew
use movieWebnew


CREATE TABLE NguoiDung
(
    MaNguoiDung Char(1) NOT NULL ,
    HoTen       Char(1) ,
    GioiTinh    Char(1) ,
    Email       Char(1) ,
    SDT         Char(1) ,
    TaiKhoan    Char(1) ,
    MatKhau     Char(1),
        PRIMARY KEY (MaNguoiDung)

)
go


-- Table DatNuoc

CREATE TABLE DatNuoc
(
    MaNuoc Char(1) NOT NULL ,
    TenNuoc Char(1) ,
    MoTaVeDatNuoc Char(1),
        PRIMARY KEY (MaNuoc)

)
go


-- Table NgonNgu

CREATE TABLE NgonNgu
(
    MaNgonNgu     Char(1) NOT NULL ,
    TenNgonNgu    Char(1) ,
    MoTaVeNgonNgu Char(1),
        PRIMARY KEY (MaNgonNgu)

)

-- Table Phim

CREATE TABLE Phim
(
    MaPhim             Char(1) NOT NULL ,
    TenPhim            Char(1)          ,
    NgaySanXuat        Char(1)          ,
    NgayLenSong        Char(1)          ,
    NoiDungPhim        Char(1)          ,
    DiemIMDB           Char(1)          ,
    LuotXem            Char(1)          ,
    ThoiLuong          Char(1)          ,
    HinhBanner         Char(1)          ,
    LinkPhimBinhThuong Char(1)          ,
    TrailerPhim        Char(1)          ,
    LinkPhimVip        Char(1)          ,
    MaNuoc             Char(1)          ,
    MaNgonNgu          Char(1)          ,
    PRIMARY KEY (MaPhim),
    FOREIGN KEY (MaNuoc) REFERENCES DatNuoc (MaNuoc) ,
    FOREIGN KEY (MaNgonNgu) REFERENCES NgonNgu (MaNgonNgu)

)
go


-- Table TheLoai

CREATE TABLE TheLoai
(
    MaTheLoai     Char(1) NOT NULL ,
    TenTheLoai    Char(1) ,
    MoTaVeTheLoai Char(1)
        PRIMARY KEY (MaTheLoai),

)
go


-- Table TheLoaiCuaPhim

CREATE TABLE TheLoaiCuaPhim
(
    MaTheLoai Char(1) NOT NULL ,
    MaPhim    Char(1) NOT NULL
        PRIMARY KEY (MaTheLoai,MaPhim),
    FOREIGN KEY (MaTheLoai) REFERENCES TheLoai (MaTheLoai),
    FOREIGN KEY (MaPhim) REFERENCES Phim (MaPhim)

)
go


-- Table DienVien

CREATE TABLE DienVien
(
    MaDienVien      Char(1) NOT NULL ,
    TenDienVien     Char(1) ,
    HinhAnhDienVien Char(1) ,
    MoTaVeDienVien  Char(1)
        PRIMARY KEY (MaDienVien),

)
go


-- Table DienVienDongPhim

CREATE TABLE DienVienDongPhim
(
    MaPhim     Char(1) NOT NULL ,
    MaDienVien Char(1) NOT NULL ,
    TenVaiDien Char(1)
        PRIMARY KEY (MaPhim,MaDienVien),
    FOREIGN KEY (MaPhim) REFERENCES Phim (MaPhim),
    FOREIGN KEY (MaDienVien) REFERENCES DienVien (MaDienVien)

)
go


-- Table TheThanhVien

CREATE TABLE TheThanhVien
(
    MaTheThanhVien Char(1) NOT NULL ,
    NgayBatDau     Char(1) ,
    NgayKetThuc    Char(1) ,
    MaNguoiDung    Char(1) NOT NULL
        PRIMARY KEY (MaTheThanhVien,MaNguoiDung),
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung (MaNguoiDung)

)
go


-- Table Admin

CREATE TABLE Admin
(
    MaAdmin       Char(1) NOT NULL ,
    TaiKhoanAdmin Char(1) ,
    MatKhauAdmin  Char(1) ,
    tenAdmin      Char(1) ,
    NgayKhoiTao   Char(1)
        PRIMARY KEY (MaAdmin),

)
go




-- Table DanhGiaCuaPhim

CREATE TABLE DanhGiaCuaPhim
(
    MaPhim Char(1) NOT NULL ,
    ThoiGianDanhGia Char(1)
        PRIMARY KEY (MaPhim),
    FOREIGN KEY (MaPhim) REFERENCES Phim (MaPhim)
)
go


-- Table Tag

CREATE TABLE Tag
(
    MaTag Char(1) NOT NULL ,
    TenTag Char(1) ,
    NoiDungVeTag Char(1)
        PRIMARY KEY (MaTag),

)
go


-- Table TagCuaPhim

CREATE TABLE TagCuaPhim
(
    MaPhim Char(1) NOT NULL ,
    MaTag Char(1) NOT NULL
        PRIMARY KEY (MaPhim,MaTag),
    FOREIGN KEY (MaPhim) REFERENCES Phim (MaPhim),
    FOREIGN KEY (MaTag) REFERENCES Tag (MaTag)


)

go


-- Table DaoDien

CREATE TABLE DaoDien
(
    MaDaoDien Char(1) NOT NULL ,
    TenDaoDien Char(1) ,
    HinhAnhDaoDien Char(1) ,
    MoTaVeDaoDien Char(1)
        PRIMARY KEY (MaDaoDien),

)
go


-- Table DaoDienCuaPhim

CREATE TABLE DaoDienCuaPhim
(
    MaPhim Char(1) NOT NULL ,
    MaDaoDien Char(1) NOT NULL ,
    VaiTro Char(1)
        PRIMARY KEY (MaPhim,MaDaoDien),
    FOREIGN KEY (MaPhim) REFERENCES Phim (MaPhim),
    FOREIGN KEY (MaDaoDien) REFERENCES DaoDien (MaDaoDien)

)
go


-- Table DanhGiaPhim

CREATE TABLE DanhGiaPhim
(
    MaPhim Char(1) NOT NULL ,
    MaNguoiDung Char(1) NOT NULL ,
    SoSao Char(1) ,
    ThoiGianBinhLuan Char(1) ,
    NoiDungBinhLuan Char(1)
        PRIMARY KEY (MaPhim,MaNguoiDung),
    FOREIGN KEY (MaPhim) REFERENCES Phim (MaPhim),
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung (MaNguoiDung)

)
go


-- Table PhuongThucThanhToan

CREATE TABLE PhuongThucThanhToan
(
    MaPhuongThucTT Char(1) NOT NULL ,
    TenPhuongThucTT Char(1)
        PRIMARY KEY (MaPhuongThucTT),
)
go


-- Table ChiTietPhuongThucTT

CREATE TABLE ChiTietPhuongThucTT
(
    MaNguoiDung Char(1) NOT NULL ,
    MaPhuongThucTT Char(1) NOT NULL ,
    SoThe Char(1) ,
    SoHuu Char(1) ,
    MaXacThuc Char(1) ,
    NgayHetHan Char(1)
        PRIMARY KEY (MaNguoiDung,MaPhuongThucTT),
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung (MaNguoiDung),
    FOREIGN KEY (MaPhuongThucTT) REFERENCES PhuongThucThanhToan (MaPhuongThucTT)
)
go


-- Table DangKyThanhVienVip

CREATE TABLE DangKyThanhVienVip
(
    MaDangKy Char(1) NOT NULL ,
    SoTien Char(1) ,
    NgayThanhToan Char(1) ,
    MoTaVeDangKy Char(1) ,
    MaTheThanhVien Char(1) ,
    MaNguoiDung Char(1) ,
    PRIMARY KEY (MaDangKy),
    FOREIGN KEY (MaTheThanhVien, MaNguoiDung) REFERENCES TheThanhVien (MaTheThanhVien, MaNguoiDung),
)
go
