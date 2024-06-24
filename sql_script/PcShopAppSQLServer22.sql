USE [PcShop]
GO
/****** Object:  Table [dbo].[brands]    Script Date: 6/24/2024 6:09:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brands](
	[id_brand] [smallint] IDENTITY(1,1) NOT NULL,
	[brand_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_brands] PRIMARY KEY CLUSTERED 
(
	[id_brand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_items]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_items](
	[id_item] [int] IDENTITY(1,1) NOT NULL,
	[id_cart] [int] NOT NULL,
	[id_product] [int] NOT NULL,
	[amount] [tinyint] NOT NULL,
	[item_price] [money] NULL,
 CONSTRAINT [PK_Cart_items] PRIMARY KEY CLUSTERED 
(
	[id_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_status]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_status](
	[id_cart_status] [tinyint] IDENTITY(1,1) NOT NULL,
	[cart_status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cart_status] PRIMARY KEY CLUSTERED 
(
	[id_cart_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carts]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carts](
	[id_cart] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NULL,
	[cart_price] [money] NULL,
	[id_cart_status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[id_cart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cat_brands]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cat_brands](
	[id_cat_brand] [smallint] IDENTITY(1,1) NOT NULL,
	[id_category] [smallint] NOT NULL,
	[id_brand] [smallint] NOT NULL,
 CONSTRAINT [PK_cat_brands] PRIMARY KEY CLUSTERED 
(
	[id_cat_brand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id_category] [smallint] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
	[id_cat_parent] [smallint] NULL,
	[category_description] [nvarchar](max) NULL,
	[popular] [bit] NOT NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[id_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category_images]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_images](
	[id_category_image] [smallint] IDENTITY(1,1) NOT NULL,
	[id_category] [smallint] NOT NULL,
	[src] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_category_images] PRIMARY KEY CLUSTERED 
(
	[id_category_image] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cities](
	[id_city] [smallint] IDENTITY(1,1) NOT NULL,
	[city_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cities] PRIMARY KEY CLUSTERED 
(
	[id_city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compatibilities]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compatibilities](
	[id_compatibility] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[id_compatible_product] [int] NOT NULL,
	[compatible_details] [nvarchar](max) NULL,
 CONSTRAINT [PK_compatibilities] PRIMARY KEY CLUSTERED 
(
	[id_compatibility] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discount_durations]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount_durations](
	[id_discount_duration] [int] IDENTITY(1,1) NOT NULL,
	[id_discount] [tinyint] NOT NULL,
	[discount_date_from] [date] NOT NULL,
	[discount_date_till] [date] NOT NULL,
 CONSTRAINT [PK_discount_durations] PRIMARY KEY CLUSTERED 
(
	[id_discount_duration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discount_prices]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount_prices](
	[id_discount_price] [int] IDENTITY(1,1) NOT NULL,
	[id_price] [int] NOT NULL,
	[id_discount_duration] [int] NOT NULL,
	[discount_value] [tinyint] NOT NULL,
	[discount_price] [money] NULL,
	[saved] [money] NULL,
 CONSTRAINT [PK_discount_prices] PRIMARY KEY CLUSTERED 
(
	[id_discount_price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discounts]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discounts](
	[id_discount] [tinyint] IDENTITY(1,1) NOT NULL,
	[discount_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_discounts] PRIMARY KEY CLUSTERED 
(
	[id_discount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQs]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQs](
	[id_faq] [tinyint] IDENTITY(1,1) NOT NULL,
	[faq_question] [nvarchar](max) NOT NULL,
	[faq_answer] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_FAQs] PRIMARY KEY CLUSTERED 
(
	[id_faq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[featured_products]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[featured_products](
	[id_featured_product] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[featured_date_from] [date] NOT NULL,
	[featured_date_till] [date] NOT NULL,
	[priority] [tinyint] NOT NULL,
 CONSTRAINT [PK_featured_products] PRIMARY KEY CLUSTERED 
(
	[id_featured_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[locations]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locations](
	[id_location] [smallint] IDENTITY(1,1) NOT NULL,
	[id_city] [smallint] NOT NULL,
	[id_street] [smallint] NOT NULL,
	[number] [nvarchar](10) NOT NULL,
	[latitude] [varchar](50) NOT NULL,
	[longitude] [varchar](50) NOT NULL,
 CONSTRAINT [PK_locations] PRIMARY KEY CLUSTERED 
(
	[id_location] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logins]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logins](
	[id_login] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[login_date] [datetime] NOT NULL,
 CONSTRAINT [PK_logins] PRIMARY KEY CLUSTERED 
(
	[id_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[messages]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[messages](
	[id_message] [int] IDENTITY(1,1) NOT NULL,
	[message_title] [nvarchar](100) NOT NULL,
	[message_content] [nvarchar](max) NOT NULL,
	[message_answer] [nvarchar](max) NULL,
	[message_read] [bit] NOT NULL,
	[sender_email] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_messages] PRIMARY KEY CLUSTERED 
(
	[id_message] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[newsletter_subscribers]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newsletter_subscribers](
	[id_subscriber] [int] IDENTITY(1,1) NOT NULL,
	[subscriber_email] [nvarchar](100) NOT NULL,
	[subscriber_status] [bit] NOT NULL,
 CONSTRAINT [PK_newsletter_subscribers] PRIMARY KEY CLUSTERED 
(
	[id_subscriber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_status]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_status](
	[id_order_status] [tinyint] IDENTITY(1,1) NOT NULL,
	[order_status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_order_status] PRIMARY KEY CLUSTERED 
(
	[id_order_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id_order] [int] IDENTITY(1,1) NOT NULL,
	[id_cart] [int] NOT NULL,
	[id_payment_type] [tinyint] NOT NULL,
	[order_date] [datetime] NOT NULL,
	[order_address] [nvarchar](50) NOT NULL,
	[id_city] [smallint] NOT NULL,
	[id_order_status] [tinyint] NOT NULL,
	[recipient_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_types]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_types](
	[id_payment_type] [tinyint] IDENTITY(1,1) NOT NULL,
	[payment_type] [nvarchar](50) NOT NULL,
	[payment_type_description] [nvarchar](max) NOT NULL,
	[payment_type_img_src] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_payment_types] PRIMARY KEY CLUSTERED 
(
	[id_payment_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prices]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prices](
	[id_price] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[product_price] [money] NOT NULL,
	[price_date_from] [date] NOT NULL,
	[price_date_till] [date] NULL,
 CONSTRAINT [PK_prices] PRIMARY KEY CLUSTERED 
(
	[id_price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_images]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_images](
	[id_image] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[src] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_product_images] PRIMARY KEY CLUSTERED 
(
	[id_image] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id_product] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](255) NOT NULL,
	[product_description] [nvarchar](max) NULL,
	[product_obtained_date] [date] NOT NULL,
	[id_cat_brand] [smallint] NOT NULL,
	[avg_rating] [decimal](3, 1) NOT NULL,
	[count_reviews] [smallint] NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products_specifications]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products_specifications](
	[id_product_spec] [int] IDENTITY(1,1) NOT NULL,
	[id_spec] [smallint] NOT NULL,
	[id_product] [int] NOT NULL,
	[product_spec_value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_products_specifiactions] PRIMARY KEY CLUSTERED 
(
	[id_product_spec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products_tags]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products_tags](
	[id_product_tag] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[id_tag] [tinyint] NOT NULL,
	[product_tag_date_from] [date] NOT NULL,
	[product_tag_date_till] [date] NULL,
	[product_tag_active] [bit] NOT NULL,
 CONSTRAINT [PK_products_tags] PRIMARY KEY CLUSTERED 
(
	[id_product_tag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ratings]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ratings](
	[id_rating] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[rating] [decimal](3, 1) NOT NULL,
	[rating_date] [datetime] NOT NULL,
 CONSTRAINT [PK_ratings] PRIMARY KEY CLUSTERED 
(
	[id_rating] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rent_offer_pictures]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rent_offer_pictures](
	[id_picture] [int] IDENTITY(1,1) NOT NULL,
	[id_rent_offer] [int] NOT NULL,
	[src] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_rent_offer_pictures] PRIMARY KEY CLUSTERED 
(
	[id_picture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rent_offers]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rent_offers](
	[id_rent_offer] [int] IDENTITY(1,1) NOT NULL,
	[client_name] [nvarchar](50) NOT NULL,
	[contact_email] [nvarchar](100) NOT NULL,
	[contact_phone] [varchar](20) NOT NULL,
	[offer_address] [nvarchar](50) NOT NULL,
	[square_footage] [tinyint] NOT NULL,
	[financial_offer] [smallint] NOT NULL,
	[offer_details] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_rent_offers] PRIMARY KEY CLUSTERED 
(
	[id_rent_offer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[repair_service]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[repair_service](
	[id_repair_service] [smallint] IDENTITY(1,1) NOT NULL,
	[service_description] [nvarchar](max) NOT NULL,
	[service_price] [money] NOT NULL,
	[service_estimated_time] [tinyint] NOT NULL,
 CONSTRAINT [PK_repair_service] PRIMARY KEY CLUSTERED 
(
	[id_repair_service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[id_review] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[comment] [nvarchar](max) NOT NULL,
	[review_date] [datetime] NOT NULL,
 CONSTRAINT [PK_reviews] PRIMARY KEY CLUSTERED 
(
	[id_review] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id_role] [tinyint] IDENTITY(1,1) NOT NULL,
	[role_title] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[specifications]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[specifications](
	[id_spec] [smallint] IDENTITY(1,1) NOT NULL,
	[spec_name] [nvarchar](50) NOT NULL,
	[spec_measurement_unit] [varchar](20) NULL,
 CONSTRAINT [PK_specifications] PRIMARY KEY CLUSTERED 
(
	[id_spec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stores]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stores](
	[id_store] [smallint] IDENTITY(1,1) NOT NULL,
	[id_location] [smallint] NOT NULL,
	[store_name] [nvarchar](50) NOT NULL,
	[store_contact_phone] [varchar](20) NOT NULL,
	[hourly_rate_working_days] [varchar](10) NOT NULL,
	[hourly_rate_saturday] [varchar](10) NULL,
 CONSTRAINT [PK_stores] PRIMARY KEY CLUSTERED 
(
	[id_store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[streets]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[streets](
	[id_street] [smallint] IDENTITY(1,1) NOT NULL,
	[street_name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_streets] PRIMARY KEY CLUSTERED 
(
	[id_street] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplies]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplies](
	[id_supplies] [int] IDENTITY(1,1) NOT NULL,
	[id_store] [smallint] NOT NULL,
	[id_product] [int] NOT NULL,
	[quantity] [smallint] NOT NULL,
 CONSTRAINT [PK_supplies] PRIMARY KEY CLUSTERED 
(
	[id_supplies] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[survey_questions]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[survey_questions](
	[id_survey_question] [smallint] IDENTITY(1,1) NOT NULL,
	[id_survey] [smallint] NOT NULL,
	[survey_question] [nvarchar](max) NOT NULL,
	[survey_votes] [smallint] NOT NULL,
 CONSTRAINT [PK_survey_questions] PRIMARY KEY CLUSTERED 
(
	[id_survey_question] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[survey_reviews]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[survey_reviews](
	[id_survey_review] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[id_survey_question] [smallint] NOT NULL,
 CONSTRAINT [PK_survey_reviews] PRIMARY KEY CLUSTERED 
(
	[id_survey_review] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[surveys]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[surveys](
	[id_survey] [smallint] IDENTITY(1,1) NOT NULL,
	[survey_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_surveys] PRIMARY KEY CLUSTERED 
(
	[id_survey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tags]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tags](
	[id_tag] [tinyint] IDENTITY(1,1) NOT NULL,
	[tag_name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_tags] PRIMARY KEY CLUSTERED 
(
	[id_tag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[testimonials]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[testimonials](
	[id_testimonial] [smallint] IDENTITY(1,1) NOT NULL,
	[testimonial_date] [date] NOT NULL,
	[company_name] [nvarchar](100) NOT NULL,
	[customer_position] [nvarchar](50) NOT NULL,
	[customer_name] [nvarchar](100) NOT NULL,
	[review] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_testimonials] PRIMARY KEY CLUSTERED 
(
	[id_testimonial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_notifications]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_notifications](
	[id_notification] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NULL,
	[notification_title] [nvarchar](255) NOT NULL,
	[notification_content] [nvarchar](max) NOT NULL,
	[notification_date] [datetime] NOT NULL,
	[notification_read] [bit] NOT NULL,
 CONSTRAINT [PK_user_notifications] PRIMARY KEY CLUSTERED 
(
	[id_notification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[user_phone] [varchar](20) NULL,
	[user_email] [nvarchar](100) NOT NULL,
	[user_password] [nvarchar](500) NOT NULL,
	[register_date] [datetime] NOT NULL,
	[id_role] [tinyint] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[warranties]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warranties](
	[id_warranty] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[warranty_duration] [tinyint] NOT NULL,
	[warranty_terms] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_warranties] PRIMARY KEY CLUSTERED 
(
	[id_warranty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wishlists]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wishlists](
	[id_wishlist] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[wishlist_date] [datetime] NOT NULL,
 CONSTRAINT [PK_wishlists] PRIMARY KEY CLUSTERED 
(
	[id_wishlist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wishlists_products]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wishlists_products](
	[id_wishlist_product] [int] IDENTITY(1,1) NOT NULL,
	[id_wishlist] [int] NOT NULL,
	[id_product] [int] NOT NULL,
 CONSTRAINT [PK_wishlists_products] PRIMARY KEY CLUSTERED 
(
	[id_wishlist_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[brands] ON 
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (24, N'Acer')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (14, N'AeroCool')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (5, N'AMD')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (8, N'Apple')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (22, N'Asus')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (15, N'ATX Torre')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (39, N'Beats')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (1, N'Buypower')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (30, N'Corsair')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (41, N'Cougar')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (2, N'Creative')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (7, N'Dell')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (13, N'EA Sports')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (16, N'Epson')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (6, N'G.Skill')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (33, N'Genius')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (27, N'Gigabyte')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (11, N'HP')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (37, N'HyperX')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (26, N'Intel')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (40, N'JBL')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (12, N'Kaspersky')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (23, N'Lenovo')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (21, N'Lindy')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (32, N'Logitech')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (4, N'Megaport')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (34, N'Microsoft')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (25, N'MSI')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (9, N'Predator')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (18, N'Razer')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (10, N'ROG Swift')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (3, N'Samsung')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (19, N'SanDisk')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (28, N'Sentey')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (38, N'Sony')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (36, N'Spirit of Gamer')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (31, N'Thermaltake')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (17, N'TP-Link')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (35, N'Trust')
GO
INSERT [dbo].[brands] ([id_brand], [brand_name]) VALUES (20, N'WD')
GO
SET IDENTITY_INSERT [dbo].[brands] OFF
GO
SET IDENTITY_INSERT [dbo].[cart_items] ON 
GO
INSERT [dbo].[cart_items] ([id_item], [id_cart], [id_product], [amount], [item_price]) VALUES (73, 16, 13, 7, 1540.0000)
GO
INSERT [dbo].[cart_items] ([id_item], [id_cart], [id_product], [amount], [item_price]) VALUES (76, 16, 15, 4, 5321.8000)
GO
INSERT [dbo].[cart_items] ([id_item], [id_cart], [id_product], [amount], [item_price]) VALUES (83, 22, 3, 2, 46.8000)
GO
INSERT [dbo].[cart_items] ([id_item], [id_cart], [id_product], [amount], [item_price]) VALUES (84, 22, 24, 2, 90.0000)
GO
SET IDENTITY_INSERT [dbo].[cart_items] OFF
GO
SET IDENTITY_INSERT [dbo].[cart_status] ON 
GO
INSERT [dbo].[cart_status] ([id_cart_status], [cart_status]) VALUES (1, N'Empty')
GO
INSERT [dbo].[cart_status] ([id_cart_status], [cart_status]) VALUES (2, N'Processed')
GO
INSERT [dbo].[cart_status] ([id_cart_status], [cart_status]) VALUES (3, N'Unprocessed')
GO
SET IDENTITY_INSERT [dbo].[cart_status] OFF
GO
SET IDENTITY_INSERT [dbo].[carts] ON 
GO
INSERT [dbo].[carts] ([id_cart], [id_user], [cart_price], [id_cart_status]) VALUES (16, 6, 6861.8000, 2)
GO
INSERT [dbo].[carts] ([id_cart], [id_user], [cart_price], [id_cart_status]) VALUES (21, NULL, NULL, 3)
GO
INSERT [dbo].[carts] ([id_cart], [id_user], [cart_price], [id_cart_status]) VALUES (22, NULL, 136.8000, 2)
GO
SET IDENTITY_INSERT [dbo].[carts] OFF
GO
SET IDENTITY_INSERT [dbo].[cat_brands] ON 
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (1, 1, 1)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (2, 2, 2)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (3, 4, 3)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (4, 1, 4)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (5, 7, 5)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (6, 9, 6)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (7, 10, 7)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (8, 10, 8)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (9, 10, 9)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (10, 10, 10)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (11, 10, 11)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (12, 11, 12)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (13, 12, 13)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (14, 17, 14)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (16, 36, 7)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (17, 18, 15)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (18, 23, 11)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (19, 23, 16)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (20, 27, 17)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (21, 28, 18)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (22, 30, 19)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (23, 31, 20)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (24, 31, 3)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (25, 32, 16)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (26, 24, 21)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (27, 4, 11)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (28, 4, 22)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (29, 1, 7)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (30, 4, 7)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (31, 4, 23)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (32, 4, 24)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (33, 13, 25)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (34, 13, 26)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (35, 13, 22)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (36, 13, 27)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (37, 19, 28)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (38, 19, 14)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (39, 19, 30)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (40, 19, 31)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (41, 25, 32)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (42, 25, 33)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (43, 25, 34)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (44, 34, 32)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (45, 34, 33)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (46, 34, 35)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (47, 22, 36)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (48, 22, 37)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (49, 22, 35)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (50, 22, 38)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (51, 22, 39)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (52, 22, 40)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (53, 22, 18)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (54, 22, 41)
GO
INSERT [dbo].[cat_brands] ([id_cat_brand], [id_category], [id_brand]) VALUES (55, 22, 8)
GO
SET IDENTITY_INSERT [dbo].[cat_brands] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (1, N'DesktopPCs', 6, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (2, N'Speakers', 8, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (4, N'Laptops', 35, N'Laptops offer portable computing power, allowing users to work, study,
 create, and play from anywhere. They combine performance and mobility,
 making them an essential tool for professionals, students, and casual
 users alike.', 1)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (5, N'Computer Components', 6, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (6, N'Computers and Components', NULL, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (7, N'Processors', 5, N'Processors, often referred to as the "brain" of a computer, play a
 crucial role in determining overall system performance. They are
 responsible for executing instructions and calculations, influencing
 tasks such as multitasking, gaming, content creation, and running
 demanding software applications.', 1)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (8, N'Computer Equipment', NULL, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (9, N'RAM Memory', 5, N'RAM (Random Access Memory) is a crucial component of a computer system
 that provides temporary storage for data that the processor needs to
 access quickly. One key aspect of RAM is its speed, measured in
 megahertz (MHz) or gigahertz (GHz).', 1)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (10, N'Monitors', 8, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (11, N'Software', 6, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (12, N'PC Games', 6, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (13, N'Motherboards', 5, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (14, N'Graphic Cards', 5, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (15, N'Hard Disks', 5, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (16, N'SSD', 5, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (17, N'Coolers', 5, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (18, N'Computer Case', 5, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (19, N'Power Supply', 5, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (20, N'Mouses', 8, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (21, N'Keyboards', 8, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (22, N'Headphones', 8, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (23, N'Printers', 8, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (24, N'Cables and Adapters', 8, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (25, N'Web Cameras', 8, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (26, N'Network Equipment', 8, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (27, N'Routers', 26, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (28, N'Mouse Pads', 8, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (29, N'Data Storage', 8, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (30, N'Flash Memory', 29, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (31, N'External HDD and SDD', 29, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (32, N'Scanners', 8, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (33, N'Graphic Tables', 8, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (34, N'Microphones', 8, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (35, N'Laptops and Equipments', NULL, NULL, 0)
GO
INSERT [dbo].[categories] ([id_category], [category_name], [id_cat_parent], [category_description], [popular]) VALUES (36, N'Laptop Bags', 35, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[category_images] ON 
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (1, 1, N'Category_DesktopPCs.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (2, 2, N'Category_Speakers.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (3, 4, N'Category_Laptops.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (4, 5, N'Category_Computer_Components.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (5, 6, N'Category_Computers_and_Components.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (6, 7, N'Category_Processors.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (7, 8, N'Category_Computer_Equipment.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (8, 9, N'Category_Ram_Memory.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (9, 10, N'Category_Monitors.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (10, 11, N'Category_Software.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (11, 12, N'Category_PC_Games.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (12, 13, N'Category_Motherboards.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (14, 14, N'Category_Graphic_Cards.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (15, 15, N'Category_Hard_Disks.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (16, 16, N'Category_SSD.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (17, 17, N'Category_Coolers.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (19, 18, N'Category_Computer_Case.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (20, 19, N'Category_Power_Supply.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (21, 20, N'Category_Mouses.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (22, 21, N'Category_Keyboards.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (23, 22, N'Category_Headphones.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (24, 23, N'Category_Printers.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (25, 24, N'Category_Cables_and_Adapters.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (26, 25, N'Category_Web_Cameras.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (27, 26, N'Category_Network_Equipment.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (28, 27, N'Category_Routers.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (29, 28, N'Category_Mouse_Pads.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (31, 29, N'Category_Data_Storage.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (32, 30, N'Category_Flash_Memory.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (33, 31, N'Category_External_HDD_and_SDD.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (34, 32, N'Category_Scanners.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (35, 33, N'Category_Graphic_Tables.jpg')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (36, 34, N'Category_Microphones.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (37, 35, N'Category_Laptops_and_Equipment.png')
GO
INSERT [dbo].[category_images] ([id_category_image], [id_category], [src]) VALUES (38, 36, N'Category_Laptop_Bags.png')
GO
SET IDENTITY_INSERT [dbo].[category_images] OFF
GO
SET IDENTITY_INSERT [dbo].[cities] ON 
GO
INSERT [dbo].[cities] ([id_city], [city_name]) VALUES (1, N'Belgrade')
GO
INSERT [dbo].[cities] ([id_city], [city_name]) VALUES (7, N'Čačak')
GO
INSERT [dbo].[cities] ([id_city], [city_name]) VALUES (4, N'Kragujevac')
GO
INSERT [dbo].[cities] ([id_city], [city_name]) VALUES (8, N'Kraljevo')
GO
INSERT [dbo].[cities] ([id_city], [city_name]) VALUES (3, N'Niš')
GO
INSERT [dbo].[cities] ([id_city], [city_name]) VALUES (2, N'Novi Sad')
GO
INSERT [dbo].[cities] ([id_city], [city_name]) VALUES (9, N'Pančevo')
GO
INSERT [dbo].[cities] ([id_city], [city_name]) VALUES (5, N'Subotica')
GO
INSERT [dbo].[cities] ([id_city], [city_name]) VALUES (10, N'Užice')
GO
INSERT [dbo].[cities] ([id_city], [city_name]) VALUES (6, N'Zrenjanin')
GO
SET IDENTITY_INSERT [dbo].[cities] OFF
GO
SET IDENTITY_INSERT [dbo].[compatibilities] ON 
GO
INSERT [dbo].[compatibilities] ([id_compatibility], [id_product], [id_compatible_product], [compatible_details]) VALUES (1, 15, 6, N'The Predator X34 and Megaport PC Gamer combine for a tear-free, high-resolution gaming experience with G-Sync support. ASUS ROG Strix Z390-E ensures smooth connectivity, unlocking the full potential of the Predator X34''s high refresh rate. Intel Core i7-9700K and RTX 2080 Super deliver optimal performance for immersive gaming on the Predator X34. Liquid cooling in the Megaport PC Gamer maintains low temperatures during extended gaming sessions, enhancing overall system reliability.')
GO
INSERT [dbo].[compatibilities] ([id_compatibility], [id_product], [id_compatible_product], [compatible_details]) VALUES (2, 9, 52, N'The AMD Ryzen 5 2600 pairs well with the MSI LGA1155 motherboard, offering a cost-effective solution for a mid-range gaming setup. The AM4 socket on the Ryzen 5 2600 ensures easy installation on the LGA1155 motherboard, providing a balance of gaming and multitasking performance. Utilize the PCIe slots on the MSI motherboard for graphics cards or other expansion cards to complement the capabilities of the Ryzen 5 2600. The DDR4 RAM support on the motherboard enhances overall system performance when combined with the Ryzen 5 2600 processor.')
GO
INSERT [dbo].[compatibilities] ([id_compatibility], [id_product], [id_compatible_product], [compatible_details]) VALUES (4, 40, 83, N'The ASUS Computer S12H2, with its USB and audio jack ports, easily accommodates the Trust Gaming Headset P09, providing a seamless connection for immersive audio experiences. Take advantage of the ASUS laptop''s graphics capabilities for an enhanced gaming experience when using the Trust Gaming Headset P09, ensuring clear and detailed audio during gameplay. The versatile connectivity options on both devices make them compatible for use with various gaming consoles or PCs, offering flexibility for different gaming setups. The ASUS laptop''s portability complements the Trust Gaming Headset P09, providing a convenient gaming solution for on-the-go or at-home use.')
GO
INSERT [dbo].[compatibilities] ([id_compatibility], [id_product], [id_compatible_product], [compatible_details]) VALUES (5, 42, 24, N'The Laptop Dell Computer Bag is specifically designed to snugly fit the Dell XPS 13-9350, ensuring a secure and protected transportation solution. The padded interior of the Dell Computer Bag provides extra cushioning for the XPS 13-9350, safeguarding it from bumps and scratches during travel. Utilize the multiple pockets in the laptop bag for carrying accessories like chargers, cables, and external drives that complement the sleek and professional design of the Dell XPS 13-9350. The Dell XPS 13-9350''s compact size makes it an ideal fit for the laptop bag, offering a convenient and stylish solution for professionals on the go.')
GO
SET IDENTITY_INSERT [dbo].[compatibilities] OFF
GO
SET IDENTITY_INSERT [dbo].[discount_durations] ON 
GO
INSERT [dbo].[discount_durations] ([id_discount_duration], [id_discount], [discount_date_from], [discount_date_till]) VALUES (2, 6, CAST(N'2023-09-01' AS Date), CAST(N'2023-09-02' AS Date))
GO
INSERT [dbo].[discount_durations] ([id_discount_duration], [id_discount], [discount_date_from], [discount_date_till]) VALUES (3, 5, CAST(N'2023-08-20' AS Date), CAST(N'2023-10-01' AS Date))
GO
INSERT [dbo].[discount_durations] ([id_discount_duration], [id_discount], [discount_date_from], [discount_date_till]) VALUES (4, 1, CAST(N'2023-11-24' AS Date), CAST(N'2023-11-25' AS Date))
GO
INSERT [dbo].[discount_durations] ([id_discount_duration], [id_discount], [discount_date_from], [discount_date_till]) VALUES (5, 2, CAST(N'2023-11-27' AS Date), CAST(N'2023-11-28' AS Date))
GO
INSERT [dbo].[discount_durations] ([id_discount_duration], [id_discount], [discount_date_from], [discount_date_till]) VALUES (6, 3, CAST(N'2023-06-21' AS Date), CAST(N'2030-08-20' AS Date))
GO
INSERT [dbo].[discount_durations] ([id_discount_duration], [id_discount], [discount_date_from], [discount_date_till]) VALUES (7, 7, CAST(N'2023-12-22' AS Date), CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[discount_durations] ([id_discount_duration], [id_discount], [discount_date_from], [discount_date_till]) VALUES (8, 7, CAST(N'2024-01-05' AS Date), CAST(N'2024-01-08' AS Date))
GO
INSERT [dbo].[discount_durations] ([id_discount_duration], [id_discount], [discount_date_from], [discount_date_till]) VALUES (9, 8, CAST(N'2024-05-01' AS Date), CAST(N'2024-05-08' AS Date))
GO
INSERT [dbo].[discount_durations] ([id_discount_duration], [id_discount], [discount_date_from], [discount_date_till]) VALUES (10, 8, CAST(N'2024-03-24' AS Date), CAST(N'2024-04-02' AS Date))
GO
INSERT [dbo].[discount_durations] ([id_discount_duration], [id_discount], [discount_date_from], [discount_date_till]) VALUES (11, 4, CAST(N'2023-12-28' AS Date), CAST(N'2024-01-05' AS Date))
GO
SET IDENTITY_INSERT [dbo].[discount_durations] OFF
GO
SET IDENTITY_INSERT [dbo].[discount_prices] ON 
GO
INSERT [dbo].[discount_prices] ([id_discount_price], [id_price], [id_discount_duration], [discount_value], [discount_price], [saved]) VALUES (3, 7, 6, 15, 84.1500, 14.8500)
GO
INSERT [dbo].[discount_prices] ([id_discount_price], [id_price], [id_discount_duration], [discount_value], [discount_price], [saved]) VALUES (4, 3, 6, 40, 23.4000, 15.6000)
GO
INSERT [dbo].[discount_prices] ([id_discount_price], [id_price], [id_discount_duration], [discount_value], [discount_price], [saved]) VALUES (5, 5, 6, 25, 1424.2500, 474.7500)
GO
INSERT [dbo].[discount_prices] ([id_discount_price], [id_price], [id_discount_duration], [discount_value], [discount_price], [saved]) VALUES (6, 2, 6, 25, 921.7500, 307.2500)
GO
INSERT [dbo].[discount_prices] ([id_discount_price], [id_price], [id_discount_duration], [discount_value], [discount_price], [saved]) VALUES (7, 38, 6, 10, 207.0000, 23.0000)
GO
SET IDENTITY_INSERT [dbo].[discount_prices] OFF
GO
SET IDENTITY_INSERT [dbo].[discounts] ON 
GO
INSERT [dbo].[discounts] ([id_discount], [discount_name]) VALUES (6, N'Anniversary Sale')
GO
INSERT [dbo].[discounts] ([id_discount], [discount_name]) VALUES (5, N'Back to School')
GO
INSERT [dbo].[discounts] ([id_discount], [discount_name]) VALUES (1, N'Black Friday')
GO
INSERT [dbo].[discounts] ([id_discount], [discount_name]) VALUES (7, N'Christmas')
GO
INSERT [dbo].[discounts] ([id_discount], [discount_name]) VALUES (2, N'Cyber Monday')
GO
INSERT [dbo].[discounts] ([id_discount], [discount_name]) VALUES (8, N'Easter')
GO
INSERT [dbo].[discounts] ([id_discount], [discount_name]) VALUES (4, N'New Year')
GO
INSERT [dbo].[discounts] ([id_discount], [discount_name]) VALUES (3, N'Summer Clearance')
GO
SET IDENTITY_INSERT [dbo].[discounts] OFF
GO
SET IDENTITY_INSERT [dbo].[FAQs] ON 
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (1, N'What are your store hours?', N'Our store hours are Monday to Friday from 9:00 AM to 7:00 PM, and Saturday from 10:00 AM to 5:00 PM. We are closed on Sundays.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (2, N'Do you offer online ordering with in-store pickup?', N'Yes, we offer online ordering with the option for in-store pickup. You can place your order on our website and collect it at your nearest store.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (3, N'What payment methods do you accept?', N'We accept cash, credit cards (Visa, Mastercard, American Express), and digital payment platforms like PayPal and Apple Pay.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (4, N'Do you provide warranty for your products?', N'Yes, all our products come with a standard manufacturer''s warranty. Additional extended warranties may also be available for purchase.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (5, N'Can I return or exchange a product if I''m not satisfied?', N'Yes, you can return or exchange products within 30 days of purchase, provided they are in their original condition and packaging. Please refer to our return policy for more details.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (6, N'Are your products compatible with different operating systems?', N'Our products are compatible with a wide range of operating systems, including Windows, macOS, and Linux. Compatibility information is usually provided on the product page.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (7, N'Do you offer technical support for your products?', N'Yes, we provide technical support for all the products we sell. You can reach out to our support team via email or phone for assistance.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (8, N'Can I track my order once it''s been shipped?', N'Yes, once your order is shipped, you will receive a tracking number via email. You can use this number to track your order''s status.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (9, N'Do you offer custom-built PCs?', N'Yes, we offer custom-built PCs tailored to your specific needs and preferences. Our staff will be happy to assist you in selecting the right components.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (10, N'Is there an option for international shipping?', N'Currently, we only offer shipping within the country. International shipping is not available at the moment.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (11, N'Do you provide installation services for software or hardware?', N'Yes, we offer installation services for both software and hardware. Our technicians can help you set up your purchased products.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (12, N'Are your products new or refurbished?', N'The majority of our products are brand new. However, we may offer some refurbished items with proper labeling and warranty coverage.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (13, N'Can I check product availability at my local store online?', N'Yes, you can check product availability at your nearest store by using the "Check In-Store Availability" feature on our website.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (14, N'What brands do you carry in-store?', N'We carry a wide range of reputable brands in-store, including Dell, HP, Asus, Lenovo, Apple, and more.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (15, N'Can I place an order over the phone?', N'Yes, you can place an order over the phone by calling our customer service hotline. Our representatives will assist you with the process.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (16, N'Do you offer discounts for bulk orders?', N'Yes, we provide discounts for bulk orders. Please get in touch with our sales team to discuss your specific requirements.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (17, N'How do I check the status of my repair or service order?', N'You can check the status of your repair or service order by logging into your account on our website or by contacting our support team.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (18, N'Can I subscribe to receive updates on promotions and deals?', N'Absolutely! You can subscribe to our newsletter to receive regular updates on promotions, deals, and new product launches.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (19, N'Is there a loyalty program for frequent customers?', N'Yes, we have a loyalty program that rewards our frequent customers with points for purchases, which can be redeemed for discounts or other benefits.')
GO
INSERT [dbo].[FAQs] ([id_faq], [faq_question], [faq_answer]) VALUES (20, N'Are you hiring at the moment? How can I apply for a job?', N'Job openings, if available, will be posted on our Careers page. You can apply online by submitting your resume and cover letter through the application form provided.')
GO
SET IDENTITY_INSERT [dbo].[FAQs] OFF
GO
SET IDENTITY_INSERT [dbo].[featured_products] ON 
GO
INSERT [dbo].[featured_products] ([id_featured_product], [id_product], [featured_date_from], [featured_date_till], [priority]) VALUES (1, 2, CAST(N'2023-06-24' AS Date), CAST(N'2030-12-31' AS Date), 1)
GO
INSERT [dbo].[featured_products] ([id_featured_product], [id_product], [featured_date_from], [featured_date_till], [priority]) VALUES (2, 3, CAST(N'2023-06-24' AS Date), CAST(N'2030-12-31' AS Date), 10)
GO
INSERT [dbo].[featured_products] ([id_featured_product], [id_product], [featured_date_from], [featured_date_till], [priority]) VALUES (3, 4, CAST(N'2023-06-24' AS Date), CAST(N'2030-12-31' AS Date), 2)
GO
INSERT [dbo].[featured_products] ([id_featured_product], [id_product], [featured_date_from], [featured_date_till], [priority]) VALUES (6, 6, CAST(N'2023-07-01' AS Date), CAST(N'2030-12-31' AS Date), 1)
GO
INSERT [dbo].[featured_products] ([id_featured_product], [id_product], [featured_date_from], [featured_date_till], [priority]) VALUES (7, 9, CAST(N'2023-07-01' AS Date), CAST(N'2030-12-31' AS Date), 2)
GO
INSERT [dbo].[featured_products] ([id_featured_product], [id_product], [featured_date_from], [featured_date_till], [priority]) VALUES (8, 10, CAST(N'2023-07-01' AS Date), CAST(N'2030-12-31' AS Date), 4)
GO
SET IDENTITY_INSERT [dbo].[featured_products] OFF
GO
SET IDENTITY_INSERT [dbo].[locations] ON 
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (2, 1, 1, N'13', N'44.8167018', N'20.4649368')
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (3, 1, 2, N'4', N'44.8153208', N'20.437073')
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (4, 1, 3, N'34', N'44.784239', N'20.4690994')
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (5, 2, 4, N'9', N'45.2567629', N'19.8484067')
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (6, 2, 5, N'45', N'45.2568675', N'19.8476859')
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (7, 2, 6, N'70', N'45.265243', N'19.8356889')
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (8, 3, 7, N'4', N'43.3153826', N'21.8944752')
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (9, 3, 8, N'2', N'43.3405508', N'21.8770665')
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (10, 3, 9, N'12', N'43.3455464', N'21.881262')
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (11, 4, 5, N'22', N'44.0182562', N'20.9172123')
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (12, 5, 11, N'12', N'46.0963805', N'19.6579234')
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (13, 5, 12, N'20', N'46.1043775', N'19.6676551')
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (14, 6, 13, N'60', N'45.3883373', N'20.3909946')
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (15, 7, 14, N'8', N'43.8950064', N'20.3504833')
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (16, 7, 15, N'81', N'43.8881958', N'20.3384053')
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (17, 8, 16, N'43', N'43.726055', N'20.6906627')
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (18, 9, 17, N'16', N'44.8677947', N'20.6411722')
GO
INSERT [dbo].[locations] ([id_location], [id_city], [id_street], [number], [latitude], [longitude]) VALUES (19, 10, 18, N'102', N'43.8557812', N'19.8409679')
GO
SET IDENTITY_INSERT [dbo].[locations] OFF
GO
SET IDENTITY_INSERT [dbo].[logins] ON 
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (1, 6, CAST(N'2023-07-29T19:56:50.853' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2, 6, CAST(N'2023-07-29T19:57:17.683' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (3, 6, CAST(N'2023-07-29T20:23:31.867' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (4, 6, CAST(N'2023-07-29T20:33:00.570' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (5, 6, CAST(N'2023-07-29T20:33:39.827' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (6, 6, CAST(N'2023-07-29T20:34:59.120' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (7, 6, CAST(N'2023-07-29T20:36:16.977' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (8, 6, CAST(N'2023-07-29T20:55:32.013' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (9, 6, CAST(N'2023-07-29T20:57:11.520' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (10, 6, CAST(N'2023-07-30T13:10:34.850' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (11, 6, CAST(N'2023-07-30T13:57:10.583' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (12, 6, CAST(N'2023-08-08T18:53:09.870' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (13, 6, CAST(N'2023-08-08T18:55:40.573' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (14, 6, CAST(N'2023-08-08T19:00:15.623' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (15, 6, CAST(N'2023-08-09T09:56:13.997' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (16, 6, CAST(N'2023-08-19T11:34:49.613' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (17, 6, CAST(N'2023-08-26T15:58:17.040' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (18, 6, CAST(N'2023-08-26T17:14:45.733' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (1018, 6, CAST(N'2023-10-15T19:43:22.180' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2018, 6, CAST(N'2023-11-10T18:09:31.297' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2019, 6, CAST(N'2023-11-10T18:14:19.493' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2020, 6, CAST(N'2023-11-10T18:28:35.847' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2021, 6, CAST(N'2023-11-10T18:32:34.170' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2022, 6, CAST(N'2023-11-10T18:32:55.127' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2023, 6, CAST(N'2023-11-18T17:48:42.917' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2024, 6, CAST(N'2023-11-18T18:03:50.190' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2025, 6, CAST(N'2023-11-18T18:09:17.453' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2026, 6, CAST(N'2023-11-18T18:10:10.390' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2027, 6, CAST(N'2023-11-18T18:11:12.127' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2028, 6, CAST(N'2023-11-18T18:14:16.440' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2029, 6, CAST(N'2023-11-18T19:58:52.920' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2030, 6, CAST(N'2023-11-19T12:11:21.197' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2031, 6, CAST(N'2023-11-19T12:18:41.840' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2032, 6, CAST(N'2023-11-19T12:20:18.887' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2033, 6, CAST(N'2023-11-19T12:21:01.677' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2034, 6, CAST(N'2023-11-19T12:22:38.347' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2035, 6, CAST(N'2023-11-19T13:05:26.710' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2036, 6, CAST(N'2023-11-19T13:06:46.370' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2037, 6, CAST(N'2023-11-20T23:43:24.397' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2038, 6, CAST(N'2023-11-24T12:49:20.717' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2039, 6, CAST(N'2023-11-24T17:45:52.647' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2040, 6, CAST(N'2023-11-25T05:56:33.610' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2041, 6, CAST(N'2023-11-25T05:57:48.730' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2042, 6, CAST(N'2023-11-25T09:08:32.743' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2043, 6, CAST(N'2023-11-25T09:20:43.050' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2044, 6, CAST(N'2023-11-25T09:42:24.720' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2045, 6, CAST(N'2023-11-25T09:43:39.550' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2046, 6, CAST(N'2023-12-27T18:17:27.763' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2047, 6, CAST(N'2024-01-20T10:33:03.063' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2048, 6, CAST(N'2024-01-20T15:33:29.153' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2049, 6, CAST(N'2024-04-21T12:38:25.783' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2050, 6, CAST(N'2024-06-23T20:07:22.163' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2051, 6, CAST(N'2024-06-24T07:51:28.197' AS DateTime))
GO
INSERT [dbo].[logins] ([id_login], [id_user], [login_date]) VALUES (2052, 6, CAST(N'2024-06-24T07:55:06.890' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[logins] OFF
GO
SET IDENTITY_INSERT [dbo].[messages] ON 
GO
INSERT [dbo].[messages] ([id_message], [message_title], [message_content], [message_answer], [message_read], [sender_email]) VALUES (1, N'Test contact', N'Test contact form and functionality!', NULL, 0, N'test@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[messages] OFF
GO
SET IDENTITY_INSERT [dbo].[newsletter_subscribers] ON 
GO
INSERT [dbo].[newsletter_subscribers] ([id_subscriber], [subscriber_email], [subscriber_status]) VALUES (1, N'obra@gmail.com', 1)
GO
INSERT [dbo].[newsletter_subscribers] ([id_subscriber], [subscriber_email], [subscriber_status]) VALUES (2, N'obr@gmail.com', 1)
GO
INSERT [dbo].[newsletter_subscribers] ([id_subscriber], [subscriber_email], [subscriber_status]) VALUES (3, N'o@gmail.com', 1)
GO
INSERT [dbo].[newsletter_subscribers] ([id_subscriber], [subscriber_email], [subscriber_status]) VALUES (4, N't@gmail.com', 1)
GO
INSERT [dbo].[newsletter_subscribers] ([id_subscriber], [subscriber_email], [subscriber_status]) VALUES (5, N'dusankovic@gmail.com', 1)
GO
SET IDENTITY_INSERT [dbo].[newsletter_subscribers] OFF
GO
SET IDENTITY_INSERT [dbo].[order_status] ON 
GO
INSERT [dbo].[order_status] ([id_order_status], [order_status]) VALUES (2, N'Accepted')
GO
INSERT [dbo].[order_status] ([id_order_status], [order_status]) VALUES (4, N'Finished')
GO
INSERT [dbo].[order_status] ([id_order_status], [order_status]) VALUES (1, N'In process')
GO
INSERT [dbo].[order_status] ([id_order_status], [order_status]) VALUES (3, N'Refused')
GO
SET IDENTITY_INSERT [dbo].[order_status] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 
GO
INSERT [dbo].[orders] ([id_order], [id_cart], [id_payment_type], [order_date], [order_address], [id_city], [id_order_status], [recipient_name]) VALUES (3, 16, 2, CAST(N'2024-06-23T00:00:00.000' AS DateTime), N'Cvijiceva 10002', 1, 1, N'Obrad Pualic')
GO
INSERT [dbo].[orders] ([id_order], [id_cart], [id_payment_type], [order_date], [order_address], [id_city], [id_order_status], [recipient_name]) VALUES (4, 22, 1, CAST(N'2024-06-23T00:00:00.000' AS DateTime), N'Street 11', 5, 1, N'Annon User')
GO
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[payment_types] ON 
GO
INSERT [dbo].[payment_types] ([id_payment_type], [payment_type], [payment_type_description], [payment_type_img_src]) VALUES (1, N'Credit/Debit Card', N'Customers can make purchases using their credit cards, providing a convenient and secure way to pay. The app will require customers to enter their card number, expiration date, CVV, and billing address for verification. Encryption and security measures will be implemented to ensure the protection of sensitive information.', N'credit card and debit card.jpg')
GO
INSERT [dbo].[payment_types] ([id_payment_type], [payment_type], [payment_type_description], [payment_type_img_src]) VALUES (2, N'PayPal', N'PayPal offers a secure and widely recognized digital payment solution. Customers can link their bank accounts or credit cards to a PayPal account and use it to make purchases without directly sharing their financial information with the merchant. The app will redirect customers to the PayPal website to complete the transaction.', N'paypal img.png')
GO
INSERT [dbo].[payment_types] ([id_payment_type], [payment_type], [payment_type_description], [payment_type_img_src]) VALUES (3, N'Cash on Delivery (COD)', N'With this option, customers can place an order online and pay in cash when the product is delivered to their doorstep. It''s a convenient choice for those who may not have access to online payment methods or prefer to pay in person upon receiving their purchase.', N'cash on delivery.jpg')
GO
INSERT [dbo].[payment_types] ([id_payment_type], [payment_type], [payment_type_description], [payment_type_img_src]) VALUES (12, N'Bank Transfer', N'Customers can choose to pay by bank transfer, where they initiate a payment from their bank account to the store''s designated bank account. The app will provide instructions and necessary details for the transfer. This option is suitable for customers who prefer more traditional forms of payment or want to avoid using credit cards.', N'bank transfer img.jpg')
GO
INSERT [dbo].[payment_types] ([id_payment_type], [payment_type], [payment_type_description], [payment_type_img_src]) VALUES (13, N'Cryptocurrency (Crypto)', N'This innovative payment method allows tech-savvy customers to pay using popular cryptocurrencies like Bitcoin, Ethereum, or other accepted digital currencies. Transactions are processed through blockchain technology, providing transparency and security. Customers will need a cryptocurrency wallet and will be given a QR code or wallet address to complete the payment.', N'crypto img.jpg')
GO
SET IDENTITY_INSERT [dbo].[payment_types] OFF
GO
SET IDENTITY_INSERT [dbo].[prices] ON 
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (2, 2, 1229.0000, CAST(N'2023-07-24' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (3, 3, 39.0000, CAST(N'2023-07-24' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (4, 4, 899.0000, CAST(N'2023-07-24' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (5, 6, 1899.0000, CAST(N'2023-07-24' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (6, 9, 259.0000, CAST(N'2023-07-24' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (7, 10, 99.0000, CAST(N'2023-07-24' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (8, 13, 220.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (9, 14, 340.9900, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (10, 15, 1330.4500, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (11, 16, 512.9900, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (12, 17, 160.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (13, 19, 170.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (14, 20, 99.9900, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (15, 21, 59.9900, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (16, 23, 195.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (17, 24, 45.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (18, 25, 330.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (19, 27, 230.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (20, 28, 545.9900, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (21, 29, 150.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (22, 30, 43.9900, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (23, 32, 22.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (24, 33, 380.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (25, 34, 430.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (26, 35, 210.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (27, 36, 620.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (28, 37, 32.9900, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (29, 38, 1239.9900, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (30, 39, 230.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (31, 40, 255.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (32, 41, 999.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (33, 42, 420.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (34, 44, 380.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (35, 45, 560.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (36, 46, 889.9900, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (37, 48, 190.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (38, 49, 230.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (39, 50, 135.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (40, 51, 159.9900, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (41, 52, 340.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (42, 53, 300.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (43, 54, 285.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (44, 55, 210.0000, CAST(N'2023-08-20' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (45, 56, 460.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (46, 57, 200.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (47, 58, 235.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (48, 59, 199.9900, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (49, 60, 360.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (50, 61, 315.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (51, 62, 460.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (52, 63, 180.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (53, 64, 195.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (54, 65, 225.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (55, 66, 140.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (56, 67, 160.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (57, 68, 189.9900, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (58, 69, 219.9900, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (59, 70, 86.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (60, 71, 100.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (61, 72, 40.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (62, 73, 110.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (63, 74, 55.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (64, 75, 25.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (65, 76, 18.9900, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (66, 77, 1099.9900, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (67, 78, 112.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (68, 79, 92.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (69, 80, 76.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (70, 81, 110.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (71, 82, 142.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (72, 83, 105.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (73, 84, 89.9900, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (74, 85, 90.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (75, 86, 56.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (76, 87, 110.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (77, 88, 135.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (78, 89, 165.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (79, 90, 220.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (80, 91, 250.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (81, 92, 90.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (82, 93, 56.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (83, 94, 60.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
INSERT [dbo].[prices] ([id_price], [id_product], [product_price], [price_date_from], [price_date_till]) VALUES (84, 95, 120.0000, CAST(N'2023-08-21' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[prices] OFF
GO
SET IDENTITY_INSERT [dbo].[product_images] ON 
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (1, 2, N'Buypower Gaming computer_1690206963.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (2, 3, N'Creative Loudspeaker_1690206963.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (3, 4, N'Macintosh Notebook Laptop_1690206963.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (4, 6, N'Megaport PC Gamer_1690206963.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (5, 9, N'AMD Ryzen 5 2600 Processor_1690206963.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (6, 10, N'TridentZ DDR4 16GB_1690206963.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (7, 13, N'Dell Computer Monitor.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (8, 14, N'Silver iMac PC Monitor.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (9, 15, N'Predator X34 Curved Gaming Monitor.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (10, 16, N'ROG Swift 4K HDR Gaming Monitor.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (11, 17, N'Gray HP flat screen monitor.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (12, 19, N'Dell XPS Monitor.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (13, 20, N'Kaspersky Anti-Virus.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (14, 21, N'FIFA 22 PC Game.jpg')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (15, 23, N'Computer System Cooling AeroCool.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (16, 25, N'ATX Torre Computer Case.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (17, 24, N'Laptop Dell Inch Computers Bag.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (18, 27, N'Printer HP LaserJet.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (19, 28, N'Multi-function printer Epson.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (20, 29, N'TP-Link wireless modem router.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (21, 30, N'Mouse Pad Razer.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (22, 32, N'black SanDisk flash drive.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (23, 33, N'WD Elements Portable HDD External storage.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (24, 34, N'WD My Book External HDD.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (25, 35, N'Samsung Portable HDD.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (26, 36, N'Flatbed scanner A4 Epson Perfection.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (27, 37, N'Adapter DVI VGA connector Lindy.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (28, 38, N'Buypower PC MC3000.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (29, 39, N'HP EliteBook Laptop C2.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (30, 40, N'Laptop ASUS Computer S12H2.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (31, 41, N'Dell Vostro Desktop Computers H11.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (32, 42, N'Laptop Dell XPS 13-9350 Computer.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (33, 44, N'Dell XPS Laptop XPS 11.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (34, 45, N'Laptop Lenovo Yoga IdeaPad.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (35, 46, N'Gaming Lenovo Laptop J122L.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (36, 48, N'Acer Laptop XSS23.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (37, 49, N'LGA 1150 Motherboard MSI.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (38, 50, N'Intel Motherboard LGA 1155.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (39, 51, N'LGA 1151 microATX.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (40, 52, N'MSI Motherboard LGA 1155.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (41, 53, N'Intel LGA 1151 Gigabyte.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (42, 54, N'Motherboard Gigabyte LGA 1155.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (43, 55, N'Asus LGA 1151 Motherboard.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (44, 56, N'Z170 Premium DELUXE Skylake.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (45, 57, N'Asus microATX Socket AM3.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (46, 58, N'Blue LGA 1150 Motherboard MSI.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (47, 59, N'Laptop Dell Motherboard microATX.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (48, 60, N'ASUS B150 PRO GAMING ATX.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (49, 61, N'Asus Strix H270F Gaming ATX.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (50, 62, N'Tuf Z370-PRO Gaming DDR4 ATX.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (51, 63, N'Sentey 750W Power Supply XX11.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (52, 64, N'KCAS 750W-GM S11.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (53, 65, N'KCAS 1000W KJ99.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (54, 66, N'Corsair VS620W B623.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (55, 67, N'Thermaltake Smart RGB ATX 80 PLUS.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (56, 68, N'Corsair CX750W.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (57, 69, N'Corsair RM750W JJK.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (58, 70, N'Webcam 1080p Logitech P8.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (59, 71, N'Microphone Webcam Logitech 12XS.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (60, 72, N'Webcamera RT22 USB Genius.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (61, 73, N'Microsoft LifeCam Camera, G92.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (62, 74, N'Logitech 720p B7.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (63, 75, N'Logitech USB Desktop Microphone iT.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (64, 76, N'Genius Microphone L5.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (65, 77, N'Microphone TRUST GTX 252.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (66, 78, N'Spirit of Gamer XPERT-H2.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (67, 79, N'Spirit of Gamer SA12.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (68, 80, N'Kingston HyperX 2211.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (69, 81, N'Kingston Hyperx Cloud Ii.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (70, 82, N'Spirit Of Gamer PRO-H5.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (71, 83, N'Trust Gaming Headset P09.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (72, 84, N'Sony Black 711 Headset.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (73, 85, N'Sony Blue 82 Headset.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (74, 86, N'Blue Beats KJLI12.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (75, 87, N'Headphones JBL Black 13.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (76, 88, N'Kingston HyperX Cloud Alpha.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (77, 89, N'Spirit of Gamer Elite-H30.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (78, 90, N'Razer Black Headset K2.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (79, 91, N'Cougar Immersa Pro 7.1 RGB Gaming Headset.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (80, 92, N'JBL T450 Headphones.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (81, 93, N'Red Beats KJLI12.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (82, 94, N'Silver Beats KJLI12.png')
GO
INSERT [dbo].[product_images] ([id_image], [id_product], [src]) VALUES (83, 95, N'AirPods Headphones XII.png')
GO
SET IDENTITY_INSERT [dbo].[product_images] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (2, N'Buypower Gaming computer', N'Buypower Intel Core i7 Gaming computer', CAST(N'2023-06-24' AS Date), 1, CAST(8.3 AS Decimal(3, 1)), 3)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (3, N'Creative Loudspeaker', NULL, CAST(N'2023-02-14' AS Date), 2, CAST(8.9 AS Decimal(3, 1)), 2)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (4, N'Macintosh Notebook Laptop', N'Macintosh Notebook Samsung Laptop', CAST(N'2023-05-22' AS Date), 3, CAST(9.3 AS Decimal(3, 1)), 2)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (6, N'Megaport PC Gamer', N'Megaport PC Gamer AMD FX-6100', CAST(N'2023-07-02' AS Date), 4, CAST(8.8 AS Decimal(3, 1)), 2)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (9, N'AMD Ryzen 5 2600 Processor', N'Socket AM4 Multi-core processor Central processing unit AMD Ryzen 5 2600 Processor with Wraith Stealth Cooler YD2600BBAFBOX', CAST(N'2023-06-20' AS Date), 5, CAST(9.5 AS Decimal(3, 1)), 2)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (10, N'TridentZ DDR4 16GB', N'TridentZ DDR4 16GB SDRAM G.Skill DIMM Patriot Memory Patriot Stellar Boost XT', CAST(N'2023-04-11' AS Date), 6, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (13, N'Dell Computer Monitor', N'Dell monitor LED-backlit LCD Computer Monitor LED display, Computer, television', CAST(N'2023-08-15' AS Date), 7, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (14, N'Silver iMac PC Monitor', N'silver iMac, Macintosh MacBook Pro Apple Thunderbolt Display Computer monitor', CAST(N'2023-08-15' AS Date), 8, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (15, N'Predator X34 Curved Gaming Monitor', N'Predator X34 Curved Gaming Monitor ACER Predator Z35P Nvidia G-Sync 219 aspect ratio Computer Monitor', CAST(N'2023-08-15' AS Date), 9, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (16, N'ROG Swift 4K HDR Gaming Monitor', N'ROG Swift 4K HDR Gaming Monitor PG27UQ Computer Monitors Nvidia G-Sync Refresh rate 4K resolution', CAST(N'2023-08-15' AS Date), 10, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (17, N'Gray HP flat screen monitor', N'gray HP flat screen monitor, Computer monitor IPS panel 1080p LED-backlit LCD HDMI', CAST(N'2023-08-15' AS Date), 11, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (19, N'Dell XPS Monitor', N'Dell XPS All-in-One Computer Monitor', CAST(N'2023-08-15' AS Date), 7, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (20, N'Kaspersky Anti-Virus', N'Kaspersky Anti-Virus Kaspersky Internet Security Kaspersky Lab Antivirus software', CAST(N'2023-08-15' AS Date), 12, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (21, N'FIFA 22 PC Game', NULL, CAST(N'2023-08-15' AS Date), 13, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (23, N'Computer System Cooling AreoCool', N'Computer Cases & Housings Computer System Cooling Parts Water cooling Heat sink AeroCool', CAST(N'2023-08-15' AS Date), 14, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (24, N'Laptop Dell Computer Bag', N'Laptop Dell Inch Tablet Computers Bag', CAST(N'2023-08-15' AS Date), 16, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (25, N'ATX Torre Computer Case', N'Computer Cases & Housings ATX Personal computer Torre Gamer', CAST(N'2023-08-16' AS Date), 17, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (27, N'Printer HP LaserJet', N'Hewlett-Packard Printer Laser printing HP LaserJet', CAST(N'2023-08-16' AS Date), 18, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (28, N'Multi-function printer Epson', N'Inkjet printing Multi-function printer Epson', CAST(N'2023-08-16' AS Date), 19, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (29, N'TP-Link wireless router', N'White TP-Link wireless modem router', CAST(N'2023-08-16' AS Date), 20, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (30, N'Mouse Pad Razer', N'Computer mouse Mouse Mats Razer', CAST(N'2023-08-16' AS Date), 21, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (32, N'SanDisk flash memory', N'Black SanDisk flash drive', CAST(N'2023-08-16' AS Date), 22, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (33, N'Portable HDD External storage', N'WD Elements Portable HDD External storage Hard Drives USB 3.0 Terabyte', CAST(N'2023-08-16' AS Date), 23, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (34, N'WD My Book External HDD', N'Western Digital My Book WD My Book External HDD Hard Drives USB 3.0 External storage', CAST(N'2023-08-16' AS Date), 23, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (35, N'Samsung  Portable HDD', NULL, CAST(N'2023-08-16' AS Date), 24, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (36, N'Flatbed scanner A4 Epson Perfection', N'nkjet printing Flatbed scanner A4 Epson Perfection V600 6400 x 9600 dpi scanner Dots per inch', CAST(N'2023-08-16' AS Date), 25, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (37, N'Adapter DVI VGA connector', N'Graphics Cards & Video Adapters Digital Visual Interface VGA connector Electrical cable', CAST(N'2023-08-16' AS Date), 26, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (38, N'Buypower PC MC3000', N'Buypower PC MC3000 Full Set with GPU GeForceGTX 1080TI', CAST(N'2023-08-16' AS Date), 1, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (39, N'HP EliteBook Laptop C2', N'HP EliteBook Laptop Intel Core i5 Hewlett-Packard', CAST(N'2023-08-16' AS Date), 27, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (40, N'Laptop ASUS Computer S12H2', NULL, CAST(N'2023-08-16' AS Date), 28, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (41, N'Dell Vostro Desktop Computers H11', N'Full Dell Set with Monitor, Keyboard and Mouse', CAST(N'2023-08-16' AS Date), 29, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (42, N'Laptop Dell XPS 13-9350 Computer', NULL, CAST(N'2023-08-16' AS Date), 30, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (44, N'Dell XPS Laptop XPS 11', N'Dell XPS Laptop Intel Dell Inspiron', CAST(N'2023-08-16' AS Date), 30, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (45, N'Laptop Lenovo Yoga IdeaPad', NULL, CAST(N'2023-08-16' AS Date), 31, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (46, N'Gaming Lenovo Laptop J122L', N'Laptop Video game Lenovo Gamer Computer', CAST(N'2023-08-16' AS Date), 31, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (48, N'Acer Laptop XSS23', NULL, CAST(N'2023-08-16' AS Date), 32, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (49, N'LGA 1150 Motherboard MSI', N'Intel LGA 1150 Motherboard MSI PCI Express', CAST(N'2023-08-17' AS Date), 33, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (50, N'Intel Motherboard LGA 1155', N'Intel vPro Motherboard LGA 1155 microATX', CAST(N'2023-08-17' AS Date), 34, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (51, N'LGA 1151 microATX', N'LGA 1151 microATX Motherboard ASUS', CAST(N'2023-08-17' AS Date), 35, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (52, N'MSI Motherboard LGA 1155', N'Laptop MSI Motherboard LGA 1155 Gaming', CAST(N'2023-08-17' AS Date), 33, CAST(8.9 AS Decimal(3, 1)), 2)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (53, N'Intel LGA 1151 Gigabyte', N'Intel LGA 1151 Motherboard Coffee Lake Gigabyte Technology', CAST(N'2023-08-17' AS Date), 36, CAST(9.1 AS Decimal(3, 1)), 2)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (54, N'Motherboard Gigabyte LGA 1155', N'Motherboard Gigabyte Technology LGA 1155 Central processing unit Overclocking', CAST(N'2023-08-17' AS Date), 36, CAST(9.1 AS Decimal(3, 1)), 2)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (55, N'Asus LGA 1151 Motherboard', N'Intel LGA 1151 Motherboard CPU socket Land grid array', CAST(N'2023-08-17' AS Date), 35, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (56, N'Z170 Premium DELUXE Skylake', N'Z170 Premium Motherboard Z170-DELUXE Intel LGA 1151 Skylake', CAST(N'2023-08-17' AS Date), 35, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (57, N'Asus microATX Socket AM3', N'microATX Socket AM3+ Motherboard', CAST(N'2023-08-17' AS Date), 35, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (58, N'Blue LGA 1150 Motherboard MSI', N'Intel Graphics Cards & Video Adapters LGA 1150 Motherboard MSI', CAST(N'2023-08-17' AS Date), 33, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (59, N'Laptop Dell Motherboard microATX', N'Laptop Dell Motherboard microATX ASUS', CAST(N'2023-08-17' AS Date), 35, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (60, N'Asus B150 PRO Gaming ATX', N'Intel LGA 1151 Motherboard ASUS B150 PRO GAMING ATX', CAST(N'2023-08-17' AS Date), 35, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (61, N'Asus Strix H270F Gaming ATX', N'Strix H270F Gaming LGA 1151 Motherboard ASUS ATX', CAST(N'2023-08-17' AS Date), 35, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (62, N'Tuf Z370-PRO Gaming DDR4 ATX', N'Socket AM4 ASUS Intel Tuf Z370-PRO Gaming Socket LGA 1151 DDR4 ATX Motherboard ASUS Intel Tuf Z370-PRO Gaming Socket LGA 1151 DDR4 ATX Motherboard Land grid array', CAST(N'2023-08-17' AS Date), 35, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (63, N'Sentey 750W Power Supply XX11', N'Power supply unit Computer Cases & Housings 80 Plus ATX Power Converters', CAST(N'2023-08-17' AS Date), 37, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (64, N'KCAS 750W-GM S11', N'Power supply unit 80 Plus Power Converters ATX KCAS', CAST(N'2023-08-17' AS Date), 38, CAST(8.9 AS Decimal(3, 1)), 2)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (65, N'KCAS 1000W KJ99', N'Power supply unit Computer Cases & Housings Power Converters 80 Plus AeroCool 1000W KCAS-1000M Modular Power Supply', CAST(N'2023-08-17' AS Date), 38, CAST(9.5 AS Decimal(3, 1)), 2)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (66, N'Corsair VS620W B623', N'Power supply unit Power Converters 80 Plus ATX Electric power', CAST(N'2023-08-17' AS Date), 39, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (67, N'Thermaltake Smart RGB ATX 80 PLUS', N'PC power supply unit Thermaltake Smart RGB ATX 80 PLUS', CAST(N'2023-08-17' AS Date), 40, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (68, N'Corsair CX750W', N'Power supply unit 80 Plus Corsair Components ATX PCI Express', CAST(N'2023-08-17' AS Date), 39, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (69, N'Corsair RM750W JJK', N'Power supply unit 80 Plus Corsair Components Power Converters CISCO CP-LKC', CAST(N'2023-08-17' AS Date), 39, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (70, N'Webcam 1080p Logitech P8', NULL, CAST(N'2023-08-17' AS Date), 41, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (71, N'Microphone Webcam Logitech 12XS', NULL, CAST(N'2023-08-17' AS Date), 41, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (72, N'Webcamera RT22 USB Genius', NULL, CAST(N'2023-08-17' AS Date), 42, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (73, N'Microsoft LifeCam Camera, G92', NULL, CAST(N'2023-08-17' AS Date), 43, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (74, N'Logitech 720p B7', NULL, CAST(N'2023-08-17' AS Date), 41, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (75, N'Logitech USB Desktop Microphone iT', NULL, CAST(N'2023-08-17' AS Date), 44, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (76, N'Genius Microphone L5', NULL, CAST(N'2023-08-17' AS Date), 45, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (77, N'Microphone TRUST GTX 252', N'Microphone TRUST GTX 252 Emita Streaming Microphone Trust Starzz Computer', CAST(N'2023-08-17' AS Date), 46, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (78, N'Spirit of Gamer XPERT-H2', N'Microphone Advance Spirit of Gamer XPERT-H2 Gaming-Headset ', CAST(N'2023-08-17' AS Date), 47, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (79, N'Spirit of Gamer SA12', NULL, CAST(N'2023-08-17' AS Date), 47, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (80, N'Kingston HyperX 2211', N'Kingston HyperX Cloud Stinger Noise-cancelling headphones', CAST(N'2023-08-17' AS Date), 48, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (81, N'Kingston Hyperx Cloud Ii', NULL, CAST(N'2023-08-17' AS Date), 48, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (82, N'Spirit Of Gamer PRO-H5', N'Microphone Headphones Spirit Of Gamer PRO-H5 Headset', CAST(N'2023-08-17' AS Date), 47, CAST(9.2 AS Decimal(3, 1)), 3)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (83, N'Trust Gaming Headset P09', N'Laptop Trust Gaming headset 3.5 mm jack Corded Headphones 7.1 surround sound', CAST(N'2023-08-17' AS Date), 49, CAST(9.1 AS Decimal(3, 1)), 2)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (84, N'Sony Black 711 Headset', N'Microphone Noise-cancelling headphones Bluetooth Headset', CAST(N'2023-08-17' AS Date), 50, CAST(9.3 AS Decimal(3, 1)), 2)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (85, N'Sony Blue 82 Headset', N'blue Sony cordless headphones, Noise-cancelling headphones Bluetooth Headset Wireless', CAST(N'2023-08-17' AS Date), 50, CAST(9.5 AS Decimal(3, 1)), 2)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (86, N'Blue Beats KJLI12', N'blue Beats by Dr. Dre Beats Studio, Noise-cancelling headphones', CAST(N'2023-08-17' AS Date), 51, CAST(9.3 AS Decimal(3, 1)), 2)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (87, N'Headphones JBL Black 13', NULL, CAST(N'2023-08-17' AS Date), 52, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (88, N'Kingston HyperX Cloud Alpha', NULL, CAST(N'2023-08-17' AS Date), 48, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (89, N'Spirit of Gamer Elite-H30', N'Headphones Microphone Trust Gaming headset 3.5 mm jack Corded Spirit of Gamer Elite-H30', CAST(N'2023-08-17' AS Date), 47, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (90, N'Razer Black Headset K2', N'Microphone Headphones Wireless 7.1 surround sound Razer Inc', CAST(N'2023-08-17' AS Date), 53, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (91, N'Cougar Immersa Pro 7.1 RGB Gaming Headset', N'Microphone Cougar Immersa Gaming Headset Headphones Audio Cougar Immersa Pro 7.1 RGB Gaming Headset', CAST(N'2023-08-17' AS Date), 54, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (92, N'JBL T450 Headphones', N'JBL T450 Headphones Wireless Audio', CAST(N'2023-08-17' AS Date), 52, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (93, N'Red Beats KJLI12', N'red Beats by Dr. Dre wireless headphones', CAST(N'2023-08-17' AS Date), 51, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (94, N'Silver Beats KJLI12', N'silver Beats by Dr. Dre wireless headphones', CAST(N'2023-08-17' AS Date), 51, CAST(0.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[products] ([id_product], [product_name], [product_description], [product_obtained_date], [id_cat_brand], [avg_rating], [count_reviews]) VALUES (95, N'AirPods Headphones', NULL, CAST(N'2023-08-17' AS Date), 55, CAST(0.0 AS Decimal(3, 1)), 0)
GO
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[products_specifications] ON 
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (57, 1, 2, N'Intel Core i7')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (58, 2, 2, N'16')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (59, 3, 2, N'1')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (60, 4, 2, N'NVIDIA GeForce RTX 30 series')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (61, 5, 2, N'USB, HDMI, DisplayPort')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (62, 6, 2, N'Windows 10')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (63, 17, 3, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (64, 18, 3, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (65, 19, 3, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (66, 20, 3, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (67, 1, 4, N'Samsung')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (68, 2, 4, N'8')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (69, 3, 4, N'1')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (70, 4, 4, N'Intel UHD Graphics')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (71, 5, 4, N'USB, Thunderbolt')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (72, 6, 4, N'MacOS')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (85, 13, 6, N'6')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (86, 14, 6, N'12')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (87, 15, 6, N'16')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (88, 16, 6, N'65')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (89, 5, 6, N'USB, HDMI, DisplayPort')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (90, 6, 6, N'Windows 10')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (97, 13, 9, N'6')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (98, 14, 9, N'12')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (99, 15, 9, N'16')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (100, 16, 9, N'65')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (101, 55, 9, N'Air')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (102, 57, 9, N'65')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (103, 58, 9, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (104, 22, 10, N'DDR4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (105, 23, 10, N'3200')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (106, 24, 10, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (107, 25, 10, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (108, 26, 13, N'2560 x 1440')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (109, 27, 13, N'60')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (110, 28, 13, N'IPS')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (111, 29, 13, N'8')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (112, 30, 13, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (113, 31, 13, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (114, 26, 14, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (115, 27, 14, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (116, 28, 14, N'IPS')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (117, 29, 14, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (118, 30, 14, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (119, 31, 14, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (120, 26, 15, N'3440 x 1440')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (121, 27, 15, N'100')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (122, 28, 15, N'IPS')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (123, 29, 15, N'4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (124, 30, 15, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (125, 31, 15, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (126, 26, 16, N'3840 x 2160')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (127, 27, 16, N'144')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (128, 28, 16, N'IPS')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (129, 29, 16, N'4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (130, 30, 16, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (131, 31, 16, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (132, 26, 17, N'1920 x 1080')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (133, 27, 17, N'60')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (134, 28, 17, N'IPS')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (135, 29, 17, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (136, 30, 17, N'HDMI')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (137, 31, 17, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (138, 26, 19, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (139, 27, 19, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (140, 28, 19, N'IPS')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (141, 29, 19, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (142, 30, 19, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (143, 31, 19, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (144, 30, 20, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (145, 31, 20, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (146, 32, 20, N'Subscription')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (147, 33, 20, N'Multiple Languages')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (148, 34, 21, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (149, 35, 21, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (150, 36, 21, N'Sports')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (151, 37, 21, N'Yes')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (152, 52, 23, N'Liquid')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (153, 53, 23, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (154, 54, 23, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (155, 55, 23, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (156, 150, 24, N'15.6')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (157, 151, 24, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (158, 152, 24, N'Multiple')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (159, 153, 24, N'Adjustable Strap')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (160, 39, 25, N'ATX')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (161, 65, 25, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (162, 66, 25, N'USB, Audio')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (163, 67, 25, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (164, 20, 27, N'Laser')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (165, 108, 27, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (166, 109, 27, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (167, 110, 27, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (168, 86, 28, N'Inkjet')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (169, 87, 28, N'5760 x 1440')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (170, 167, 28, N'30')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (171, 108, 28, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (172, 108, 29, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (173, 109, 29, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (174, 110, 29, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (175, 111, 29, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (192, 111, 30, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (193, 50, 32, N'32GB')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (194, 50, 33, N'2TB')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (195, 50, 34, N'4TB')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (196, 50, 35, N'1TB')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (197, 165, 36, N'9600')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (198, 166, 36, N'3.4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (199, 57, 37, N'400W')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (200, 1, 38, N'Intel Core i7')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (201, 2, 38, N'32')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (202, 3, 38, N'1')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (203, 4, 38, N'GeForce GTX 1080TI')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (204, 5, 38, N'USB, HDMI, DisplayPort')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (205, 6, 38, N'Windows 10')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (206, 1, 39, N'Intel Core i5')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (207, 2, 39, N'8')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (208, 3, 39, N'1')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (209, 4, 39, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (210, 5, 39, N'USB, HDMI')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (211, 6, 39, N'Windows 10')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (212, 1, 40, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (213, 2, 40, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (214, 3, 40, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (215, 4, 40, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (216, 5, 40, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (217, 6, 40, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (256, 1, 41, N'Intel Core i7')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (257, 2, 41, N'32')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (258, 3, 41, N'1TB HDD')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (259, 4, 41, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (260, 5, 41, N'USB, HDMI')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (261, 6, 41, N'Windows 10')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (262, 22, 41, N'DDR4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (263, 1, 42, N'Intel Core i5')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (264, 2, 42, N'16')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (265, 3, 42, N'512GB SSD')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (266, 4, 42, N'Intel HD Graphics 520')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (267, 5, 42, N'USB, Thunderbolt')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (268, 6, 42, N'Windows 10')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (269, 22, 42, N'DDR4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (270, 1, 44, N'Intel Dell Inspiron')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (271, 2, 44, N'4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (272, 3, 44, N'256GB SSD')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (273, 4, 44, N'Intel HD Graphics 4200')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (274, 5, 44, N'USB, Mini DisplayPort')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (275, 6, 44, N'Windows 8')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (276, 22, 44, N'DDR3')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (277, 1, 45, N'Intel Core i7')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (278, 2, 45, N'16')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (279, 3, 45, N'1TB HDD')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (280, 4, 45, N'NVIDIA GeForce GTX 1050')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (281, 5, 45, N'USB, HDMI')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (282, 6, 45, N'Windows 10')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (283, 22, 45, N'DDR4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (284, 1, 46, N'Intel Core i7')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (285, 2, 46, N'32')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (286, 3, 46, N'1TB HDD + 256GB SSD')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (287, 4, 46, N'NVIDIA GeForce GTX 1060')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (288, 5, 46, N'USB, HDMI')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (289, 6, 46, N'Windows 10')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (290, 22, 46, N'DDR4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (291, 1, 48, N'Intel Core i5')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (292, 2, 48, N'8')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (293, 3, 48, N'256GB SSD')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (294, 4, 48, N'Intel HD Graphics 620')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (295, 5, 48, N'USB, HDMI')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (296, 6, 48, N'Windows 10')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (297, 22, 48, N'DDR4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (298, 38, 49, N'LGA 1150')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (299, 40, 49, N'ATX')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (300, 41, 49, N'4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (301, 45, 49, N'DDR3')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (302, 38, 50, N'LGA 1155')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (303, 40, 50, N'microATX')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (304, 41, 50, N'2')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (305, 45, 50, N'DDR3')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (306, 38, 51, N'LGA 1151')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (307, 40, 51, N'microATX')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (308, 41, 51, N'2')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (309, 45, 51, N'DDR4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (310, 38, 52, N'Laptop MSI Motherboard LGA 1155 Gaming')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (311, 40, 52, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (312, 41, 52, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (313, 45, 52, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (314, 38, 53, N'LGA 1151')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (315, 40, 53, N'ATX')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (316, 41, 53, N'4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (317, 22, 53, N'DDR4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (318, 38, 54, N'LGA 1155')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (319, 40, 54, N'ATX')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (320, 41, 54, N'4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (321, 22, 54, N'DDR3')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (322, 38, 55, N'LGA 1151')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (323, 40, 55, N'ATX')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (324, 41, 55, N'4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (325, 22, 55, N'DDR4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (326, 38, 56, N'Intel LGA 1151')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (327, 40, 56, N'ATX')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (328, 41, 56, N'4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (329, 22, 56, N'DDR4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (330, 38, 57, N'microATX')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (331, 40, 57, N'Socket AM3+')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (332, 41, 57, N'2')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (333, 22, 57, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (334, 38, 58, N'LGA 1150')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (335, 40, 58, N'ATX')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (336, 41, 58, N'4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (337, 22, 58, N'DDR3')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (338, 38, 59, N'microATX')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (339, 40, 59, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (340, 41, 59, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (341, 22, 59, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (342, 38, 60, N'LGA 1151')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (343, 40, 60, N'ATX')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (344, 41, 60, N'4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (345, 22, 60, N'DDR4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (346, 38, 61, N'LGA 1151')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (347, 40, 61, N'ATX')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (348, 41, 61, N'4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (349, 22, 61, N'DDR4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (350, 38, 62, N'LGA 1151')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (351, 40, 62, N'ATX')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (352, 41, 62, N'4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (353, 22, 62, N'DDR4')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (354, 57, 63, N'750')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (355, 57, 64, N'750')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (356, 57, 65, N'1000')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (357, 57, 66, N'620')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (358, 57, 67, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (359, 57, 68, N'750')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (360, 57, 69, N'750')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (361, 79, 70, N'1080')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (362, 84, 71, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (363, 22, 72, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (364, 11, 70, N'1080')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (365, 11, 73, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (366, 11, 74, N'720')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (367, 83, 75, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (368, 83, 76, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (369, 83, 77, N'GTX 252')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (370, 83, 78, N'PRO-H2')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (371, 83, 79, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (372, 54, 80, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (373, 54, 81, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (374, 83, 82, N'PRO-H5')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (375, 83, 83, N'Gaming Headset P09')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (376, 54, 84, N'711')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (377, 20, 85, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (378, 20, 86, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (379, 20, 87, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (380, 20, 88, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (381, 20, 89, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (382, 20, 90, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (383, 83, 90, N'Black')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (384, 20, 91, N'Pro 7.1 RGB')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (385, 83, 91, N'Gaming Headset')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (386, 20, 92, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (387, 20, 93, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (388, 20, 94, N'N/A')
GO
INSERT [dbo].[products_specifications] ([id_product_spec], [id_spec], [id_product], [product_spec_value]) VALUES (389, 20, 95, N'N/A')
GO
SET IDENTITY_INSERT [dbo].[products_specifications] OFF
GO
SET IDENTITY_INSERT [dbo].[products_tags] ON 
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (2, 10, 2, CAST(N'2023-04-11' AS Date), CAST(N'2023-06-11' AS Date), 0)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (3, 6, 2, CAST(N'2023-07-02' AS Date), CAST(N'2030-09-02' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (4, 9, 2, CAST(N'2023-06-22' AS Date), CAST(N'2023-06-20' AS Date), 0)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (5, 4, 2, CAST(N'2023-05-02' AS Date), CAST(N'2023-07-02' AS Date), 0)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (6, 4, 2, CAST(N'2023-05-22' AS Date), CAST(N'2023-07-22' AS Date), 0)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (7, 9, 2, CAST(N'2023-06-20' AS Date), CAST(N'2023-08-20' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (8, 10, 4, CAST(N'2023-07-24' AS Date), CAST(N'2030-08-20' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (9, 3, 4, CAST(N'2023-07-24' AS Date), CAST(N'2030-08-20' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (10, 6, 4, CAST(N'2023-07-24' AS Date), CAST(N'2030-08-20' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (11, 2, 4, CAST(N'2023-07-24' AS Date), CAST(N'2030-08-20' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (12, 10, 1, CAST(N'2023-07-24' AS Date), CAST(N'2030-08-20' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (13, 13, 2, CAST(N'2023-08-15' AS Date), CAST(N'2023-10-15' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (14, 14, 2, CAST(N'2023-08-15' AS Date), CAST(N'2023-10-15' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (15, 15, 2, CAST(N'2023-08-15' AS Date), CAST(N'2023-10-15' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (16, 16, 2, CAST(N'2023-08-15' AS Date), CAST(N'2023-10-15' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (17, 17, 2, CAST(N'2023-08-15' AS Date), CAST(N'2023-10-15' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (18, 19, 2, CAST(N'2023-08-15' AS Date), CAST(N'2023-10-15' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (19, 20, 2, CAST(N'2023-08-15' AS Date), CAST(N'2023-10-15' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (20, 21, 2, CAST(N'2023-08-15' AS Date), CAST(N'2023-10-15' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (21, 23, 2, CAST(N'2023-08-15' AS Date), CAST(N'2023-10-15' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (22, 24, 2, CAST(N'2023-08-15' AS Date), CAST(N'2023-10-15' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (23, 25, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (24, 27, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (25, 28, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (26, 29, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (27, 30, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (28, 32, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (29, 33, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (30, 34, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (31, 35, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (32, 36, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (33, 37, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (34, 38, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (35, 39, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (36, 40, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (37, 41, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (38, 42, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (39, 44, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (40, 45, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (41, 46, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (42, 48, 2, CAST(N'2023-08-16' AS Date), CAST(N'2023-10-16' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (43, 49, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (44, 50, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (45, 51, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (46, 52, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (47, 53, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (48, 54, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (49, 55, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (50, 56, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (51, 57, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (52, 58, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (53, 59, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (54, 60, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (55, 61, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (56, 62, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (57, 63, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (58, 64, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (59, 65, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (60, 66, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (61, 67, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (62, 68, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (63, 69, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (64, 70, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (65, 71, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (66, 72, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (67, 73, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (68, 74, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (69, 75, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (70, 76, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (71, 77, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (72, 78, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (73, 79, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (74, 80, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (75, 81, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (76, 82, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (77, 83, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (78, 84, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (79, 85, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (80, 86, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (81, 87, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (82, 88, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (83, 89, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (84, 90, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (85, 91, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (86, 92, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (87, 93, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (88, 94, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (89, 95, 2, CAST(N'2023-08-17' AS Date), CAST(N'2023-10-17' AS Date), 1)
GO
INSERT [dbo].[products_tags] ([id_product_tag], [id_product], [id_tag], [product_tag_date_from], [product_tag_date_till], [product_tag_active]) VALUES (1027, 49, 4, CAST(N'2023-08-21' AS Date), CAST(N'2030-08-20' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[products_tags] OFF
GO
SET IDENTITY_INSERT [dbo].[ratings] ON 
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (9, 2, 5, CAST(7.0 AS Decimal(3, 1)), CAST(N'2023-07-06T13:52:33.850' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (12, 2, 6, CAST(8.8 AS Decimal(3, 1)), CAST(N'2024-01-21T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (13, 2, 14, CAST(9.0 AS Decimal(3, 1)), CAST(N'2024-01-22T15:00:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (32, 3, 6, CAST(8.5 AS Decimal(3, 1)), CAST(N'2024-01-23T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (33, 3, 15, CAST(9.2 AS Decimal(3, 1)), CAST(N'2024-01-24T09:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (34, 4, 5, CAST(9.0 AS Decimal(3, 1)), CAST(N'2024-01-25T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (35, 4, 14, CAST(9.5 AS Decimal(3, 1)), CAST(N'2024-01-26T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (36, 6, 6, CAST(8.7 AS Decimal(3, 1)), CAST(N'2024-01-27T11:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (37, 6, 15, CAST(8.9 AS Decimal(3, 1)), CAST(N'2024-01-28T10:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (38, 9, 5, CAST(9.8 AS Decimal(3, 1)), CAST(N'2024-01-29T15:00:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (40, 9, 14, CAST(9.4 AS Decimal(3, 1)), CAST(N'2024-01-30T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (41, 52, 5, CAST(8.6 AS Decimal(3, 1)), CAST(N'2024-01-31T11:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (42, 52, 14, CAST(9.1 AS Decimal(3, 1)), CAST(N'2024-02-01T09:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (43, 53, 6, CAST(9.3 AS Decimal(3, 1)), CAST(N'2024-02-02T10:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (44, 53, 15, CAST(8.8 AS Decimal(3, 1)), CAST(N'2024-02-03T15:00:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (45, 54, 6, CAST(8.9 AS Decimal(3, 1)), CAST(N'2024-02-04T12:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (46, 54, 15, CAST(9.2 AS Decimal(3, 1)), CAST(N'2024-02-05T11:00:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (47, 64, 5, CAST(9.1 AS Decimal(3, 1)), CAST(N'2024-02-06T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (48, 64, 14, CAST(8.7 AS Decimal(3, 1)), CAST(N'2024-02-07T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (49, 65, 6, CAST(9.4 AS Decimal(3, 1)), CAST(N'2024-02-08T15:00:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (50, 65, 15, CAST(9.6 AS Decimal(3, 1)), CAST(N'2024-02-09T09:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (51, 82, 5, CAST(9.3 AS Decimal(3, 1)), CAST(N'2024-02-10T11:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (52, 82, 6, CAST(8.8 AS Decimal(3, 1)), CAST(N'2024-02-11T10:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (53, 82, 14, CAST(9.5 AS Decimal(3, 1)), CAST(N'2024-02-12T15:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (54, 83, 6, CAST(9.0 AS Decimal(3, 1)), CAST(N'2024-02-13T12:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (55, 83, 15, CAST(9.2 AS Decimal(3, 1)), CAST(N'2024-02-14T09:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (56, 84, 5, CAST(9.4 AS Decimal(3, 1)), CAST(N'2024-02-15T13:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (57, 84, 14, CAST(9.1 AS Decimal(3, 1)), CAST(N'2024-02-16T16:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (58, 85, 6, CAST(9.6 AS Decimal(3, 1)), CAST(N'2024-02-17T11:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (59, 85, 15, CAST(9.3 AS Decimal(3, 1)), CAST(N'2024-02-18T10:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (60, 86, 5, CAST(9.2 AS Decimal(3, 1)), CAST(N'2024-02-19T15:30:00.000' AS DateTime))
GO
INSERT [dbo].[ratings] ([id_rating], [id_product], [id_user], [rating], [rating_date]) VALUES (61, 86, 14, CAST(9.4 AS Decimal(3, 1)), CAST(N'2024-02-20T12:30:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ratings] OFF
GO
SET IDENTITY_INSERT [dbo].[repair_service] ON 
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (1, N'Laptop Screen Replacement', 80.0000, 3)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (2, N'Hard Disk Replacement and Data Recovery', 120.0000, 5)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (3, N'Virus and Malware Removal', 40.0000, 2)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (4, N'Laptop Keyboard Replacement', 50.0000, 2)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (5, N'Operating System Installation and Updates', 60.0000, 2)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (6, N'RAM Upgrade', 30.0000, 1)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (7, N'Data Backup and Transfer', 35.0000, 1)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (8, N'Power Jack Repair', 70.0000, 3)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (9, N'Fan and Heat Sink Cleaning', 25.0000, 1)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (10, N'Software Troubleshooting and Optimization', 45.0000, 2)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (11, N'Battery Replacement (for laptops or smartphones)', 50.0000, 2)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (12, N'Software Installation and Setup', 30.0000, 1)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (13, N'Printer Troubleshooting and Repair', 60.0000, 3)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (14, N'Data Recovery from Failed Hard Drive', 150.0000, 7)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (15, N'Dust Cleaning and Internal Component Inspection', 20.0000, 1)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (16, N'Graphics Card Upgrade', 80.0000, 3)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (17, N'Network and Wi-Fi Connectivity Issues', 40.0000, 2)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (18, N'Motherboard Repair or Replacement', 100.0000, 5)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (19, N'Software Updates and Patch Management', 25.0000, 1)
GO
INSERT [dbo].[repair_service] ([id_repair_service], [service_description], [service_price], [service_estimated_time]) VALUES (20, N'Laptop Hinge Repair', 55.0000, 2)
GO
SET IDENTITY_INSERT [dbo].[repair_service] OFF
GO
SET IDENTITY_INSERT [dbo].[reviews] ON 
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (25, 2, 5, N'Great gaming computer! Smooth performance and excellent graphics.', CAST(N'2024-01-20T10:30:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (28, 2, 6, N'Awesome build quality and powerful specs. Highly recommended.', CAST(N'2024-01-21T09:45:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (29, 2, 14, N'Impressive gaming experience. The design is also very cool.', CAST(N'2024-01-22T14:20:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (30, 3, 6, N'Excellent loudspeaker! Crisp sound quality and stylish design.', CAST(N'2024-01-23T11:10:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (31, 3, 15, N'Perfect for my home theater setup. Clear and immersive audio.', CAST(N'2024-01-24T08:55:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (32, 4, 5, N'Sleek and powerful laptop. Perfect for both work and play.', CAST(N'2024-01-25T12:40:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (33, 4, 14, N'Macintosh never disappoints. Impressive performance and durability.', CAST(N'2024-01-26T15:30:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (34, 6, 6, N'Megaport PC Gamer delivers outstanding gaming performance.', CAST(N'2024-01-27T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (35, 6, 15, N'Fast and reliable. Great value for the price.', CAST(N'2024-01-28T09:15:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (36, 9, 5, N'AMD Ryzen 5 2600 is a beast! Handles multitasking with ease.', CAST(N'2024-01-29T14:45:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (37, 9, 14, N'Impressed with the processing power. Perfect for gaming and productivity.', CAST(N'2024-01-30T11:30:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (38, 52, 5, N'MSI Motherboard LGA 1155 is a solid choice for gaming builds.', CAST(N'2024-01-31T10:20:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (39, 52, 14, N'Easy to install and configure. Great features for gaming enthusiasts.', CAST(N'2024-02-01T08:00:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (40, 53, 6, N'Intel LGA 1151 Gigabyte motherboard delivers reliable performance.', CAST(N'2024-02-02T09:45:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (41, 53, 15, N'Solid build quality and efficient design. Happy with my purchase.', CAST(N'2024-02-03T14:15:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (42, 54, 6, N'Gigabyte Technology LGA 1155 Motherboard is a great choice for overclocking.', CAST(N'2024-02-04T11:10:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (43, 54, 15, N'Stable overclocking performance. A must-have for gaming enthusiasts.', CAST(N'2024-02-05T10:30:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (44, 64, 5, N'KCAS 750W-GM S11 power supply provides reliable and efficient power.', CAST(N'2024-02-06T12:20:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (45, 64, 14, N'Good value for money. Keeps my system powered without any issues.', CAST(N'2024-02-07T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (46, 65, 6, N'AeroCool 1000W KCAS-1000M Modular Power Supply is a powerhouse.', CAST(N'2024-02-08T14:40:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (47, 65, 15, N'Efficient and stable power delivery. Perfect for high-performance setups.', CAST(N'2024-02-09T08:45:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (48, 82, 5, N'Spirit Of Gamer PRO-H5 provides crystal-clear audio. Great for gaming and streaming.', CAST(N'2024-02-10T10:15:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (49, 82, 6, N'Comfortable and immersive gaming experience with Spirit Of Gamer PRO-H5.', CAST(N'2024-02-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (50, 82, 14, N'High-quality microphone and sound. Ideal for online meetings and gaming.', CAST(N'2024-02-12T14:30:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (51, 83, 6, N'Trust Gaming Headset P09 delivers impressive surround sound. Durable build.', CAST(N'2024-02-13T11:20:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (52, 83, 15, N'Clear communication and excellent audio quality with Trust Gaming Headset P09.', CAST(N'2024-02-14T08:45:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (53, 84, 5, N'Sony Black 711 Headset offers premium noise-cancelling. Stylish and comfortable.', CAST(N'2024-02-15T12:10:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (54, 84, 14, N'Bluetooth connectivity is a game-changer. Sony Black 711 is worth the investment.', CAST(N'2024-02-16T15:00:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (55, 85, 6, N'Wireless convenience and top-notch noise-cancelling with Sony Blue 82 Headset.', CAST(N'2024-02-17T10:30:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (56, 85, 15, N'Sony Blue 82 Headset delivers a fantastic listening experience. Great for music lovers.', CAST(N'2024-02-18T09:15:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (57, 86, 5, N'Blue Beats KJLI12 provides exceptional sound quality. Stylish design and comfortable fit.', CAST(N'2024-02-19T14:45:00.000' AS DateTime))
GO
INSERT [dbo].[reviews] ([id_review], [id_product], [id_user], [comment], [review_date]) VALUES (58, 86, 14, N'Noise-cancelling feature works like a charm. Blue Beats KJLI12 is a must-have.', CAST(N'2024-02-20T11:30:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 
GO
INSERT [dbo].[roles] ([id_role], [role_title]) VALUES (1, N'admin')
GO
INSERT [dbo].[roles] ([id_role], [role_title]) VALUES (2, N'user')
GO
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[specifications] ON 
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (1, N'Processor', N'GHz')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (2, N'RAM', N'GB')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (3, N'Storage Capacity', N'TB')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (4, N'Graphics Card', N'Model')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (5, N'Connectivity', N'Ports')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (6, N'Operating System', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (7, N'Screen Size', N'Inches')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (8, N'Weight', N'Kg')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (9, N'Battery Life', N'Hours')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (10, N'Storage Type', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (11, N'Webcam Resolution', N'Megapixels')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (12, N'Keyboard Backlight', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (13, N'Cores', N'Count')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (14, N'Threads', N'Count')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (15, N'L3 Cache', N'MB')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (16, N'TDP (Thermal Design Power)', N'Watts')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (17, N'Power Output', N'Watts')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (18, N'Frequency Response', N'Hz')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (19, N'Impedance', N'Ohms')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (20, N'Speaker Type', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (22, N'Memory Type', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (23, N'Memory Speed', N'MHz')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (24, N'CAS Latency', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (25, N'Module Form Factor', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (26, N'Resolution', N'Pixels')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (27, N'Refresh Rate', N'Hz')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (28, N'Panel Type', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (29, N'Response Time', N'ms')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (30, N'Operating System Compatibility', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (31, N'Version', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (32, N'License Type', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (33, N'Supported Languages', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (34, N'Minimum System Requirements', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (35, N'Recommended System Requirements', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (36, N'Genre', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (37, N'Multiplayer Support', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (38, N'Socket Type', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (39, N'Form Factor', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (40, N'PCIe Slots', N'Count')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (41, N'RAM Slots', N'Count')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (45, N'GPU Model', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (46, N'Video Memory Capacity', N'GB')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (47, N'CUDA Cores', N'Count')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (50, N'Read Speed', N'MB/s')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (51, N'Write Speed', N'MB/s')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (52, N'Cooler Type', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (53, N'Fan Speed', N'RPM')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (54, N'Noise Level', N'dB')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (55, N'Compatible Socket Types', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (57, N'Wattage', N'Watts')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (58, N'Efficiency Rating', N'%')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (59, N'Modularity', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (60, N'Power Connector Types', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (65, N'Internal Drive Bays', N'Count')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (66, N'Front Panel Ports', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (67, N'Maximum GPU Length', N'Inches')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (79, N'DPI (Dots Per Inch)', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (80, N'Number of Buttons', N'Count')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (81, N'Connection Type', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (82, N'Key Switch Type', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (83, N'RGB Lighting', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (84, N'Microphone Type', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (85, N'Wireless Technology', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (86, N'Print Technology', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (87, N'Maximum Print Resolution', N'DPI')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (88, N'Cable Type', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (89, N'Connector Types', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (107, N'Frame Rate', N'FPS')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (108, N'Wireless Standard', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (109, N'Number of LAN Ports', N'Count')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (110, N'Surface Material', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (111, N'Dimensions', N'Inches')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (112, N'Type', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (113, N'Capacity', N'GB/TB')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (145, N'Active Area', N'Inches')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (146, N'Pressure Sensitivity', N'Levels')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (147, N'Shortcut Buttons', N'Count')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (148, N'Wireless Connectivity', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (150, N'Laptop Compartment Size', N'Inches')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (151, N'Material', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (152, N'Number of Compartments', N'Count')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (153, N'Shoulder Strap Type', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (156, N'Transfer Speed', N'MB/s')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (157, N'Power Source', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (159, N'Interface', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (160, N'Durability Rating', N'N/A')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (165, N'Scanning Resolution', N'DPI')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (166, N'Scan Speed', N'PPM')
GO
INSERT [dbo].[specifications] ([id_spec], [spec_name], [spec_measurement_unit]) VALUES (167, N'Document Feeder Capacity', N'Sheets')
GO
SET IDENTITY_INSERT [dbo].[specifications] OFF
GO
SET IDENTITY_INSERT [dbo].[stores] ON 
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (2, 2, N'PcShop despota Stefana BG', N'063-255-2525', N'08-20', NULL)
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (3, 3, N'PcShop Bulevar Mihajla Pupina BG', N'062-222-4444', N'07-22', N'09-15')
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (6, 4, N'PcShop Vojvode Stepe BG', N'061-123-1333', N'07-22', N'09-15')
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (7, 5, N'PcShop Dunavska NS', N'066-989-7563', N'08-20', N'08-20')
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (8, 6, N'PcShop Zmajev NS', N'064-123-6666', N'07-22', NULL)
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (9, 7, N'PcShop Kisačka NS', N'064-777-7777', N'09-15', N'09-15')
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (10, 8, N'PcShop Obrenovićev NI', N'066-666-6666', N'07-22', N'09-15')
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (11, 9, N'PcShop Humksa NI', N'065-123-1345', N'08-20', NULL)
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (12, 10, N'PcShop Pribojska NI', N'066-122-2222', N'08-20', NULL)
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (13, 11, N'PcShop  Zmaj Jovina KG', N'060-000-0000', N'9-15', N'09-15')
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (14, 12, N'PcShop Zagrebačka SU', N'060-122-2333', N'9-15', NULL)
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (15, 13, N'PcShop Đure Đakovića SU', N'061-777-6767', N'08-20', N'08-20')
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (16, 14, N'PcShop Cara Dušana ZR', N'060-999-8888', N'08-20', NULL)
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (17, 15, N'PcShop Lomina  ČA', N'067-777-1234', N'08-20', NULL)
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (18, 16, N'PcShop Nikole Pašića ČA', N'011-222-2222', N'09-15', N'09-15')
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (19, 17, N'PcShop Jug Bogdanova KV', N'011-165-1655', N'08-20', NULL)
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (20, 18, N'PcShop Žarka Zrenjanina PA', N'011-155-5555', N'08-20', N'09-15')
GO
INSERT [dbo].[stores] ([id_store], [id_location], [store_name], [store_contact_phone], [hourly_rate_working_days], [hourly_rate_saturday]) VALUES (21, 19, N'PcShop Dimitrija Tucovića UE', N'066-123-1111', N'07-22', N'09-15')
GO
SET IDENTITY_INSERT [dbo].[stores] OFF
GO
SET IDENTITY_INSERT [dbo].[streets] ON 
GO
INSERT [dbo].[streets] ([id_street], [street_name]) VALUES (1, N'Bulevar despota Stefana')
GO
INSERT [dbo].[streets] ([id_street], [street_name]) VALUES (2, N'Bulevar Mihajla Pupina')
GO
INSERT [dbo].[streets] ([id_street], [street_name]) VALUES (13, N'Cara Dušana')
GO
INSERT [dbo].[streets] ([id_street], [street_name]) VALUES (18, N'Dimitrija Tucovića')
GO
INSERT [dbo].[streets] ([id_street], [street_name]) VALUES (4, N'Dunavska')
GO
INSERT [dbo].[streets] ([id_street], [street_name]) VALUES (12, N'Đure Đakovića')
GO
INSERT [dbo].[streets] ([id_street], [street_name]) VALUES (8, N'Humska')
GO
INSERT [dbo].[streets] ([id_street], [street_name]) VALUES (16, N'Jug Bogdanova')
GO
INSERT [dbo].[streets] ([id_street], [street_name]) VALUES (6, N'Kisačka')
GO
INSERT [dbo].[streets] ([id_street], [street_name]) VALUES (14, N'Lomina')
GO
INSERT [dbo].[streets] ([id_street], [street_name]) VALUES (15, N'Nikole Pašića')
GO
INSERT [dbo].[streets] ([id_street], [street_name]) VALUES (7, N'Obrenovićeva')
GO
INSERT [dbo].[streets] ([id_street], [street_name]) VALUES (9, N'Pribojska')
GO
INSERT [dbo].[streets] ([id_street], [street_name]) VALUES (3, N'Vojvode Stepe')
GO
INSERT [dbo].[streets] ([id_street], [street_name]) VALUES (11, N'Zagrebačka')
GO
INSERT [dbo].[streets] ([id_street], [street_name]) VALUES (17, N'Žarka Zrenjanina')
GO
INSERT [dbo].[streets] ([id_street], [street_name]) VALUES (5, N'Zmaj Jovina')
GO
SET IDENTITY_INSERT [dbo].[streets] OFF
GO
SET IDENTITY_INSERT [dbo].[tags] ON 
GO
INSERT [dbo].[tags] ([id_tag], [tag_name]) VALUES (1, N'Best Seller')
GO
INSERT [dbo].[tags] ([id_tag], [tag_name]) VALUES (4, N'Discount')
GO
INSERT [dbo].[tags] ([id_tag], [tag_name]) VALUES (3, N'Lowest Price')
GO
INSERT [dbo].[tags] ([id_tag], [tag_name]) VALUES (2, N'New')
GO
SET IDENTITY_INSERT [dbo].[tags] OFF
GO
SET IDENTITY_INSERT [dbo].[testimonials] ON 
GO
INSERT [dbo].[testimonials] ([id_testimonial], [testimonial_date], [company_name], [customer_position], [customer_name], [review]) VALUES (1, CAST(N'2023-07-27' AS Date), N'CyberShark', N'Owner', N'Ivan Grudić', N'This company is good at handling all the request and the orders, Love it!!')
GO
INSERT [dbo].[testimonials] ([id_testimonial], [testimonial_date], [company_name], [customer_position], [customer_name], [review]) VALUES (3, CAST(N'2023-07-27' AS Date), N'TechSolutions Inc', N'Director', N'Voja Ilić', N'Thanks to PCShop, our company''s inventory management has never been smoother, and we now have more time to focus on growing our business!')
GO
INSERT [dbo].[testimonials] ([id_testimonial], [testimonial_date], [company_name], [customer_position], [customer_name], [review]) VALUES (4, CAST(N'2023-07-27' AS Date), N'CreativePrints Studio', N'Manager', N'Milica Pavalić', N'PCShop has revolutionized how we restock our supplies; it''s efficient, reliable, and an essential tool for our company''s productivity.')
GO
SET IDENTITY_INSERT [dbo].[testimonials] OFF
GO
SET IDENTITY_INSERT [dbo].[user_notifications] ON 
GO
INSERT [dbo].[user_notifications] ([id_notification], [id_user], [notification_title], [notification_content], [notification_date], [notification_read]) VALUES (1, 6, N'Poruka 1', N'Ovo je prva poruka za testing', CAST(N'2023-12-27T18:32:13.920' AS DateTime), 1)
GO
INSERT [dbo].[user_notifications] ([id_notification], [id_user], [notification_title], [notification_content], [notification_date], [notification_read]) VALUES (2, 6, N'Poruka 2 ', N'Ovo je druga prouka za testing!', CAST(N'2023-12-27T18:32:33.340' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[user_notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([id_user], [first_name], [last_name], [user_phone], [user_email], [user_password], [register_date], [id_role]) VALUES (5, N'Miroljub', N'Navaković', N'064-083-1522', N'obrad@gmail.com', N'Boba12345@', CAST(N'2023-07-06T12:49:55.437' AS DateTime), 1)
GO
INSERT [dbo].[users] ([id_user], [first_name], [last_name], [user_phone], [user_email], [user_password], [register_date], [id_role]) VALUES (6, N'Obrad', N'Pualić Radujko', N'123-123-1010', N'obra@gmail.com', N'$2b$10$7lEhX28hOitQKspqv4WeQ.E6807fsHx5KEUOb4d9jDJrgJx6WgGuG', CAST(N'2023-07-29T14:18:36.770' AS DateTime), 2)
GO
INSERT [dbo].[users] ([id_user], [first_name], [last_name], [user_phone], [user_email], [user_password], [register_date], [id_role]) VALUES (14, N'Dušan', N'Ković', N'064-122-1555', N'dusankovic@gmail.com', N'$2b$10$d4JXu8eBfgIj2u4GLpj6P.5P5M1RXZeklDPGLLszMU0sgsVb.7Ecy', CAST(N'2024-01-20T10:34:26.813' AS DateTime), 2)
GO
INSERT [dbo].[users] ([id_user], [first_name], [last_name], [user_phone], [user_email], [user_password], [register_date], [id_role]) VALUES (15, N'Borisav', N'Novčić', N'062-223-8721', N'borisavnovcic@mf.edu.rs', N'$2b$10$FZgBegg.GIuuyWAaicFF1uZs3fOzHfjDtwnYSnN62sOE3hajNAKry', CAST(N'2024-01-20T10:35:46.170' AS DateTime), 2)
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[warranties] ON 
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (15, 2, 3, N'Includes free technical support and parts replacement for 3 years. Warranty covers hardware defects and malfunctions.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (16, 3, 1, N'1-year warranty. Enjoy crisp and clear sound with our warranty coverage for one year.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (17, 4, 2, N'2-year warranty. Comprehensive coverage for your Macintosh Notebook Laptop, ensuring optimal performance.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (18, 6, 3, N'3-year warranty. Unleash the power of your Megaport PC Gamer with our extended warranty coverage.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (19, 9, 5, N'5-year warranty. Experience top-notch performance with the AMD Ryzen 5 2600 Processor, backed by a 5-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (20, 10, 2, N'2-year warranty. Elevate your gaming experience with TridentZ DDR4 16GB, covered by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (21, 13, 4, N'4-year warranty. Enjoy vibrant visuals on your Dell Computer Monitor with our extended warranty coverage.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (22, 14, 3, N'3-year warranty. Immerse yourself in stunning visuals with the Silver iMac PC Monitor, backed by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (23, 15, 3, N'3-year warranty. Dive into the world of gaming with the Predator X34 Curved Gaming Monitor and our 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (24, 16, 4, N'4-year warranty. Experience 4K HDR gaming like never before with the ROG Swift Monitor and our extended warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (25, 17, 2, N'2-year warranty. Enhance your workspace with the Gray HP flat screen monitor and enjoy peace of mind with our warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (26, 19, 3, N'3-year warranty. Elevate your computing experience with the Dell XPS All-in-One Computer Monitor, covered by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (27, 20, 1, N'1-year warranty. Protect your system with Kaspersky Anti-Virus and enjoy a worry-free digital experience for one year.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (28, 21, 0, N'No warranty. Enjoy the thrill of FIFA 22, a game that brings excitement without the need for a warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (29, 23, 2, N'2-year warranty. Keep your system cool with AeroCool cooling parts, backed by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (30, 24, 1, N'1-year warranty. Safeguard your laptop with the durable and stylish Laptop Dell Computer Bag, covered by a 1-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (31, 25, 3, N'3-year warranty. Enhance your gaming setup with the ATX Torre Computer Case, covered by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (32, 27, 4, N'4-year warranty. Experience reliable printing with the HP LaserJet Printer, backed by a 4-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (33, 28, 3, N'3-year warranty. Enjoy versatile printing options with the Epson Multi-function Printer, covered by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (34, 29, 2, N'2-year warranty. Stay connected with the TP-Link wireless modem router, backed by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (35, 30, 1, N'1-year warranty. Elevate your gaming experience with the Mouse Pad Razer, covered by a 1-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (36, 32, 1, N'1-year warranty. Store your data securely with the Black SanDisk flash drive, covered by a 1-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (37, 33, 3, N'3-year warranty. Expand your storage with the WD Elements Portable HDD, backed by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (38, 34, 4, N'4-year warranty. Safeguard your data with the WD My Book External HDD, covered by a 4-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (39, 35, 2, N'2-year warranty. Expand your storage with the Samsung Portable HDD, backed by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (40, 36, 3, N'3-year warranty. Scan your documents with precision using the Flatbed scanner A4 Epson Perfection, covered by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (41, 37, 1, N'1-year warranty. Connect your devices seamlessly with the Adapter DVI VGA connector, covered by a 1-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (42, 38, 4, N'4-year warranty. Unleash the power of the Buypower PC MC3000 Full Set with GPU GeForceGTX 1080TI, backed by a 4-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (43, 39, 3, N'3-year warranty. Experience mobility with the HP EliteBook Laptop featuring Intel Core i5, covered by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (44, 40, 2, N'2-year warranty. Elevate your computing experience with the Laptop ASUS Computer S12H2, backed by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (45, 41, 5, N'5-year warranty. Enjoy a complete computing solution with the Dell Vostro Desktop Computers H11, covered by a 5-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (46, 42, 3, N'3-year warranty. Experience high-performance computing with the Laptop Dell XPS 13-9350, covered by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (47, 44, 2, N'2-year warranty. Unleash the power of the Dell XPS Laptop XPS 11, backed by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (48, 45, 4, N'4-year warranty. Embrace versatility with the Laptop Lenovo Yoga IdeaPad, covered by a 4-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (49, 46, 3, N'3-year warranty. Immerse yourself in gaming with the Gaming Lenovo Laptop J122L, covered by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (50, 48, 2, N'2-year warranty. Experience reliable computing with the Acer Laptop XSS23, backed by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (51, 49, 1, N'1-year warranty. Build your system with the Intel LGA 1150 Motherboard MSI PCI Express, covered by a 1-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (52, 50, 2, N'2-year warranty. Enhance your system with the Intel vPro Motherboard LGA 1155 microATX, covered by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (53, 51, 3, N'3-year warranty. Build a compact system with the LGA 1151 microATX Motherboard ASUS, covered by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (54, 52, 2, N'2-year warranty. Immerse yourself in gaming with the Laptop MSI Motherboard LGA 1155 Gaming, backed by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (55, 53, 3, N'3-year warranty. Build your system with the Intel LGA 1151 Motherboard Coffee Lake Gigabyte Technology, covered by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (56, 54, 2, N'2-year warranty. Enhance your system with the Motherboard Gigabyte Technology LGA 1155, covered by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (57, 55, 3, N'3-year warranty. Immerse yourself in high-performance computing with the Intel LGA 1151 Motherboard CPU socket Land grid array, backed by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (58, 56, 4, N'4-year warranty. Unleash the power of the Z170 Premium Motherboard Z170-DELUXE Intel LGA 1151 Skylake, covered by a 4-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (59, 57, 2, N'2-year warranty. Build a compact system with the microATX Socket AM3+ Motherboard, backed by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (60, 58, 1, N'1-year warranty. Experience reliable computing with the Intel Graphics Cards & Video Adapters LGA 1150 Motherboard MSI, covered by a 1-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (61, 59, 3, N'3-year warranty. Enhance your laptop with the Laptop Dell Motherboard microATX ASUS, backed by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (62, 60, 4, N'4-year warranty. Immerse yourself in gaming with the Intel LGA 1151 Motherboard ASUS B150 PRO GAMING ATX, covered by a 4-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (63, 61, 3, N'3-year warranty. Elevate your gaming experience with the Strix H270F Gaming LGA 1151 Motherboard ASUS ATX, backed by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (64, 62, 5, N'5-year warranty. Immerse yourself in gaming with the Socket AM4 ASUS Intel Tuf Z370-PRO Gaming Socket LGA 1151 DDR4 ATX Motherboard, covered by a 5-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (65, 63, 3, N'3-year warranty. Power your system with the Sentey 750W Power Supply XX11, backed by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (66, 64, 2, N'2-year warranty. Experience reliable power with the 80 Plus Power Converters ATX KCAS, covered by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (67, 65, 4, N'4-year warranty. Power your high-performance system with the Computer Cases & Housings Power Converters 80 Plus AeroCool 1000W KCAS-1000M Modular Power Supply, backed by a 4-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (68, 66, 3, N'3-year warranty. Power your system efficiently with the Power Converters 80 Plus ATX Electric power, covered by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (69, 67, 2, N'2-year warranty. Illuminate your system with the Thermaltake Smart RGB ATX 80 PLUS, backed by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (70, 68, 3, N'3-year warranty. Experience reliable power with the 80 Plus Corsair Components ATX PCI Express, covered by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (71, 69, 4, N'4-year warranty. Power your system with the 80 Plus Corsair Components Power Converters CISCO CP-LKC, backed by a 4-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (72, 70, 2, N'2-year warranty. Experience clear video calls with the Webcam 1080p Logitech P8, covered by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (73, 71, 1, N'1-year warranty. Enhance your audio quality with the Microphone Webcam Logitech 12XS, backed by a 1-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (74, 72, 2, N'2-year warranty. Stay connected with the Webcamera RT22 USB Genius, covered by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (75, 73, 3, N'3-year warranty. Capture lifes moments with the Microsoft LifeCam Camera, G92, backed by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (76, 74, 2, N'2-year warranty. Enjoy clear video quality with the Logitech 720p B7, covered by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (77, 75, 1, N'1-year warranty. Upgrade your audio setup with the Logitech USB Desktop Microphone iT, backed by a 1-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (78, 76, 2, N'2-year warranty. Experience clear audio with the Genius Microphone L5, covered by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (79, 77, 3, N'3-year warranty. Elevate your streaming experience with the Microphone TRUST GTX 252 Emita Streaming Microphone, backed by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (80, 78, 2, N'2-year warranty. Immerse yourself in gaming audio with the Spirit of Gamer XPERT-H2 Gaming-Headset, covered by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (81, 79, 1, N'1-year warranty. Enhance your gaming setup with the Spirit of Gamer SA12 headphones, backed by a 1-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (82, 80, 3, N'3-year warranty. Immerse yourself in quality sound with the Kingston HyperX Cloud Stinger Noise-cancelling headphones, covered by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (83, 81, 2, N'2-year warranty. Enjoy immersive audio with the Kingston Hyperx Cloud Ii headphones, backed by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (84, 82, 3, N'3-year warranty. Elevate your gaming experience with the Spirit Of Gamer PRO-H5 Headset, covered by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (85, 83, 4, N'4-year warranty. Immerse yourself in 7.1 surround sound gaming with the Trust Gaming headset P09, backed by a 4-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (86, 84, 2, N'2-year warranty. Experience noise-cancelling audio with the Sony Black 711 Headset, covered by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (87, 85, 3, N'3-year warranty. Enjoy wireless freedom with the blue Sony cordless headphones, covered by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (88, 86, 2, N'2-year warranty. Immerse yourself in studio-quality audio with the blue Beats by Dr. Dre Beats Studio, covered by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (89, 87, 1, N'1-year warranty. Experience audio excellence with the JBL Black 13 Headphones, backed by a 1-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (90, 88, 3, N'3-year warranty. Immerse yourself in superior audio with the Kingston HyperX Cloud Alpha headphones, covered by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (91, 89, 2, N'2-year warranty. Elevate your gaming audio with the Spirit of Gamer Elite-H30 headphones, backed by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (92, 90, 4, N'4-year warranty. Immerse yourself in wireless 7.1 surround sound gaming with the Razer Black Headset K2, covered by a 4-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (93, 91, 3, N'3-year warranty. Experience gaming audio like never before with the Cougar Immersa Pro 7.1 RGB Gaming Headset, backed by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (94, 92, 2, N'2-year warranty. Enjoy wireless audio with the JBL T450 Headphones, covered by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (95, 93, 3, N'3-year warranty. Immerse yourself in wireless audio with the red Beats by Dr. Dre wireless headphones, backed by a 3-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (96, 94, 2, N'2-year warranty. Experience wireless audio excellence with the silver Beats by Dr. Dre wireless headphones, covered by a 2-year warranty.')
GO
INSERT [dbo].[warranties] ([id_warranty], [id_product], [warranty_duration], [warranty_terms]) VALUES (97, 95, 2, N'2-year warranty. Immerse yourself in the seamless wireless audio experience with the AirPods Headphones, covered by a 2-year warranty.')
GO
SET IDENTITY_INSERT [dbo].[warranties] OFF
GO
SET IDENTITY_INSERT [dbo].[wishlists] ON 
GO
INSERT [dbo].[wishlists] ([id_wishlist], [id_user], [wishlist_date]) VALUES (1016, 6, CAST(N'2024-01-21T10:42:57.050' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[wishlists] OFF
GO
SET IDENTITY_INSERT [dbo].[wishlists_products] ON 
GO
INSERT [dbo].[wishlists_products] ([id_wishlist_product], [id_wishlist], [id_product]) VALUES (2072, 1016, 4)
GO
INSERT [dbo].[wishlists_products] ([id_wishlist_product], [id_wishlist], [id_product]) VALUES (2073, 1016, 9)
GO
INSERT [dbo].[wishlists_products] ([id_wishlist_product], [id_wishlist], [id_product]) VALUES (2074, 1016, 19)
GO
INSERT [dbo].[wishlists_products] ([id_wishlist_product], [id_wishlist], [id_product]) VALUES (2075, 1016, 17)
GO
INSERT [dbo].[wishlists_products] ([id_wishlist_product], [id_wishlist], [id_product]) VALUES (2081, 1016, 2)
GO
INSERT [dbo].[wishlists_products] ([id_wishlist_product], [id_wishlist], [id_product]) VALUES (2084, 1016, 13)
GO
SET IDENTITY_INSERT [dbo].[wishlists_products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_brands_name]    Script Date: 6/24/2024 6:09:59 PM ******/
ALTER TABLE [dbo].[brands] ADD  CONSTRAINT [IX_brands_name] UNIQUE NONCLUSTERED 
(
	[brand_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cart_status_unique]    Script Date: 6/24/2024 6:09:59 PM ******/
ALTER TABLE [dbo].[cart_status] ADD  CONSTRAINT [IX_cart_status_unique] UNIQUE NONCLUSTERED 
(
	[cart_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_categories_name]    Script Date: 6/24/2024 6:09:59 PM ******/
ALTER TABLE [dbo].[categories] ADD  CONSTRAINT [IX_categories_name] UNIQUE NONCLUSTERED 
(
	[category_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cities_unique]    Script Date: 6/24/2024 6:09:59 PM ******/
ALTER TABLE [dbo].[cities] ADD  CONSTRAINT [IX_cities_unique] UNIQUE NONCLUSTERED 
(
	[city_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_discounts_unique]    Script Date: 6/24/2024 6:09:59 PM ******/
ALTER TABLE [dbo].[discounts] ADD  CONSTRAINT [IX_discounts_unique] UNIQUE NONCLUSTERED 
(
	[discount_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_newsletter_subscribers_email_unique]    Script Date: 6/24/2024 6:09:59 PM ******/
ALTER TABLE [dbo].[newsletter_subscribers] ADD  CONSTRAINT [IX_newsletter_subscribers_email_unique] UNIQUE NONCLUSTERED 
(
	[subscriber_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_order_status_unique]    Script Date: 6/24/2024 6:09:59 PM ******/
ALTER TABLE [dbo].[order_status] ADD  CONSTRAINT [IX_order_status_unique] UNIQUE NONCLUSTERED 
(
	[order_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Payment_types_unique]    Script Date: 6/24/2024 6:09:59 PM ******/
ALTER TABLE [dbo].[payment_types] ADD  CONSTRAINT [IX_Payment_types_unique] UNIQUE NONCLUSTERED 
(
	[payment_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_product_images_src_unique]    Script Date: 6/24/2024 6:09:59 PM ******/
ALTER TABLE [dbo].[product_images] ADD  CONSTRAINT [IX_product_images_src_unique] UNIQUE NONCLUSTERED 
(
	[src] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_products_name]    Script Date: 6/24/2024 6:09:59 PM ******/
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [IX_products_name] UNIQUE NONCLUSTERED 
(
	[product_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_roles_unique]    Script Date: 6/24/2024 6:09:59 PM ******/
ALTER TABLE [dbo].[roles] ADD  CONSTRAINT [IX_roles_unique] UNIQUE NONCLUSTERED 
(
	[role_title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_specifications]    Script Date: 6/24/2024 6:09:59 PM ******/
ALTER TABLE [dbo].[specifications] ADD  CONSTRAINT [IX_specifications] UNIQUE NONCLUSTERED 
(
	[spec_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_streets_unique]    Script Date: 6/24/2024 6:09:59 PM ******/
ALTER TABLE [dbo].[streets] ADD  CONSTRAINT [IX_streets_unique] UNIQUE NONCLUSTERED 
(
	[street_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tags_unique]    Script Date: 6/24/2024 6:09:59 PM ******/
ALTER TABLE [dbo].[tags] ADD  CONSTRAINT [IX_tags_unique] UNIQUE NONCLUSTERED 
(
	[tag_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Users_email_unique]    Script Date: 6/24/2024 6:09:59 PM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [Users_email_unique] UNIQUE NONCLUSTERED 
(
	[user_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[carts] ADD  CONSTRAINT [DF_carts_cart_price]  DEFAULT ((0)) FOR [cart_price]
GO
ALTER TABLE [dbo].[categories] ADD  CONSTRAINT [DF_categories_popular]  DEFAULT ((0)) FOR [popular]
GO
ALTER TABLE [dbo].[featured_products] ADD  CONSTRAINT [DF_featured_products_featured_date_from]  DEFAULT (getdate()) FOR [featured_date_from]
GO
ALTER TABLE [dbo].[logins] ADD  CONSTRAINT [DF_logins_login_date]  DEFAULT (getdate()) FOR [login_date]
GO
ALTER TABLE [dbo].[messages] ADD  CONSTRAINT [DF_messages_message_read]  DEFAULT ((0)) FOR [message_read]
GO
ALTER TABLE [dbo].[newsletter_subscribers] ADD  CONSTRAINT [DF_newsletter_subscribers_subscriber_status]  DEFAULT ((1)) FOR [subscriber_status]
GO
ALTER TABLE [dbo].[orders] ADD  CONSTRAINT [DF_orders_order_date]  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[prices] ADD  CONSTRAINT [DF_prices_price_date_from]  DEFAULT (getdate()) FOR [price_date_from]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF_products_product_obtained_date]  DEFAULT (getdate()) FOR [product_obtained_date]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF_products_avg_raiting]  DEFAULT ((0)) FOR [avg_rating]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF_products_count_comments]  DEFAULT ((0)) FOR [count_reviews]
GO
ALTER TABLE [dbo].[products_tags] ADD  CONSTRAINT [DF_products_tags_product_tag_date_from]  DEFAULT (getdate()) FOR [product_tag_date_from]
GO
ALTER TABLE [dbo].[products_tags] ADD  CONSTRAINT [DF_products_tags_product_tag_active]  DEFAULT ((1)) FOR [product_tag_active]
GO
ALTER TABLE [dbo].[ratings] ADD  CONSTRAINT [DF_raitings_raiting_date]  DEFAULT (getdate()) FOR [rating_date]
GO
ALTER TABLE [dbo].[reviews] ADD  CONSTRAINT [DF_reviews_review_date]  DEFAULT (getdate()) FOR [review_date]
GO
ALTER TABLE [dbo].[survey_questions] ADD  CONSTRAINT [DF_survey_questions_survey_votes]  DEFAULT ((0)) FOR [survey_votes]
GO
ALTER TABLE [dbo].[testimonials] ADD  CONSTRAINT [DF_testimonials_testimonial_date]  DEFAULT (getdate()) FOR [testimonial_date]
GO
ALTER TABLE [dbo].[user_notifications] ADD  CONSTRAINT [DF_user_notifications_notification_date]  DEFAULT (getdate()) FOR [notification_date]
GO
ALTER TABLE [dbo].[user_notifications] ADD  CONSTRAINT [DF_user_notifications_notification_read]  DEFAULT ((0)) FOR [notification_read]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_register_date]  DEFAULT (getdate()) FOR [register_date]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_id_role]  DEFAULT ((2)) FOR [id_role]
GO
ALTER TABLE [dbo].[wishlists] ADD  CONSTRAINT [DF_wishlists_wishlist_date]  DEFAULT (getdate()) FOR [wishlist_date]
GO
ALTER TABLE [dbo].[cart_items]  WITH CHECK ADD  CONSTRAINT [FK_cart_items_cart] FOREIGN KEY([id_cart])
REFERENCES [dbo].[carts] ([id_cart])
GO
ALTER TABLE [dbo].[cart_items] CHECK CONSTRAINT [FK_cart_items_cart]
GO
ALTER TABLE [dbo].[cart_items]  WITH CHECK ADD  CONSTRAINT [FK_cart_items_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id_product])
GO
ALTER TABLE [dbo].[cart_items] CHECK CONSTRAINT [FK_cart_items_products]
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD  CONSTRAINT [FK_carts_cart_status] FOREIGN KEY([id_cart_status])
REFERENCES [dbo].[cart_status] ([id_cart_status])
GO
ALTER TABLE [dbo].[carts] CHECK CONSTRAINT [FK_carts_cart_status]
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD  CONSTRAINT [FK_carts_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
GO
ALTER TABLE [dbo].[carts] CHECK CONSTRAINT [FK_carts_users]
GO
ALTER TABLE [dbo].[cat_brands]  WITH CHECK ADD  CONSTRAINT [FK_cat_brands_brands] FOREIGN KEY([id_brand])
REFERENCES [dbo].[brands] ([id_brand])
GO
ALTER TABLE [dbo].[cat_brands] CHECK CONSTRAINT [FK_cat_brands_brands]
GO
ALTER TABLE [dbo].[cat_brands]  WITH CHECK ADD  CONSTRAINT [FK_cat_brands_categories] FOREIGN KEY([id_category])
REFERENCES [dbo].[categories] ([id_category])
GO
ALTER TABLE [dbo].[cat_brands] CHECK CONSTRAINT [FK_cat_brands_categories]
GO
ALTER TABLE [dbo].[categories]  WITH CHECK ADD  CONSTRAINT [FK_categories_categories_parent] FOREIGN KEY([id_cat_parent])
REFERENCES [dbo].[categories] ([id_category])
GO
ALTER TABLE [dbo].[categories] CHECK CONSTRAINT [FK_categories_categories_parent]
GO
ALTER TABLE [dbo].[category_images]  WITH CHECK ADD  CONSTRAINT [FK_category_images_categories] FOREIGN KEY([id_category])
REFERENCES [dbo].[categories] ([id_category])
GO
ALTER TABLE [dbo].[category_images] CHECK CONSTRAINT [FK_category_images_categories]
GO
ALTER TABLE [dbo].[compatibilities]  WITH CHECK ADD  CONSTRAINT [FK_compatibilities_compatible_products] FOREIGN KEY([id_compatible_product])
REFERENCES [dbo].[products] ([id_product])
GO
ALTER TABLE [dbo].[compatibilities] CHECK CONSTRAINT [FK_compatibilities_compatible_products]
GO
ALTER TABLE [dbo].[compatibilities]  WITH CHECK ADD  CONSTRAINT [FK_compatibilities_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id_product])
GO
ALTER TABLE [dbo].[compatibilities] CHECK CONSTRAINT [FK_compatibilities_products]
GO
ALTER TABLE [dbo].[discount_durations]  WITH CHECK ADD  CONSTRAINT [FK_discount_durations_discounts] FOREIGN KEY([id_discount])
REFERENCES [dbo].[discounts] ([id_discount])
GO
ALTER TABLE [dbo].[discount_durations] CHECK CONSTRAINT [FK_discount_durations_discounts]
GO
ALTER TABLE [dbo].[discount_prices]  WITH CHECK ADD  CONSTRAINT [FK_discount_prices_discount_durations] FOREIGN KEY([id_discount_duration])
REFERENCES [dbo].[discount_durations] ([id_discount_duration])
GO
ALTER TABLE [dbo].[discount_prices] CHECK CONSTRAINT [FK_discount_prices_discount_durations]
GO
ALTER TABLE [dbo].[discount_prices]  WITH CHECK ADD  CONSTRAINT [FK_discount_prices_prices] FOREIGN KEY([id_price])
REFERENCES [dbo].[prices] ([id_price])
GO
ALTER TABLE [dbo].[discount_prices] CHECK CONSTRAINT [FK_discount_prices_prices]
GO
ALTER TABLE [dbo].[featured_products]  WITH CHECK ADD  CONSTRAINT [FK_featured_products_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id_product])
GO
ALTER TABLE [dbo].[featured_products] CHECK CONSTRAINT [FK_featured_products_products]
GO
ALTER TABLE [dbo].[locations]  WITH CHECK ADD  CONSTRAINT [FK_locations_cities] FOREIGN KEY([id_city])
REFERENCES [dbo].[cities] ([id_city])
GO
ALTER TABLE [dbo].[locations] CHECK CONSTRAINT [FK_locations_cities]
GO
ALTER TABLE [dbo].[locations]  WITH CHECK ADD  CONSTRAINT [FK_locations_streets] FOREIGN KEY([id_street])
REFERENCES [dbo].[streets] ([id_street])
GO
ALTER TABLE [dbo].[locations] CHECK CONSTRAINT [FK_locations_streets]
GO
ALTER TABLE [dbo].[logins]  WITH CHECK ADD  CONSTRAINT [FK_logins_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
GO
ALTER TABLE [dbo].[logins] CHECK CONSTRAINT [FK_logins_users]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_carts] FOREIGN KEY([id_cart])
REFERENCES [dbo].[carts] ([id_cart])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_carts]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_cities] FOREIGN KEY([id_city])
REFERENCES [dbo].[cities] ([id_city])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_cities]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_order_status] FOREIGN KEY([id_order_status])
REFERENCES [dbo].[order_status] ([id_order_status])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_order_status]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_payment_types] FOREIGN KEY([id_payment_type])
REFERENCES [dbo].[payment_types] ([id_payment_type])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_payment_types]
GO
ALTER TABLE [dbo].[prices]  WITH CHECK ADD  CONSTRAINT [FK_prices_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id_product])
GO
ALTER TABLE [dbo].[prices] CHECK CONSTRAINT [FK_prices_products]
GO
ALTER TABLE [dbo].[product_images]  WITH CHECK ADD  CONSTRAINT [FK_product_images_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id_product])
GO
ALTER TABLE [dbo].[product_images] CHECK CONSTRAINT [FK_product_images_products]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_cat_brands] FOREIGN KEY([id_cat_brand])
REFERENCES [dbo].[cat_brands] ([id_cat_brand])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_cat_brands]
GO
ALTER TABLE [dbo].[products_specifications]  WITH CHECK ADD  CONSTRAINT [FK_products_specifications_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id_product])
GO
ALTER TABLE [dbo].[products_specifications] CHECK CONSTRAINT [FK_products_specifications_products]
GO
ALTER TABLE [dbo].[products_specifications]  WITH CHECK ADD  CONSTRAINT [FK_products_specifications_specifications] FOREIGN KEY([id_spec])
REFERENCES [dbo].[specifications] ([id_spec])
GO
ALTER TABLE [dbo].[products_specifications] CHECK CONSTRAINT [FK_products_specifications_specifications]
GO
ALTER TABLE [dbo].[products_tags]  WITH CHECK ADD  CONSTRAINT [FK_products_tags_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id_product])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[products_tags] CHECK CONSTRAINT [FK_products_tags_products]
GO
ALTER TABLE [dbo].[products_tags]  WITH CHECK ADD  CONSTRAINT [FK_products_tags_tags] FOREIGN KEY([id_tag])
REFERENCES [dbo].[tags] ([id_tag])
GO
ALTER TABLE [dbo].[products_tags] CHECK CONSTRAINT [FK_products_tags_tags]
GO
ALTER TABLE [dbo].[ratings]  WITH CHECK ADD  CONSTRAINT [FK_ratings_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id_product])
GO
ALTER TABLE [dbo].[ratings] CHECK CONSTRAINT [FK_ratings_products]
GO
ALTER TABLE [dbo].[ratings]  WITH CHECK ADD  CONSTRAINT [FK_ratings_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
GO
ALTER TABLE [dbo].[ratings] CHECK CONSTRAINT [FK_ratings_users]
GO
ALTER TABLE [dbo].[rent_offer_pictures]  WITH CHECK ADD  CONSTRAINT [FK_rent_offer_pictures_rent_offers] FOREIGN KEY([id_rent_offer])
REFERENCES [dbo].[rent_offers] ([id_rent_offer])
GO
ALTER TABLE [dbo].[rent_offer_pictures] CHECK CONSTRAINT [FK_rent_offer_pictures_rent_offers]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK_reviews_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id_product])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK_reviews_products]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK_reviews_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK_reviews_users]
GO
ALTER TABLE [dbo].[stores]  WITH CHECK ADD  CONSTRAINT [FK_stores_locations] FOREIGN KEY([id_location])
REFERENCES [dbo].[locations] ([id_location])
GO
ALTER TABLE [dbo].[stores] CHECK CONSTRAINT [FK_stores_locations]
GO
ALTER TABLE [dbo].[supplies]  WITH CHECK ADD  CONSTRAINT [FK_supplies_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id_product])
GO
ALTER TABLE [dbo].[supplies] CHECK CONSTRAINT [FK_supplies_products]
GO
ALTER TABLE [dbo].[supplies]  WITH CHECK ADD  CONSTRAINT [FK_supplies_stores] FOREIGN KEY([id_store])
REFERENCES [dbo].[stores] ([id_store])
GO
ALTER TABLE [dbo].[supplies] CHECK CONSTRAINT [FK_supplies_stores]
GO
ALTER TABLE [dbo].[survey_questions]  WITH CHECK ADD  CONSTRAINT [FK_survey_questions_surveys] FOREIGN KEY([id_survey])
REFERENCES [dbo].[surveys] ([id_survey])
GO
ALTER TABLE [dbo].[survey_questions] CHECK CONSTRAINT [FK_survey_questions_surveys]
GO
ALTER TABLE [dbo].[survey_reviews]  WITH CHECK ADD  CONSTRAINT [FK_survey_reviews_survey_questions] FOREIGN KEY([id_survey_question])
REFERENCES [dbo].[survey_questions] ([id_survey_question])
GO
ALTER TABLE [dbo].[survey_reviews] CHECK CONSTRAINT [FK_survey_reviews_survey_questions]
GO
ALTER TABLE [dbo].[survey_reviews]  WITH CHECK ADD  CONSTRAINT [FK_survey_reviews_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
GO
ALTER TABLE [dbo].[survey_reviews] CHECK CONSTRAINT [FK_survey_reviews_users]
GO
ALTER TABLE [dbo].[user_notifications]  WITH CHECK ADD  CONSTRAINT [FK_user_notifications_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
GO
ALTER TABLE [dbo].[user_notifications] CHECK CONSTRAINT [FK_user_notifications_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_roles] FOREIGN KEY([id_role])
REFERENCES [dbo].[roles] ([id_role])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_roles]
GO
ALTER TABLE [dbo].[warranties]  WITH CHECK ADD  CONSTRAINT [FK_warranties_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id_product])
GO
ALTER TABLE [dbo].[warranties] CHECK CONSTRAINT [FK_warranties_products]
GO
ALTER TABLE [dbo].[wishlists]  WITH CHECK ADD  CONSTRAINT [FK_wishlists_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
GO
ALTER TABLE [dbo].[wishlists] CHECK CONSTRAINT [FK_wishlists_users]
GO
ALTER TABLE [dbo].[wishlists_products]  WITH CHECK ADD  CONSTRAINT [FK_wishlists_products_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id_product])
GO
ALTER TABLE [dbo].[wishlists_products] CHECK CONSTRAINT [FK_wishlists_products_products]
GO
ALTER TABLE [dbo].[wishlists_products]  WITH CHECK ADD  CONSTRAINT [FK_wishlists_products_wishlists] FOREIGN KEY([id_wishlist])
REFERENCES [dbo].[wishlists] ([id_wishlist])
GO
ALTER TABLE [dbo].[wishlists_products] CHECK CONSTRAINT [FK_wishlists_products_wishlists]
GO
ALTER TABLE [dbo].[cart_items]  WITH CHECK ADD  CONSTRAINT [CK_Cart_items_amount] CHECK  (([amount]>(0)))
GO
ALTER TABLE [dbo].[cart_items] CHECK CONSTRAINT [CK_Cart_items_amount]
GO
ALTER TABLE [dbo].[cart_items]  WITH CHECK ADD  CONSTRAINT [CK_Cart_items_price] CHECK  (([item_price]>(0)))
GO
ALTER TABLE [dbo].[cart_items] CHECK CONSTRAINT [CK_Cart_items_price]
GO
ALTER TABLE [dbo].[featured_products]  WITH CHECK ADD  CONSTRAINT [CK_featured_products_priority] CHECK  (([priority]>=(1) AND [priority]<=(10)))
GO
ALTER TABLE [dbo].[featured_products] CHECK CONSTRAINT [CK_featured_products_priority]
GO
ALTER TABLE [dbo].[ratings]  WITH CHECK ADD  CONSTRAINT [CK_ratings_rating] CHECK  (([rating]>=(0.1) AND [rating]<=(10.0)))
GO
ALTER TABLE [dbo].[ratings] CHECK CONSTRAINT [CK_ratings_rating]
GO
ALTER TABLE [dbo].[rent_offers]  WITH CHECK ADD  CONSTRAINT [CK_rent_offers_financial] CHECK  (([financial_offer]>(0)))
GO
ALTER TABLE [dbo].[rent_offers] CHECK CONSTRAINT [CK_rent_offers_financial]
GO
ALTER TABLE [dbo].[rent_offers]  WITH CHECK ADD  CONSTRAINT [CK_rent_offers_phone] CHECK  (([contact_phone] like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[rent_offers] CHECK CONSTRAINT [CK_rent_offers_phone]
GO
ALTER TABLE [dbo].[rent_offers]  WITH CHECK ADD  CONSTRAINT [CK_rent_offers_square_footage] CHECK  (([square_footage]>=(70) AND [square_footage]<=(200)))
GO
ALTER TABLE [dbo].[rent_offers] CHECK CONSTRAINT [CK_rent_offers_square_footage]
GO
ALTER TABLE [dbo].[stores]  WITH CHECK ADD  CONSTRAINT [CK_stores_contact_phone] CHECK  (([store_contact_phone] like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[stores] CHECK CONSTRAINT [CK_stores_contact_phone]
GO
ALTER TABLE [dbo].[supplies]  WITH CHECK ADD  CONSTRAINT [CK_supplies_quantity] CHECK  (([quantity]>(-1)))
GO
ALTER TABLE [dbo].[supplies] CHECK CONSTRAINT [CK_supplies_quantity]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [CK_user_phone] CHECK  (([user_phone] like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [CK_user_phone]
GO
ALTER TABLE [dbo].[warranties]  WITH CHECK ADD  CONSTRAINT [CK_warranties_duration] CHECK  (([warranty_duration]>=(0) AND [warranty_duration]<=(10)))
GO
ALTER TABLE [dbo].[warranties] CHECK CONSTRAINT [CK_warranties_duration]
GO
/****** Object:  Trigger [dbo].[UpdateCartPrice]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[UpdateCartPrice]
   ON  [dbo].[cart_items]
   AFTER INSERT, DELETE, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     IF EXISTS(SELECT * FROM inserted)
    BEGIN
        UPDATE c
        SET cart_price = (SELECT SUM(item_price) FROM cart_items WHERE id_cart = c.id_cart)
        FROM carts c
        INNER JOIN inserted i ON c.id_cart = i.id_cart;
    END;

    IF EXISTS(SELECT * FROM deleted)
    BEGIN
        UPDATE c
        SET cart_price = (SELECT SUM(item_price) FROM cart_items WHERE id_cart = c.id_cart)
        FROM carts c
        INNER JOIN deleted d ON c.id_cart = d.id_cart;
    END;

END
GO
ALTER TABLE [dbo].[cart_items] ENABLE TRIGGER [UpdateCartPrice]
GO
/****** Object:  Trigger [dbo].[UpdateItemPrice]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[UpdateItemPrice]
   ON  [dbo].[cart_items]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	UPDATE ci
	SET ci.item_price = ISNULL(dpr.discount_price, pp.product_price) * ci.amount
	FROM cart_items ci
	INNER JOIN products p ON ci.id_product = p.id_product
	LEFT JOIN prices pp ON p.id_product = pp.id_product AND (pp.price_date_till IS NULL)
	LEFT JOIN discount_prices dpr ON pp.id_price = dpr.id_price
	LEFT JOIN discount_durations dd ON dpr.id_discount_duration = dd.id_discount_duration AND dd.discount_date_from <= GETDATE() AND dd.discount_date_till > GETDATE()
	INNER JOIN inserted i ON ci.id_item = i.id_item;
END
GO
ALTER TABLE [dbo].[cart_items] ENABLE TRIGGER [UpdateItemPrice]
GO
/****** Object:  Trigger [dbo].[NewDiscountPrice]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[NewDiscountPrice]
   ON  [dbo].[discount_prices]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Declare variables
    DECLARE @idPrice INT, @idDiscountDuration INT, @productId INT, @discountDateTill DATE, @producTagExists BIT;

    -- Get the newly inserted 'id_price' and 'id_discount_duration' from the 'INSERTED' table
    SELECT @idPrice = id_price, @idDiscountDuration = id_discount_duration FROM INSERTED;

    -- Get the 'id_product' associated with the 'id_price'
    SELECT @productId = id_product FROM prices WHERE id_price = @idPrice;

    -- Check if the 'id_product' exists in the 'products' table
    IF NOT EXISTS (SELECT 1 FROM products WHERE id_product = @productId)
        RETURN; -- The product associated with the discount price doesn't exist, so exit the trigger.

	-- Get the 'discount_date_till' from 'discount_duration' table
    SELECT @discountDateTill = discount_date_till FROM discount_durations WHERE id_discount_duration = @idDiscountDuration;

	-- Check if there's already a tag with ID 4 associated with the product in 'products_tags'
    SELECT @producTagExists = CASE WHEN EXISTS (
            SELECT 1 
            FROM products_tags 
            WHERE id_product = @productId AND id_tag = 4
        ) THEN 1 ELSE 0 END;
	
	-- If the tag exists, update the older instance and set product_tag_active to false
    IF @producTagExists = 1
    BEGIN
        UPDATE products_tags
        SET product_tag_active = 0
        WHERE id_product = @productId AND id_tag = 4;
    END

	-- Insert a new instance in 'products_tags' with tag ID 4 and dates
	INSERT INTO products_tags (id_product, id_tag, product_tag_date_from, product_tag_date_till, product_tag_active)
	VALUES (@productId, 4, GETDATE(), @discountDateTill, 1); 

END
GO
ALTER TABLE [dbo].[discount_prices] ENABLE TRIGGER [NewDiscountPrice]
GO
/****** Object:  Trigger [dbo].[UpdateDiscountPrices]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[UpdateDiscountPrices]
   ON  [dbo].[discount_prices]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @productPrice MONEY;
	DECLARE @discountPrice MONEY;
	DECLARE @saved MONEY;

	SELECT @productPrice = product_price
	FROM prices
	WHERE id_price = (SELECT id_price FROM inserted);

	SET	@discountPrice = @productPrice - (@productPrice * (SELECT discount_value FROM inserted) / 100);
	SET @saved = @productPrice - @discountPrice;

	UPDATE discount_prices
	SET discount_price = @discountPrice, saved = @saved
	WHERE id_discount_price = (SELECT id_discount_price FROM inserted);

END
GO
ALTER TABLE [dbo].[discount_prices] ENABLE TRIGGER [UpdateDiscountPrices]
GO
/****** Object:  Trigger [dbo].[UpdateDiscountPricesOnProductPriceChange]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[UpdateDiscountPricesOnProductPriceChange]
   ON  [dbo].[prices]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

	DECLARE @idPrice INT;
    DECLARE @productPrice MONEY;
    DECLARE @discountPrice MONEY;
    DECLARE @saved MONEY;
	DECLARE @discountValue TINYINT;

	SELECT @idPrice = id_price, @productPrice = product_price
    FROM inserted;

	SELECT @discountValue = discount_value
    FROM discount_prices
    WHERE id_price = @idPrice;

	SET @discountPrice = @productPrice - (@productPrice * @discountValue / 100);
    SET @saved = @productPrice - @discountPrice;

	UPDATE discount_prices
    SET discount_price = @discountPrice, saved = @saved
    WHERE id_price = @idPrice;

END
GO
ALTER TABLE [dbo].[prices] ENABLE TRIGGER [UpdateDiscountPricesOnProductPriceChange]
GO
/****** Object:  Trigger [dbo].[product_tag_Product_obrained]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[product_tag_Product_obrained]
   ON  [dbo].[products]
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	 -- Check if the 'product_obtained' column is updated or not
    IF NOT UPDATE(product_obtained_date)
        RETURN;
		
	 -- Find the 'id_tag' associated with the tag name 'new'
    DECLARE @tagId INT, @producTagExists BIT, @productId INT;

    SELECT @tagId= id_tag FROM tags WHERE tag_name = 'New';


	SELECT @productId = id_product FROM inserted;
	-- Check if there's already a tag with ID 4 associated with the product in 'products_tags'
    SELECT @producTagExists = CASE WHEN EXISTS (
            SELECT 1 
            FROM products_tags 
            WHERE id_product = @productId AND id_tag = @tagId
        ) THEN 1 ELSE 0 END;
	
	-- If the tag exists, update the older instance and set product_tag_active to false
    IF @producTagExists = 1
    BEGIN
        UPDATE products_tags
        SET product_tag_active = 0
        WHERE id_product = @productId AND id_tag = @tagId;
    END



    -- Insert a new instance into 'products_tags' table
    INSERT INTO products_tags (id_product, id_tag, product_tag_date_from, product_tag_date_till, product_tag_active)
    SELECT id_product, @tagId, product_obtained_date, DATEADD(MONTH, 2, product_obtained_date), 1
    FROM INSERTED;


END
GO
ALTER TABLE [dbo].[products] ENABLE TRIGGER [product_tag_Product_obrained]
GO
/****** Object:  Trigger [dbo].[UpdateAvgRating]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[UpdateAvgRating]
   ON  [dbo].[ratings]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @idProduct INT;
	DECLARE @avgRating DECIMAL(3,1);

	SELECT @idProduct = id_product
	FROM inserted;

	SELECT @avgRating = AVG(rating)
	FROM ratings
	WHERE id_product = @idProduct;

	UPDATE products
	SET avg_rating = @avgRating
	WHERE id_product = @idProduct;

END
GO
ALTER TABLE [dbo].[ratings] ENABLE TRIGGER [UpdateAvgRating]
GO
/****** Object:  Trigger [dbo].[UpdateCountReviews]    Script Date: 6/24/2024 6:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[UpdateCountReviews]
   ON  [dbo].[reviews] 
   AFTER INSERT,DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

	IF EXISTS(SELECT 1 FROM inserted)
		BEGIN
			UPDATE products
			SET count_reviews = count_reviews + 1
			WHERE id_product = (SELECT id_product FROM inserted);
		END

	IF EXISTS(SELECT 1 FROM deleted)
		BEGIN
			UPDATE products
			SET count_reviews = count_reviews - 1
			WHERE id_product = (SELECT id_product FROM deleted);
		END
END
GO
ALTER TABLE [dbo].[reviews] ENABLE TRIGGER [UpdateCountReviews]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique brand name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'brands', @level2type=N'CONSTRAINT',@level2name=N'IX_brands_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'amount > 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cart_items', @level2type=N'CONSTRAINT',@level2name=N'CK_Cart_items_amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'price > 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cart_items', @level2type=N'CONSTRAINT',@level2name=N'CK_Cart_items_price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique cart status' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cart_status', @level2type=N'CONSTRAINT',@level2name=N'IX_cart_status_unique'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique category name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'categories', @level2type=N'CONSTRAINT',@level2name=N'IX_categories_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique names' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cities', @level2type=N'CONSTRAINT',@level2name=N'IX_cities_unique'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique discounts' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'discounts', @level2type=N'CONSTRAINT',@level2name=N'IX_discounts_unique'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Priority between 1 and 10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'featured_products', @level2type=N'CONSTRAINT',@level2name=N'CK_featured_products_priority'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique subscriber email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'newsletter_subscribers', @level2type=N'CONSTRAINT',@level2name=N'IX_newsletter_subscribers_email_unique'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'order_status unique' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'order_status', @level2type=N'CONSTRAINT',@level2name=N'IX_order_status_unique'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique payment types' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'payment_types', @level2type=N'CONSTRAINT',@level2name=N'IX_Payment_types_unique'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique image src' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_images', @level2type=N'CONSTRAINT',@level2name=N'IX_product_images_src_unique'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique product name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'products', @level2type=N'CONSTRAINT',@level2name=N'IX_products_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'rating between 0.1 and 10.0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ratings', @level2type=N'CONSTRAINT',@level2name=N'CK_ratings_rating'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'above 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rent_offers', @level2type=N'CONSTRAINT',@level2name=N'CK_rent_offers_financial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'format: ###-###-####' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rent_offers', @level2type=N'CONSTRAINT',@level2name=N'CK_rent_offers_phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'between 70-200' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rent_offers', @level2type=N'CONSTRAINT',@level2name=N'CK_rent_offers_square_footage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique roles' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'roles', @level2type=N'CONSTRAINT',@level2name=N'IX_roles_unique'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'format: ###-###-####' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'stores', @level2type=N'CONSTRAINT',@level2name=N'CK_stores_contact_phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique streets' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'streets', @level2type=N'CONSTRAINT',@level2name=N'IX_streets_unique'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantity > -1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'supplies', @level2type=N'CONSTRAINT',@level2name=N'CK_supplies_quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'tags unique' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tags', @level2type=N'CONSTRAINT',@level2name=N'IX_tags_unique'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'format: ###-###-####' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'users', @level2type=N'CONSTRAINT',@level2name=N'CK_user_phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Duration between 1 and 10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'warranties', @level2type=N'CONSTRAINT',@level2name=N'CK_warranties_duration'
GO
