-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 21, 2021 lúc 09:53 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `csdl_tiendatpc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `Tongtien` float NOT NULL,
  `Ngay` date NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`id`, `Tongtien`, `Ngay`, `username`) VALUES
(19, 4090000, '2021-03-04', 'My'),
(20, 5400000, '2021-03-31', 'My'),
(21, 2190000, '2021-03-10', 'Vy'),
(22, 2380000, '2021-03-21', 'trantrang'),
(23, 370000, '2021-03-21', 'Thuthao'),
(24, 8500000, '2021-03-27', 'ngdhg'),
(25, 370000, '2021-03-27', 'My');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `quantity`, `bill_id`, `username`) VALUES
(32, 11, 1, 0, 'My'),
(35, 19, 2, 0, 'My');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `size` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `image` mediumtext NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `size`, `weight`, `color`, `description`, `image`, `category`) VALUES
(1, 'Ghế ngồi Bunny nhựa đúc E28', 7900000, '50cm x 42cm x 44/80cm', '', 'Xám', 'Ghế Bunny chair nhựa đúc\n\n• Chiếc Ghế ăn nhựa đúc Bunny mang phong cách Scandinavian được cấu tạo từ chất liệu nhựa đúc nguyên chiếc, mang lại cảm giác thoải mái và mát mẻ khi sử dụng.\n\n• Chiếc Ghế cafe nhựa đúc Bunny này không chỉ dùng làm ghế ăn cho gia đình, mà còn làm ghế ngồi cho các quán cafe cao cấp và ghế học cho các bạn nhỏ..\n', '  https://product.hstatic.net/1000341603/product/ghe-cafe-nhua-duc-bunny-ghi_5fb3f98085044a1abba16273ff728558_master.jpg', 1),
(2, 'Ghế ngồi cafa đẹp E22 - Ghế HAL WOOD', 8500000, 'Cao 79cm, cao mặt ngồi 43cm, rộng 47cm, sâu 49cm', '10kg', 'Đen', 'Ghế cafe đẹp E22 - Ghế HAL WOOD\n\n• Ghế HAL WOOD được thiết kế rất đơn giản với chân gỗ sồi, thân nhựa đúc liền khối nhưng lại vô cùng trẻ trung, sinh động với nhiều màu sắc tươi sáng, bắt mắt. Ghế có thể sử dụng với nhiều không gian: Ghế cafe, ghế ăn, ghế ngoài trời, ghế làm việc, ghế đọc sách, ghế trang điểm, ghế trà sữa, ...', '  https://product.hstatic.net/1000341603/product/ghe_hal_nhua_duc_den_f1cadc2c7cf541fab80a0b1198b017e4_master.jpg', 0),
(3, 'Ghế ngồi cafe NELSON bọc da chân sắt', 1350000, 'H84cm x W52cm x D45cm (mặt ngồi cao 44cm)', '6kg', 'Xám', 'Ghế ăn cafe NELSON bọc da chân sắt\n\n• Ghế NELSON bọc da chân sắt được cấu tạo từ chân sắt sơn tĩnh điện chắc chắc, phần thân ghế được bọc da mang phong cách hiện đại. Phần lưng tựa được thiết kế với độ sâu phù hợp, phần nệm ghế NELSON sử dụng mút bọc da nhân tạo mang lại cảm giác ngồi êm ái. Sự kết hợp mặt nệm và lưng tựa tạo lên sự thoải mái tuyệt vời khi sử dụng.\n\n• Sử dụng làm ghế ăn, ghế cafe, ghế trang điểm, ghế văn phòng, trà sữa, nhà hàng…', ' https://product.hstatic.net/1000341603/product/ghe-an-cafe-nelson-boc-da-chan-sat-nhap-khau-1_e6cd36123c51462db759a52f193cdfdf_master.jpg', 0),
(4, 'Ghế ngồi đẹp G6 - Ghế gỗ tự nhiên nệm ngồi (KENNEDY)', 2050000, ' 53x64 x 45/76cm', '7kg', 'Nâu', 'Ghế cafe đẹp G6 - Ghế gỗ tự nhiên nệm ngồi\n\n• Ghế Kennedy - The Chair - The Round Chair là kiệt tác của kiến trúc sư bậc thầy Hans J.Wegner. Nó đã được bình chọn là một trong những chiếc ghế đẹp nhất thế giới.\n\n• Ghế Kennedy thể hiện sự sang trọng, uy quyền, không chỉ được sử dụng nhiều trong không gian phòng họp, hay phòng đọc sách mà The chair còn được yêu thích trong những quán cafe, nhà hàng sang trọng .\n\n> Mặt ngồi cốt gỗ, bọc da nhân tạo\n\n> Chân gỗ tự nhiên sơn PU\n\n> Xuất xứ: Việ', ' https://product.hstatic.net/1000341603/product/ghe_cafe_kennedy_go_soi_cao_cap_9aa02ff482fc422ab8c831f275b5381d_master.jpg', 0),
(5, 'G26 - Ghế ngồi REQUIN nan lưng', 950000, '46 x 49 x 45/81cm', '5kg', 'Đen', 'G26 - Ghế REQUIN nan lưng\n\n• Ghế Requin có thiết kế khá cá tính, ấn tượng nhưng cũng rất hiện đại và tinh tế. Điểm ấn tượng nhất của chiếc ghế đó là phần tựa lưng, với những thanh gỗ nhỏ được bo tròn kết hợp với nhau tạo nên một vòng cung ôm lấy lưng người ngồi không những tạo sự thoải mái mà còn hỗ trợ tư thế cực kỳ tốt, hạn chế các vấn đề về đau lưng hay cột sống dù cho bạn có ngồi trong thời gian lâu.\n\n• Sử dụng làm ghế ăn, ghế café, ghế trang điểm, ghế văn phòng, ', ' https://product.hstatic.net/1000341603/product/ghe_an_ghe_cafe_requin_lung_nan_den_e1376741f2734c26a99dda071bd5c2f2_master.jpg', 0),
(6, 'Ghế ngồi cafe LARA đệm nỉ nhung chân mạ vàng', 1580000, 'H83cm x W58cm x D55cm', '6kg', 'Xanh, Hồng, Đen', 'Ghế ăn ghế cafe LARA đệm nỉ nhung chân mạ vàng\n\n• Ghế LARA đệm nỉ nhung được cấu tạo từ chân mạ inox vàng chắc chắc, phần thân ghế được bọc nỉ nhung mang phong cách hiện đại. Phần lưng tựa được thiết kế với độ sâu phù hợp, phần nệm ghế LARA sử dụng mút bọc nỉ nhung mang lại cảm giác ngồi êm ái. Sự kết hợp mặt nệm và lưng tựa tạo lên sự thoải mái tuyệt vời khi sử dụng.\n\n• Sử dụng làm ghế ăn, ghế cafe, ghế trang điểm, ghế Spa, ghế văn phòng, trà sữa, nhà hàng…', ' https://product.hstatic.net/1000341603/product/ghe-an-ghe-cafe-lara-dem-ni-nhung-chan-ma-vang-4_499d226f425c4cc4af2671b57ed234de_master.jpg', 0),
(7, 'Ghế ngồi Gubi nệm bọc nỉ nhung (E26)', 1190000, '46 x 56 x 45/81cm', '5kg', 'Hồng', 'Ghế ăn - Ghế cafe Gubi nệm bọc nỉ nhung\n\n• Được thiết kế bởi GamFratesi cho thương hiệu Gubi của Đan Mạch, sự kết hợp tuyệt đẹp giữa thiết kế Ý và Đan Mạch .\n\n• Với thiết kế hấp dẫn, tiện nghi vượt trội và khả năng tùy biến độc đáo, chiếc ghế có thể được nhìn thấy ở nhiều nhà hàng nổi tiếng nhất trên thế giới . Lấy ý tưởng từ thế giới côn trùng, cụ thể hơn là thế giới của bọ cánh cứng .\n\n• Cả ghế ngồi và tựa lưng đều được hoàn thiện cực kỳ chi tiết , tỉ mỉ . Lựa chọn giữa thép đen, hoặc mạ', ' https://product.hstatic.net/1000341603/product/ghe_an_ghe_cafe_gubi_nem_nhung_chan_sat_hong_c82a4c53a2af4af5b9043ef3a3bb12c0_master.jpg', 0),
(8, 'Ghế ngồi nhựa đúc lỗ HOL SANKYO E18', 650000, '', '', 'Đen, Trắng, Ghi, Vàng, Đỏ', 'Ghế nhựa đúc lỗ HOL SANKYO\n\n• Ghế HOL SANKYO là 1 trong những loại ghế đẹp có thiết kế nhựa đúc nguyên khối rất hiện đại, tiện lợi khi sử dụng. Ghế nhựa đúc lỗ thích hợp tại nhiều không gian khác nhau, từ nội thất gia đình đến nội thất quán cafe, nhà hàng, Bên cạnh đó, với kết cấu ghế đơn giản cùng phần mặt ghế hơi cong, tạo cảm giác thật sự thoải mái khi ngồi.Với chất liệu nhựa pp chắc chắn đủ để khách hàng tin tưởng tuyệt đối vào sản phẩm.\n\n• Ghế nhựa đúc lỗ HOL với thiết kế đơn giản có lỗ', ' data:image/jpeg;base64,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', 0),
(9, 'BE7 - Bàn ăn chữ nhật Eames 1m2', 1750000, '120 x 80 x 75cm', '10kg', 'Trắng', 'Bàn chữ nhật Eames\n\n• Bàn ăn chữ nhật Eames 1m2 được tạo nên từ chất liệu gỗ cao cấp cùng với chân gỗ sồi chống thấm và khung thép không gỉ. Sản phẩm có khả năng chịu lực cao và tính hữu dụng trong mọi hoàn cảnh. Sẽ tuyệt vời hơn khi kết hợp dòng bàn chữ nhật Eames với các dòng ghế Eames khác dùng để làm bàn ăn, bàn cafe, bàn làm việc, các không gian sang trọng và thư giãn khác.\n\n• Dùng làm bàn café, bàn ăn, làm làm việc, bàn decor,…\n\n> Mặt bàn MDF phủ sơn bệt trắng - đen\n\n> Chân gỗ sồi', ' https://product.hstatic.net/1000341603/product/ban_an_ban_chu_nhat_eames_1m2_trang_0f37e565be614e7884aef7470c642a26.jpg', 0),
(10, 'BA10 - Bàn ăn Eliot mặt đá chân thép', 7450000, 'D140/160/180/200/220 x R 80/90/100 x C 75cm', '90/120/140...kg', 'Đen', 'Bàn ăn Eliot\r\n\r\n• Chiếc bàn ăn Eliot cấu tạo từ mặt đá và chân sắt với thiết kế thanh lịch, độc đáo và mang đậm hơi thở hiện đại Ý sẽ khiến cho bất kì không gian phòng ăn sở hữu chiếc bàn Eliot sẽ bừng lên vẻ sang trọng. Đặc biệt, những bộ bàn to dành cho nhiều người xuất hiện trong căn bếp nhà bạn sẽ càng làm tăng sự quyền lực cho gia chủ.\r\n\r\n• Dùng làm bàn cafe, bàn ăn, bàn phòng bếp, làm làm việc, bàn decor,…\r\n\r\n> Chân thép sơn tĩnh điện\r\n\r\n> Mặt đá nhân tạo cao cấp\r\n\r\n> Xuất xứ: Việt Nam\r\n\r\n', 'https://product.hstatic.net/1000341603/product/ban-eliot-chan-thep-mat-da-5_cf8fefae7f164bcc89de183097d9e92b_master.jpg', 0),
(11, 'BA5 - Bàn ăn gỗ CABIN', 1190000, 'D 120/140/160 x R 70 x C 75cm', '10kg', 'Vàng', 'Bàn ăn gỗ Cabin\r\n\r\n• Bàn ăn gỗ Cabin được tạo nên từ chất liệu gỗ cao su chống thấm. Sản phẩm có khả năng chịu lực cao và tính hữu dụng trong mọi hoàn cảnh. Sẽ tuyệt vời hơn khi kết hợp dòng bàn ăn Cabin với các dòng ghế Eames khác dùng để làm bàn ăn, bàn cafe, bàn làm việc, các không gian sang trọng và thư giãn khác.\r\n\r\n• Dùng làm bàn café, bàn ăn, làm làm việc, bàn decor,…\r\n\r\n> Mặt bàn MDF phủ veneer\r\n\r\n> Chân gỗ cao su\r\n\r\n> Kết cấu tháo lắp, dễ dàng lắp đặt, vận chuyển\r\n\r\n> Xuất xứ: Việt Na', 'https://product.hstatic.net/1000341603/product/ban_an_go_cabin_ec17e8305e3645aca4bee26226ee98b6_master.jpg', 0),
(12, 'BAG6 - Bàn ăn gỗ KUDO OBAMA', 1490000, 'D 120/140/160 x R 70 x C 75cm', '10kg', 'Đen', 'Bàn ăn gỗ Kudo\r\n\r\n• Bàn ăn gỗ Kudo được tạo nên từ chất liệu gỗ cao su chống thấm. Sản phẩm có khả năng chịu lực cao và tính hữu dụng trong mọi hoàn cảnh. Sẽ tuyệt vời hơn khi kết hợp dòng bàn ăn Obama với các dòng ghế Eames khác dùng để làm bàn ăn, bàn cafe, bàn làm việc, các không gian sang trọng và thư giãn khác.\r\n\r\n• Dùng làm bàn café, bàn ăn, làm làm việc, bàn decor,…\r\n\r\n> Mặt bàn MDF phủ veneer\r\n\r\n> Chân gỗ cao su\r\n\r\n> Kết cấu tháo lắp, dễ dàng lắp đặt, vận chuyển\r\n\r\n> Xuất xứ: Việt Nam', 'https://product.hstatic.net/1000341603/product/ban_an_go_kudo_obama_bb90cd14452c44deb4c44ce038103e05_master.jpg', 0),
(13, 'BA3 - Bàn ăn gỗ LUNAR', 1490000, 'D120/140/160 x R 70 x C 75cm', '10kg', 'Vàng', 'Bàn ăn gỗ Lunar\r\n\r\n• Bàn ăn gỗ Lunar được tạo nên từ chất liệu gỗ cao su chống thấm. Sản phẩm có khả năng chịu lực cao và tính hữu dụng trong mọi hoàn cảnh. Sẽ tuyệt vời hơn khi kết hợp dòng bàn ăn Lunar với các dòng ghế Eames khác dùng để làm bàn ăn, bàn cafe, bàn làm việc, các không gian sang trọng và thư giãn khác.\r\n\r\n• Dùng làm bàn café, bàn ăn, làm làm việc, bàn decor,…\r\n\r\n> Mặt bàn MDF phủ veneer\r\n\r\n> Chân gỗ cao su\r\n\r\n> Kết cấu tháo lắp, dễ dàng lắp đặt, vận chuyển\r\n\r\n> Xuất xứ: Việt Na', 'https://product.hstatic.net/1000341603/product/ban_an_go_chu_nhat_lunar_38e2a42b620c4ac8b01d0fdedd711534_master.jpg', 0),
(14, 'BA9 - Bàn ăn SKORPIO mặt đá chân thép W', 10700000, ' D 160/180/200/220/240/260... x R 80/90/100/110 x C 75cm', '10kg', 'Đen', 'Bàn ăn SKORPIO\r\n\r\n• Chiếc bàn SKORPIO chân thép với thiết kế thanh lịch, độc đáo và mang đậm hơi thở hiện đại Ý sẽ khiến cho bất kì không gian phòng ăn sở hữu chiếc bàn SKORPIO sẽ bừng lên vẻ sang trọng. Đặc biệt, những bộ bàn to dành cho nhiều người xuất hiện trong căn bếp nhà bạn sẽ càng làm tăng sự quyền lực cho gia chủ.\r\n\r\n• Dùng làm bàn cafe, bàn ăn, bàn phòng bếp, làm làm việc, bàn decor,…\r\n\r\n> Chân sắt sơn tĩnh điện\r\n\r\n> Mặt đá nhân tạo cao cấp\r\n\r\n> Xuất xứ: Việt Nam\r\n\r\n> Bảo hành: 12 thá', 'https://product.hstatic.net/1000341603/product/ban-an-skorpio-mat-da-den-chan-thep-1_70c93027c7f648e4b383fdfa95aa4b86_master.jpg', 0),
(15, 'BVN4 - Bàn ăn chữ K', 690, 'D 120 x R 60 x C 75cm', '10kg', 'Trắng đục', 'Bàn chữ K\n\n• Bàn chữ K có thiết kế đơn giản nhưng vô cùng tiện lợi và bền bỉ.\n\n• Dùng làm bàn làm việc, bàn game, bàn gaming, bàn designer, bàn café, bàn ăn, làm làm việc, bàn decor,…\n\n> Mặt bàn MDF phủ Melamine\n\n> Chân thép sơn tĩnh điện\n\n> Kết cấu tháo lắp, dễ dàng lắp đặt, vận chuyển\n\n> Xuất xứ: Việt Nam\n\n> Bảo hành: 12 tháng', ' https://product.hstatic.net/1000341603/product/ban_lam_viec_game_van_phong_chu_k_624162259924476ba639287e6ddb73af.jpg', 0),
(16, 'BVN1 - Bàn ăn tròn chân sắt đế tròn', 850, 'D60/70/80cm / H75cm', '10kg', 'Trắng ', 'Bàn tròn chân sắt đế tròn\n\n• Bàn cafe đế tròn được tạo nên từ chất liệu gỗ cao cấp cùng với chân gỗ sồi chống thấm và khung thép không gỉ. Sản phẩm có khả năng chịu lực cao và tính hữu dụng trong mọi hoàn cảnh. Sẽ tuyệt vời hơn khi kết hợp dòng bàn tròn chân trụ với các dòng ghế Eames khác dùng để làm bàn ăn, bàn cafe, bàn làm việc, các không gian sang trọng và thư giãn khác.\n\n• Dùng làm bàn café, bàn ăn, làm làm việc, bàn decor,…\n\n> Mặt bàn MDF phủ sơn bệt trắng - đen\n\n> Chân thép sơn ', ' https://product.hstatic.net/1000341603/product/ban_tron_cafe_chan_sat_tru_tron_trang_d8506a586018437a972e82be9147e670_master.jpg', 0),
(17, 'SD10 - Ghế Sofa đơn gỗ tự nhiên cao cấp (hàng xuất khẩu)', 2900000, '55x50x75 (H)', '', 'Vàng', '', ' https://product.hstatic.net/1000341603/product/sofa_don_go_nem_cao_cap_xuat_khau_b1e353f1f9714ee1abd950ef79445b96_master.jpg', 0),
(18, 'Ghế Sofa ALGARD (văng nỉ)', 7200000, 'W1800xD860xH770xSH430', '', 'Xanh, Ghi, Đen', 'SOFA ALGARD (văng nỉ)\n\n• Ghế Sofa văng Algard​​ được ví von là điệp khúc của những đường cong tinh tế, mang lại cảm giác thoải mái nhất cho người sử dụng khi ngồi lên, Sofa Algard được bọc vải nỉ cao cấp dày chắc. Chất liệu vải mềm cùng nệm ngồi có độ cứng và đàn hồi vừa phải, mang đến cảm giác êm ái, thoải mái khi ngồi. Phần khung được làm bằng gỗ cứng chắc, bền đẹp. Chất liệu gỗ đã trải qua quá trình xử lý chống ẩm mốc, mối mọt, không bị biến dạng, cong vênh trong quá trình sử dụng.\n\n• Thi', ' https://product.hstatic.net/1000341603/product/sofa_2_master.jpg', 0),
(19, 'S3 - Ghế Sofa Dedar KBH - Sofa xuất khẩu', 11000000, 'dài 2m, rộng 0.8m', '10kg', 'Xám', 'Sofa Dedar KBH\n\n• Chiếc Sofa Dedar KBH mang phong cách Scandinavian được xây dựng từ khung gỗ sồi uốn cong mềm mại, sơn màu nâu giả gỗ óc chó sang trọng, sử dụng nệm mút cao cấp và bọc da nhân tạo hoặc nỉ nhung tùy chọn.\n\n• Chiếc Sofa Dedar KBH này được dùng làm ghế Sofa phòng khách cho gia đình, dùng làm ghế cho các quán cafe cao cấp và dùng làm ghế tiếp khách cho các không gian sang trọng như Spa, văn phòng, trung tâm hội nghị...', ' https://product.hstatic.net/1000341603/product/sofa_dedar_kbh_nan_lung_con_tien_go_0414a88e90504322865fa5dbad1715c2_master.jpg', 0),
(20, 'Ghế Sofa ĐƠN NAN GỖ DEDAR KBH - SD3', 6500000, 'Sâu 80cm x rộng 80cm x cao 41/73cm', '', 'Nâu ghi', 'SOFA ĐƠN NAN GỖ\n\n• Chiếc Sofa nan gỗ DEDAR RUSTIC mang phong cách Scandinavian được xây dựng từ khung gỗ sồi uốn cong mềm mại, sơn nổi vân gỗ sang trọng, sử dụng nệm mút cao cấp, bọc da nhân tạo hoặc nỉ nhung tùy chọn kết hợp tay mây pha trộn vẻ đẹp đông dương.\n\n• Chiếc Sofa đơn nan gỗ KBH này được dùng làm ghế Sofa phòng khách cho gia đình, ghế đọc sách,ghế cho các quán cafe cao cấp và dùng làm ghế tiếp khách cho các không gian sang trọng như Spa, văn phòng, trung tâm hội nghị...', ' https://product.hstatic.net/1000341603/product/sofa_nan_go_dedar_don_87fc06558f984502a0e7d990167a7614_master.jpg', 0),
(21, 'SD2 - Ghế Sofa đơn nan gỗ Fly', 6500000, 'dài 0.9m, rộng 0.8m', '', 'Nâu', 'Sofa FLY RUSTIC\n\n• Chiếc Sofa FLY RUSTIC mang phong cách Scandinavian được xây dựng từ khung gỗ sồi uốn cong mềm mại, sơn nổi vân gỗ sang trọng, sử dụng nệm mút cao cấp, bọc da nhân tạo hoặc nỉ nhung tùy chọn kết hợp tay mây pha trộn vẻ đẹp đông dương.\n\n• Chiếc Sofa nan gỗ FLY này được dùng làm ghế Sofa phòng khách cho gia đình, dùng làm ghế cho các quán cafe cao cấp và dùng làm ghế tiếp khách cho các không gian sang trọng như Spa, văn phòng, trung tâm hội nghị...\n\n', ' https://product.hstatic.net/1000341603/product/sofa_fly_don_1_31b547718fed496fb16414a47c411a17_master.jpg', 0),
(22, 'Yoshino armchair - Ghế Sofa gỗ đơn SD11', 2900000, 'Sâu 70cm x rộng 65cm x cao 43/75cm', '', 'Đen', 'Yoshino armchair - Sofa gỗ đơn\n\n• Chiếc Sofa gỗ Yoshino armchair mang phong cách Scandinavian được xây dựng từ khung gỗ sồi uốn cong mềm mại, sơn nổi vân gỗ sang trọng, sử dụng nệm mút cao cấp, bọc da nhân tạo hoặc nỉ nhung đậm chất hiện đại.\n\n• Chiếc Sofa gỗ Yoshino armchair này được dùng làm ghế Sofa phòng khách cho gia đình, ghế đọc sách, ghế cho các quán cafe cao cấp và dùng làm ghế tiếp khách cho các không gian sang trọng như Spa, văn phòng, trung tâm hội nghị...\n\n', ' https://product.hstatic.net/1000341603/product/yoshino-sofa-don-armchair_8d40435ce151421288e1ef25eac3b1a7_master.jpg', 0),
(23, 'S4 - Ghế Sofa RUSTIC nan gỗ tay mây INDOCHINE', 14500000, 'dài 2m, rộng 0.8m', '', 'Nâu', 'Sofa RUSTIC nan gỗ tay mây INDOCHINE\n\n• Chiếc Sofa tay mây RUSTIC mang phong cách Scandinavian được xây dựng từ khung gỗ sồi uốn cong mềm mại, sơn màu nâu giả gỗ óc chó sang trọng, sử dụng nệm mút cao cấp, bọc da nhân tạo hoặc nỉ nhung tùy chọn kết hợp tay mây pha trộn vẻ đẹp đông dương.\n\n• Chiếc Sofa nan gỗ INDOCHINE này được dùng làm ghế Sofa phòng khách cho gia đình, dùng làm ghế cho các quán cafe cao cấp và dùng làm ghế tiếp khách cho các không gian sang trọng như Spa, văn phòng, trung t', ' https://product.hstatic.net/1000341603/product/sofa_go_nan_tay_may_rustic_indochine_1_8910cf3b776c449880a12528f394dcda_master.jpg', 0),
(24, 'S2 -Ghế Sofa RUSTIC nan gỗ FLY', 11000000, 'dài 2m, rộng 0.8m', '', 'Nâu hạt dẻ', 'S2 - Sofa RUSTIC nan gỗ FLY\n\n• Chiếc Sofa FLY RUSTIC mang phong cách Scandinavian được xây dựng từ khung gỗ sồi uốn cong mềm mại, sơn nổi vân gỗ sang trọng, sử dụng nệm mút cao cấp, bọc da nhân tạo hoặc nỉ nhung tùy chọn kết hợp tay mây pha trộn vẻ đẹp đông dương.\n\n• Chiếc Sofa nan gỗ FLY này được dùng làm ghế Sofa phòng khách cho gia đình, dùng làm ghế cho các quán cafe cao cấp và dùng làm ghế tiếp khách cho các không gian sang trọng như Spa, văn phòng, trung tâm hội nghị...', ' https://product.hstatic.net/1000341603/product/sofa_fly_vang_dai_1_70507cca1b214937bd187fb1b7f9c6c6_master.jpg', 0),
(25, 'OVO table - Bàn trà táp tròn sofa đá tự nhiên cao cấp', 5400000, '', '', 'Nâu', 'OVO table - Bàn táp tròn sofa đá tự nhiên cao cấp\n\n• OVO table được sản xuất thủ công bởi 95S DECOR dựa theo thông số kĩ thuật và tiêu chuẩn chất lượng ban đầu của nước Ý, chiếc bàn táp tròn OVO đem lại phong cách chuẩn châu Âu, với ngôn ngữ thiết kế đơn giản nhưng toát lên vẻ điệu đà và tinh tế.\n\n• Bàn tab tròn sofa OVO được cấu tạo từ chân đế và mặt bàn bằng đá tự nhiên cao cấp, trục chịu lực của bàn thay đổi đa dạng chất liệu tạo nên nhiều phiên bản bàn để khách hàng lựa chọn: trục sắt sơ', ' https://product.hstatic.net/1000341603/product/ovo-table-ban-tap-tron-sofa-da-tu-nhien-cao-cap_ff2ed25afc904cb8840b32eecb113c02_master.jpg', 0),
(26, 'BT8 - Bàn trà chanh sắt GLADOM', 370000, 'D420/H520', '3kg', 'Đen', 'Bàn trà chanh sắt GLADOM\r\n\r\n• Khung thép sơn tĩnh điện\r\n\r\n• Xuất xứ: nhập khẩu\r\n\r\n• Bảo hành: 12 tháng', 'https://product.hstatic.net/1000341603/product/ban_tra_chanh_sat_gladom_den_05d151a5c7d442708acd85689dc000bc_master.jpg', 0),
(27, 'BT4 - Bàn trà đôi mặt đá tròn', 2190000, 'D700/H450 - D500/H400', '35kg', 'Đen ', 'Bàn trà đôi mặt đá tròn\r\n\r\n• Khung thép sơn tĩnh điện (màu đen, trắng), sơn nhũ (màu vàng)\r\n\r\n• Sản phẩm làm từ chất liệu chân sắt tĩnh điện khả năng chịu lực cao, sơn nhũ vàng sáng bóng sang trọng\r\n\r\n• Mặt bàn đá marble nổi vân đẹp mắt, chống thấm nước, dễ dàng lau chùi, không bám bụi, không trầy xước\r\n\r\n• Mặt đá nhân tạp (đen, trắng)\r\n\r\n• Xuất xứ: Việt Nam\r\n\r\n• Bảo hành: 12 tháng', 'https://product.hstatic.net/1000341603/product/ban_tra_doi_mat_da_den_khung_trang_973e498dea1649beadaddd0443b406ff_master.jpg', 0),
(28, 'Bàn trà gỗ tròn xoay TURNING TABLE', 4200000, 'D70cm - H40cm', '', 'Nâu', 'Bàn trà gỗ tròn xoay TURNING TABLE\r\n\r\n• TURNING TABLE được sản xuất thủ công bởi 95S DECOR dựa theo thông số kĩ thuật ban đầu của nhà thiết kế người Đức Theresa Rand, chiếc bàn gỗ tròn xoay TURNING cho phép chúng ta có thêm 1 không gian lưu trữ đồ đạc phía dưới mặt bàn, rất tiện lợi và có tính thẩm mĩ cao mỗi khi chiếc mặt bàn được xoay ra để đưa vào hoặc lấy đồ đạc ra từ không gian lưu trữ phía dưới.\r\n\r\n• Bàn trà gỗ tròn TUNRING TABLE được cấu tạo từ gỗ Plywood dán Venner sồi, chân bàn gỗ tần b', 'https://product.hstatic.net/1000341603/product/ban-tra-tron-xoay-turning-table-6_a9f6845ccec84dc98f052b9e1b867c9d_master.jpg', 0),
(29, 'OVO table - Bàn trà táp sofa đa giác đế đá tự nhiên', 5400000, 'D50 - H48cm', '', 'Đen', 'OVO table - Bàn táp sofa đa giác đế đá tự nhiên\n\n• OVO table được sản xuất thủ công bởi 95S DECOR dựa theo thông số kĩ thuật và tiêu chuẩn chất lượng ban đầu của nước Ý, chiếc bàn táp đa giác OVO đem lại phong cách chuẩn châu Âu, với ngôn ngữ thiết kế đơn giản nhưng toát lên vẻ điệu đà và tinh tế.\n\n• Bàn tab sofa đa giác OVO được cấu tạo từ chân đế và mặt bàn bằng đá tự nhiên cao cấp, trục chịu lực của bàn thay đổi đa dạng chất liệu tạo nên nhiều phiên bản bàn để khách hàng lựa chọn: trục sắ', '  https://product.hstatic.net/1000341603/product/ovo-table-ban-tap-tron-sofa-da-tu-nhien-cao-cap-7_d10351c3fe5841f89f9371067a0724c8.jpg', 0),
(30, 'BT3 - Bàn trà kính Noguchi', 1790000, 'D900 x R700', '10kg', 'Trắng', 'Bàn trà NOGUCHI\r\n\r\nNói đến nghệ thuật thì Bàn trà NOGUCHI đã tạo một bước đột phá khi một tác phẩm tường chừng \"chỉ để trưng bày\" được áp dụng vào cuộc sống bình dị hàng ngày.\r\n\r\nBàn trà NOGUCHI được mang thiết kế độc đáo, bứt ra khỏi khuôn khổ hình dáng của bàn trà thông thường nhưng chiếc bàn NOGUCHI vẫn có thể dễ dàng đặt trong bất kỳ không gian phòng khách nào mà không sợ \"lệch tông\". Đặc biệt, khi kết hợp bộ đôi SOFA ALGARD và bàn NOGUCHI, phòng khách nhà bạn sẽ thăng hoa trong sự sáng tạo ', 'https://product.hstatic.net/1000341603/product/ban_tra_noguchi_nau_walnut_mat_kinh_cuong_luc_0bfcecbd67fe414e86faeca281fd2892.jpg', 0),
(31, 'BT6 - Bàn trà lồng chim', 1390000, 'D720/H450', '10kg', 'Đen', 'Bàn trà lồng chim\r\n\r\n• Khung thép sơn tĩnh điện (màu đen, trắng), sơn nhũ (màu vàng)\r\n\r\n• Mặt kính đen 12mm\r\n\r\n• Bảo hành: 12 tháng\r\n\r\n• Xuất xứ: Việt Nam', 'https://product.hstatic.net/1000341603/product/ban_tra_kinh_tron_long_chim_den_ea25de25e2634f418eed7f67c16d5e37_master.jpg', 0),
(32, 'BT5 - Bàn trà Kim cương', 1390000, 'D720/H450', '10kg', 'Đen', 'Bàn trà Kim cương\r\n\r\n• Khung thép sơn tĩnh điện (màu đen, trắng), sơn nhũ (màu vàng)\r\n\r\n• Mặt kính đen 12mm\r\n\r\n• Xuất xứ: Việt Nam\r\n\r\n• Bảo hành: 12 tháng', 'https://product.hstatic.net/1000341603/product/ban_tra_kim_cuong_decor_mat_kinh_trang_8190c919b6ba429e8fdd784fe17f8f23_master.jpg', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product_category`
--

