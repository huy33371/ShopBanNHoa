USE [master]
GO
/****** Object:  Database [PERFUMESHOP]    Script Date: 09/01/2023 8:31:59 CH ******/
CREATE DATABASE [PERFUMESHOP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PERFUMESHOP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PERFUMESHOP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PERFUMESHOP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PERFUMESHOP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PERFUMESHOP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PERFUMESHOP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PERFUMESHOP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET ARITHABORT OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PERFUMESHOP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PERFUMESHOP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PERFUMESHOP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PERFUMESHOP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET RECOVERY FULL 
GO
ALTER DATABASE [PERFUMESHOP] SET  MULTI_USER 
GO
ALTER DATABASE [PERFUMESHOP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PERFUMESHOP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PERFUMESHOP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PERFUMESHOP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PERFUMESHOP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PERFUMESHOP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PERFUMESHOP', N'ON'
GO
ALTER DATABASE [PERFUMESHOP] SET QUERY_STORE = OFF
GO
USE [PERFUMESHOP]
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MALOAI]    Script Date: 09/01/2023 8:31:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[AUTO_MALOAI]()
RETURNS VARCHAR(5)
AS
BEGIN
    DECLARE @ID VARCHAR(5)
    IF (SELECT COUNT(maLoai) FROM dbo.LoaiSP ) = 0
        SET @ID = '0'
    ELSE
        SELECT @ID = MAX(RIGHT(maLoai, 3)) FROM dbo.LoaiSP
        SELECT @ID = CASE
            WHEN @ID >= 0 and @ID < 9 THEN 'L00' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
            WHEN @ID >= 9 THEN 'L0' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
        END
    RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MASP]    Script Date: 09/01/2023 8:31:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_MASP]()
RETURNS VARCHAR(5)
AS
BEGIN
    DECLARE @ID VARCHAR(5)
    IF (SELECT COUNT(maSP) FROM dbo.SanPham ) = 0
        SET @ID = '0'
    ELSE
        SELECT @ID = MAX(RIGHT(maSP, 3)) FROM dbo.SanPham
        SELECT @ID = CASE
            WHEN @ID >= 0 and @ID < 9 THEN 'SP00' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
            WHEN @ID >= 9 THEN 'SP0' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
        END
    RETURN @ID
