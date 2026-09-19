SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [swiggy_project].[fact_orders](
	[order_id] [int] NULL,
	[date_id] [int] NULL,
	[location_id] [int] NULL,
	[restaurant_id] [int] NULL,
	[food_id] [int] NULL,
	[price] [float] NULL,
	[rating] [float] NULL,
	[rating_count] [int] NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED COLUMNSTORE INDEX [ClusteredIndex] ON [swiggy_project].[fact_orders] WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [swiggy_project].[dim_restaurant](
	[restaurant_id] [int] NULL,
	[restaurant_name] [varchar](8000) NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED COLUMNSTORE INDEX [ClusteredIndex] ON [swiggy_project].[dim_restaurant] WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [swiggy_project].[dim_location](
	[location_id] [int] NULL,
	[state] [varchar](8000) NULL,
	[city] [varchar](8000) NULL,
	[location] [varchar](8000) NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED COLUMNSTORE INDEX [ClusteredIndex] ON [swiggy_project].[dim_location] WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [swiggy_project].[dim_dish](
	[dish_id] [int] NULL,
	[category] [varchar](8000) NULL,
	[dish_name] [varchar](8000) NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED COLUMNSTORE INDEX [ClusteredIndex] ON [swiggy_project].[dim_dish] WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [swiggy_project].[dim_date](
	[date_id] [int] NULL,
	[order_date] [varchar](8000) NULL,
	[order_date_new] [date] NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED COLUMNSTORE INDEX [ClusteredIndex] ON [swiggy_project].[dim_date] WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0) ON [PRIMARY]
GO