INSERT INTO `product_category` (`id`, `name`) VALUES
(1, 'GHẾ NGỒI'),
(2, 'BÀN TRÀ'),
(5, 'GHẾ SOFA');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id_ref` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `sdt` varchar(20) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `type` int(1) NOT NULL,
  `last_time` double NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id_ref`, `username`, `password`, `name`, `address`, `sdt`, `mail`, `type`, `last_time`, `token`) VALUES
(0, 'admin', '1', 'ADMIN ', '', 'edre', '', 1, 1624261984.5613, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZF9yZWYiOjAsInVzZXJuYW1lIjoiYWRtaW4iLCJwYXNzd29yZCI6IjEiLCJuYW1lIjoiQURNSU5cdTAwYTAiLCJhZGRyZXNzIjoiIiwic2R0IjoiZWRyZSIsIm1haWwiOiIiLCJ0eXBlIjoxLCJsYXN0X3RpbWUiOjE2MjQyNjE4NDMuOTE0Mzc3fQ.Qo28R_8VM2d8Mm5A0cM9o37Hl7wwEkv9OHBHbIQ6QpA'),
(0, 'dat', '1', 'Tiến Đạt Khách', '', '', '', 1, 1624261984.5613, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZF9yZWYiOjAsInVzZXJuYW1lIjoiZGF0IiwicGFzc3dvcmQiOiIxIiwibmFtZSI6IlRpXHUxZWJmbiBcdTAxMTBcdTFlYTF0IEtoXHUwMGUxY2giLCJhZGRyZXNzIjoiIiwic2R0IjoiIiwibWFpbCI6IiIsInR5cGUiOjAsImxhc3RfdGltZSI6MTYyNDI2MTgzMS4xMTUzNTV9.L0fpkP3FWBrlgZ2JdYIEXDDciYZGL-j81g_H214Wu8M'),
(0, 'hoang', '1', 'Thân Trọng Hoàng', '', '333423', '', 0, 1624261984.5613, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZF9yZWYiOjAsInVzZXJuYW1lIjoiaG9hbmciLCJwYXNzd29yZCI6IjEiLCJuYW1lIjoiVGhcdTAwZTJuIFRyXHUxZWNkbmcgSG9cdTAwZTBuZyIsImFkZHJlc3MiOiIiLCJzZHQiOiIzMzM0MjMiLCJtYWlsIjoiIiwidHlwZSI6MCwibGFzdF90aW1lIjoxNjI0MjYxNzMyLjQ2MjAyfQ.Y6g4n9ie0j2VQZ4Rz5xPwMRe4kFvlEt3Ufev98BN3b4'),
(0, 'My', '1', 'Nguyễn Diễm My', 'Số 23 Cầu Giấy, Hà Nội', '0339547822', 'diemmy1123@gmail.com', 0, 1624261984.5613, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZF9yZWYiOjAsInVzZXJuYW1lIjoiTXkiLCJwYXNzd29yZCI6IjEiLCJuYW1lIjoiTmd1eVx1MWVjNW4gRGlcdTFlYzVtIE15IiwiYWRkcmVzcyI6IlNcdTFlZDEgMjMgQ1x1MWVhN3UgR2lcdTFlYTV5LCBIXHUwMGUwIE5cdTFlZDlpIiwic2R0IjoiMDMzOTU0NzgyMiIsIm1haWwiOiJkaWVtbXkxMTIzQGdtYWlsLmNvbSIsInR5cGUiOjAsImxhc3RfdGltZSI6MTYxNjgyMDE3MC41NzU0MTV9.VfaVw44y98rTwSVsE2IMQzJP3rW08441Lm0i46s60tc'),
(0, 'phamha', '1', 'Phạm Thị Hà', '213 Trần Bình, Hà Nội', '0339904785', 'Phamha7337@gmail.com', 0, 1624261984.5613, ''),
(0, 'Thuthao', '1', 'Nguyễn Thu Thảo', '25 Cầu Giấy, Hà Nội', '0377951742', 'thuthao23@gmail.com', 0, 1624261984.5613, ''),
(0, 'tiendat', '1', 'Nguyễn Tiến Đạt', 'Ngõ 20, Trương Định, Hai Bà Trưng, Hà Nội', '0339457822', 'tiendatpc45@gmail.com', 0, 1624261984.5613, ''),
(0, 'trantrang', '1', 'Trần Thu Trang', '231 Cầu Giấy Hà Nội', '0369523156', 'thutrang1325@gmail.com', 0, 1624261984.5613, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZF9yZWYiOjAsInVzZXJuYW1lIjoidHJhbnRyYW5nIiwicGFzc3dvcmQiOiIxIiwibmFtZSI6IlRyXHUxZWE3biBUaHUgVHJhbmciLCJhZGRyZXNzIjoiMjMxIENcdTFlYTd1IEdpXHUxZWE1eSBIXHUwMGUwIE5cdTFlZDlpIiwic2R0IjoiMDM2OTUyMzE1NiIsIm1haWwiOiJ0aHV0cmFuZzEzMjVAZ21haWwuY29tIiwidHlwZSI6MCwibGFzdF90aW1lIjoxNjE2MzM4ODYyLjM3NTEzMn0.kCVtANu4RttE5pSeAc42W8qkLoBujAHJ0njOVUbTPmA'),
(0, 'Vy', '1', 'Trần Thị Khánh Vy', 'Số 45 ngõ 12 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội', '0339574256', 'vyvy42@gmail.com', 0, 1624261984.5613, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZF9yZWYiOjAsInVzZXJuYW1lIjoiVnkiLCJwYXNzd29yZCI6IjEiLCJuYW1lIjoiVHJcdTFlYTduIFRoXHUxZWNiIEtoXHUwMGUxbmggVnkiLCJhZGRyZXNzIjoiU1x1MWVkMSA0NSBuZ1x1MDBmNSAxMiBIb1x1MDBlMG5nIFF1XHUxZWQxYyBWaVx1MWVjN3QsIEJcdTFlYWZjIFRcdTFlZWIgTGlcdTAwZWFtLCBIXHUwMGUwIE5cdTFlZDlpIiwic2R0IjoiMDMzOTU3NDI1NiIsIm1haWwiOiJ2eXZ5NDJAZ21haWwuY29tIiwidHlwZSI6MCwibGFzdF90aW1lIjoxNjE2MTcwMDE2LjI5MTY0N30.cKK2XAcSPiUrE5Qb7X6RW4A5veCdGhA82C0yU-A3aiQ');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