END
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 09/01/2023 8:31:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[maLoai] [varchar](5) NOT NULL,
	[tenLoai] [nvarchar](50) NOT NULL,
	[ghiChu] [nvarchar](50) NULL,
	[Anh] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 09/01/2023 8:31:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[maSP] [varchar](5) NOT NULL,
	[tenSP] [ntext] NOT NULL,
	[maLoai] [varchar](5) NOT NULL,
	[maTH] [varchar](5) NOT NULL,
	[moTa] [ntext] NULL,
	[donGia] [int] NOT NULL,
	[soLuong] [int] NULL,
	[Anh] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[maSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 09/01/2023 8:31:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[maTH] [varchar](5) NOT NULL,
	[tenTH] [nvarchar](50) NOT NULL,
	[moTa] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[maTH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [Anh]) VALUES (N'L001', N'Nước hoa nam', N'Nước hoa dành cho nam giới', N'banner-nuoc-hoa-nam.jpg')
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [Anh]) VALUES (N'L002', N'Nước hoa nữ', N'Nước hoa dành cho phái nữ', N'banner-the-gioi-nuoc-hoa-nu.jpg')
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [Anh]) VALUES (N'L003', N'Đồng hồ nam', N'Đồng hồ nam', N'dong_ho_nam.jpg')
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [Anh]) VALUES (N'L004', N'Đồng hồ nữ', N'Đồng hồ nữ', N'dong_ho_nu.jpg')
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [Anh]) VALUES (N'L005', N'Ví da', N'Ví da nam', N'phukien.jpg')
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [Anh]) VALUES (N'L006', N'Túi xách', N'Túi xách nữ', N'tui_xach.jpg')
GO
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP001', N'212 NYC Men', N'L001', N'CRHRE', N'Nước hoa 212 Men NYC thể hiện hương thơm mang chất nam tính, lạ, và đầy lôi cuốn ,mùi hương ngào ngạt này là sự tương phản giữa sự tươi mát của cam, quýt và sự gợi cảm nồng nàn của các loại gỗ và gia vị. Tất cả được bao bọc lên bởi sự nhẹ nhàng xuyên suốt từ hương đầu tới hương cuối. Nét đặc sắc của hoa dành dành tươi làm nổi bật sự nhẹ nhàng của hương trầm, hương nồng ấm của hạt tiêu và gừng, gỗ đàn hương cùng sự gợi tình trong hương thơm của gỗ Gaiac.', 1950000, 32, N'products/212_nyc_men.jpg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP002', N'212 Sexy men', N'L001', N'CRHRE', N'212 Sexy Men sẽ là dòng nước hoa lý tưởng mà bất kỳ người đàn ông hiện đại nào cũng ao ước bổ sung vào bộ sưu tập của mình. Với hương thơm từ quýt tươi, gỗ ấm hứa hẹn sẽ là sự lựa chọn hoàn hảo để sử dụng ở bất kỳ dịp nào.', 1990000, 40, N'products/212-Sexy-men.jpg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP003', N'212 VIP Black', N'L001', N'CRHRE', N'212 Vip Black của Carolina Herrera là hương thơm mới thuộc nhóm Fougere dành cho nam, ra mắt vào năm 2017, sáng tạo bởi Carlos Benaim và Annie Flipo. Hương đầu là sự kết hợp của rượu apsinthe, hồi và thì là. Hương giữa là hoa oải hương, hương cuối là xạ hương và vanilla đen.', 2150000, 25, N'products/212-vip-black.jpg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP004', N'212 Vip', N'L002', N'CRHRE', N'212 Vip với hương thơm nữ tính quyến rũ thích hợp sử dụng chủ yếu vào ban đêm, tuy cũng có thể sử dụng tốt vào ban ngày, đặc biệt là vào hai mùa thu và đông.', 1950000, 22, N'products/212-VIP-Carolina-Herrera-Golden-For-Women-80ml-1.png')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP005', N'212 VIP Men', N'L001', N'CRHRE', N'212 VIP For Men mang hương thơm nam tính, lôi cuốn và tươi mát, thích hợp dùng cả ngày lẫn đêm vào mùa thu, đông.', 1990000, 37, N'products/212-vip-men-are-you-in-the-list-300x300.jpg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP006', N'212 Vip Rose for Women', N'L002', N'CRHRE', N'212 Vip Rose for Women mang hương thơm nữ tính, lôi cuốn và gợi cảm, phù hợp dùng cả ngày lẫn đêm vào mùa xuân, hạ.', 1990000, 45, N'products/212-vip-rose.jpg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP007', N'212 Vip Limited', N'L002', N'CRHRE', N'12 Vip với hương thơm nữ tính quyến rũ thích hợp sử dụng chủ yếu vào ban đêm, tuy cũng có thể sử dụng tốt vào ban ngày, đặc biệt là vào hai mùa thu và đông.', 1890000, 64, N'products/212 Vip Limited.jpg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP008', N'ACQUA DI GIÒ ABSOLU', N'L001', N'GGAMA', N'Qua lăng kính của Giorgio Armani, sự kết hợp của nước và gỗ sẽ đưa chúng ta vào một cuộc hành trình đầy nam tính vượt không gian đến với miền biển đầy nắng gió.', 2850000, 35, N'products/ACQUA-DI-GIÒ-ABSOLU.jpg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP009', N'Acqua Di Gio', N'L001', N'GGAMA', N'Acqua Di Gio mang hương thơm mạnh mẽ, tự tin và lôi cuốn, thích hợp dùng cả ngày lẫn đêm vào mùa hạ.', 2150000, 16, N'products/ACQUA-DI-GIO.jpg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP010', N'Acqua Di Gioia', N'L002', N'GGAMA', N'Acqua di Gioia mang hương thơm nữ tính, nhẹ nhàng và tươi tắn, thích hợp dùng cả ngày lẫn đêm vào mùa hạ.', 2350000, 24, N'products/acqua-di-gioia-edp.jpg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP011', N'Amouage Lyric Man', N'L001', N'AMOU', N'Hương thơm cay nồng, quyến rũ mang lại nét đẹp mạnh mẽ và đây kích thích cho các chàng trai gợi cảm với mùi hương thuộc nhóm hương cay nồng phương Đông. Mẫu chai thiết kế đẹp và sang trọng. Sử dụng được bất kỳ thời tiết nào. Độ lưu hương rất lâu.', 4650000, 19, N'products/amouage-lyric.jpg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP012', N'Amouage Memoir Man', N'L001', N'AMOU', N'Memoir Man dành cho phái mạnh được tung ra thị trường vào tháng 9/2010 , nó thuộc nhóm hương da thuộc khá nam tính. Người sáng tạo ra dòng nước hoa này là Karine Vinchon, và chuyên gia chế tạo nước hoa này đã xây dựng mùi hương này xoay quanh nốt hương rượu absinthe. Đây là phiên bản đi cùng với Memoir Woman.', 4990000, 45, N'products/AMOUAGE-MEMOIR-MAN.jpg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP013', N'Acqua Di Gio Profumo', N'L001', N'GGAMA', N'Acqua Di Gio Profumo for men thuộc nhóm hương thơm biển, thích hợp dùng trong những ngày đêm xuân, hạ.', 3300000, 31, N'products/gio-den.jpg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP014', N'Acqua di Gio Profondo', N'L001', N'GGAMA', N'Thêm một “quý tử” của Alberto Morrilas được chào đời vào năm 2020, giữa những tâm bão của thế giới. Gio Profondo thừa hưởng những nền tảng cổ điển của người đàn anh Acqua di Giò.', 2350000, 25, N'products/gio-profondo-2020.jpg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP015', N'Gucci Pour Homme EDT', N'L001', N'GC', N'Nước Hoa Gucci Pour Homme EDT 90ml là top những nước hoa nam trẻ trung hiện đại, được nhập khẩu từ thương hiệu Gucci nổi tiếng Pháp. Gucci Pour Homme sở hữu mùi hương mang lại cảm giác tự tin, nam tính và chỉnh chu cho người sử dụng.', 2250000, 45, N'products/gucci-pour-homme-edt.jpg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP016', N'Gucci Bamboo For Women', N'L002', N'GC', N'Là sự pha trộn giữa những hương thơm tinh tế của vùng đất nhiệt đới, nước hoa Gucci Bamboo For Women mang đến cho bạn một cảm giác cực kỳ ngọt ngào và nữ tính khi xịt lên da. Gucci Bamboo EDP sở hữu hàm lượng tinh dầu lớn với hương thơm nồng nàn và bền mùi theo thời gian. Loại nước hoa này khá phù hợp để sử dụng ban ngày, trong điều kiện thời tiết xuân hè mát mẻ.', 3230000, 27, N'products/gucci-bamboo-for-women.png')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP017', N'Gucci Guilty Pour Homme EDT', N'L001', N'GC', N'Nước Hoa Gucci Pour Homme EDT 90ml là top những nước hoa nam trẻ trung hiện đại, được nhập khẩu từ thương hiệu Gucci nổi tiếng Pháp. Gucci Pour Homme sở hữu mùi hương mang lại cảm giác tự tin, nam tính và chỉnh chu cho người sử dụng.', 3400000, 31, N'products/gucci-guilty.jpg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP018', N'Armaf Club De Nuit Intense', N'L001', N'ARM', N'Nước hoa Armaf Club De Nuit Intense For Man 105ml là chai nước hoa dành cho nam huyền bí đầy mạnh mẽ cá tính từ hãng Armaf Ả Rập. Armaf Club De Nuit Intense biến một chàng trai trở nên cuốn hút bằng sự tươi mới, trẻ trung và gần gũi kể cả ngay lần gặp đầu tiên bằng hương vị trái cây thuần khiết, dân giã.', 1800000, 50, N'products/armaf-club-de-nuit-intense.jpg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP019', N'Armaf Club De Nuit EDP', N'L002', N'ARM', N'Nước hoa Armaf Club De Nuit EDP 105ml của nhãn hiệu nước hoa Armaf là một mùi hương nước hoa thuộc nhóm hương trái cây dành cho nữ. Armaf Club De Nuit giữ trong mình hương thơm đáng yêu, tinh tế tác hợp cùng hương trái cây gợi lên một mùa xuân ấm áp, dịu nhẹ và mát mẻ.', 1450000, 24, N'products/club-de-nuit-woman12.jpg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [maLoai], [maTH], [moTa], [donGia], [soLuong], [Anh]) VALUES (N'SP020', N'Amouage Memoir Man', N'L001', N'AMOU', N'', 4990000, 45, N'products/AMOUAGE-MEMOIR-MAN.jpg')
GO
INSERT [dbo].[ThuongHieu] ([maTH], [tenTH], [moTa]) VALUES (N'AMOU', N'AMOUAGE', N'Amouage là thương hiệu nước hoa cao cấp được thành lập bởi Quốc vương xứ Oman năm 1983. Nước hoa hãng Amouage được làm ra từ những thành phần truyền thống vùng Trung Đông như trầm hương, xạ hương, hoa hồng và những hương liệu gia vị khác.')
INSERT [dbo].[ThuongHieu] ([maTH], [tenTH], [moTa]) VALUES (N'ARM', N'ARMAF', N'Armaf là một biểu hiện của sự sang trọng thuần túy, sáng tạo và thời trang một cách cao cấp. Đây là một bộ sưu tập của những mẫu nước hoa đặc trưng và thơm một cách sang trọng dành cho cả nam và nữ. Hãng có một sự lựa chọn mùi hương hiện đại, tiếp thêm sinh lực và cảm hứng cho những người đàn ông phong cách và tinh tế cùng sự lưa chọn hấp dẫn, đam mê lạc thú và không thể cưỡng lại của những mẫu nước hoa thiết kế dành cho phái nữ.')
INSERT [dbo].[ThuongHieu] ([maTH], [tenTH], [moTa]) VALUES (N'CHAN', N'CHANEL', N'Chanel là thương hiệu xa xỉ bậc nhất đến từ Pháp và mang tên của nhà sáng lập Coco Chanel – một nhân vật có tầm ảnh hưởng quan trọng đến thời trang thế kỷ XX.')
INSERT [dbo].[ThuongHieu] ([maTH], [tenTH], [moTa]) VALUES (N'CRHRE', N'CAROLINA HERRERA', N'Hãng Carolina Herrera được thành lập vào năm 1980 bởi Venezuelan – nhà thiết kế người Mỹ. Với phong cách sang trọng, tinh tế thương hiệu Carolina Herrera đã tạo nên sự khác biệt và gặt hái được những thành công to lớn trong thời gian ngắn.')
INSERT [dbo].[ThuongHieu] ([maTH], [tenTH], [moTa]) VALUES (N'GC', N'GUCCI', N'Gucci thương hiệu thời trang, nước hoa, giày túi nổi tiếng Ý. GUCCI là thương hiệu thời trang có triết lý thiết kế hiện đại và đổi mới, với tinh thần quý tộc và kỹ nghệ thủ công bậc thầy mang tính di sản của Ý với nhiều sản phẩm hàng hiệu: Túi xách Gucci, Nước hoa Gucci, Thời trang Gucci, Thắt lưng Gucci, Mũ nón Gucci, Dép Gucci.
Thương hiệu Gucci được coi là một trong những nhãn hiệu thời trang nổi tiếng, danh giá và được thừa nhận bậc nhất toàn cầu.')
INSERT [dbo].[ThuongHieu] ([maTH], [tenTH], [moTa]) VALUES (N'GGAMA', N'GIORGIO ARMANI', N'Thương hiệu Giorgio Armani được xem là biểu tượng tinh tế của bản sắc thời trang Ý, đặc trưng bởi phong cách trang nhã hiện đại, tính ứng dụng cao và chú trọng giá trị nội tại. Armani xứng đáng nhiều lần hơn với 2 từ “tinh tế”, cũng như không có khái niệm “lộng lẫy” trong bản sắc thương hiệu.')
INSERT [dbo].[ThuongHieu] ([maTH], [tenTH], [moTa]) VALUES (N'VERS', N'VERSACE', N'Gianni Versace S.p.A là hãng thời trang nổi tiếng của Ý, thường được biết đến dưới cái tên ngắn gọn hơn là Versace, được thành lập bởi Gianni Versace vào năm 1978.')
GO
ALTER TABLE [dbo].[LoaiSP] ADD  CONSTRAINT [IDLOAI]  DEFAULT ([dbo].[AUTO_MALOAI]()) FOR [maLoai]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [IDSP]  DEFAULT ([dbo].[AUTO_MASP]()) FOR [maSP]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [fk_maLoai] FOREIGN KEY([maLoai])
REFERENCES [dbo].[LoaiSP] ([maLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [fk_maLoai]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [fk_maTH] FOREIGN KEY([maTH])
REFERENCES [dbo].[ThuongHieu] ([maTH])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [fk_maTH]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([soLuong]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [PERFUMESHOP] SET  READ_WRITE 
GO
