
create or alter procedure bronze.load_bronze as 
begin
	
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
	begin try 

		SET @batch_start_time = GETDATE();

		PRINT '================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '================================================';

		PRINT '------------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '------------------------------------------------';


    set @start_time = GETDATE();
	PRINT '>> Truncating Table: crm_cust_info';
	truncate table bronze.crm_cust_info
	PRINT '>> Inserting Data Into: crm_cust_info';
	Bulk insert bronze.crm_cust_info
	from 'C:\Users\ANIKET SOLANKI\OneDrive - UTS\Desktop\projects\Data warehouse and analytics\datasets\source_crm\cust_info.csv'
	with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
	);
	set @end_time = GETDATE();
	print '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time , @end_time ) as NVARCHAR) + ' seconds ';
	print '>> -----------------------';
	print ' ' ;


	set @start_time = GETDATE();
	PRINT '>> Truncating Table: crm_prd_info';
	truncate table bronze.crm_prd_info
	PRINT '>> Inserting Data Into: crm_prd_info';
	bulk insert bronze.crm_prd_info
	from 'C:\Users\ANIKET SOLANKI\OneDrive - UTS\Desktop\projects\Data warehouse and analytics\datasets\source_crm\prd_info.csv'
	with (
	firstrow = 2,
	fieldterminator = ',',
	tablock
	);
	print '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time , @end_time ) as NVARCHAR) + ' seconds ';
	print '>> -----------------------';
	print ' ';

	set @start_time = GETDATE();
	PRINT '>> Truncating Table: crm_sales_details ';
	truncate table bronze.crm_sales_details
	PRINT '>> Inserting Data Into: crm_sales_details';
	bulk insert bronze.crm_sales_details
	from 'C:\Users\ANIKET SOLANKI\OneDrive - UTS\Desktop\projects\Data warehouse and analytics\datasets\source_crm\sales_details.csv'
	with (

	firstrow = 2,
	fieldterminator = ',',
	tablock
	);
	print '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time , @end_time ) as NVARCHAR) + ' seconds ';
	print '>> -----------------------';
	print ' ' ;



	    PRINT '------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '------------------------------------------------';
	set @start_time = GETDATE();	
    PRINT '>> Truncating Table: bronze.erp_cust_az12';
	truncate table bronze.erp_cust_az12
	PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
	bulk insert bronze.erp_cust_az12
	from 'C:\Users\ANIKET SOLANKI\OneDrive - UTS\Desktop\projects\Data warehouse and analytics\datasets\source_erp\CUST_AZ12.csv'
	with (
	firstrow = 2,
	fieldterminator = ',',
	tablock
	);
	print '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time , @end_time ) as NVARCHAR) + ' seconds ';
	print '>> -----------------------';
	print ' ' ;

	set @start_time = GETDATE();
	PRINT '>> Truncating Table: bronze.erp_loc_a101';
	truncate table bronze.erp_loc_a101
	PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
	bulk insert bronze.erp_loc_a101
	from 'C:\Users\ANIKET SOLANKI\OneDrive - UTS\Desktop\projects\Data warehouse and analytics\datasets\source_erp\LOC_A101.csv'
	with (
	firstrow = 2,
	fieldterminator = ',',
	tablock
	);
	print '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time , @end_time ) as NVARCHAR) + ' seconds ';
	print '>> -----------------------';
	print ' ' ;



	set @start_time = GETDATE();
	PRINT '>> Truncating Table: erp_px_cat_g1v2';
	truncate table bronze.erp_px_cat_g1v2
	PRINT '>> Inserting Data Into: erp_px_cat_g1v2';
	bulk insert bronze.erp_px_cat_g1v2
	from 'C:\Users\ANIKET SOLANKI\OneDrive - UTS\Desktop\projects\Data warehouse and analytics\datasets\source_erp\PX_CAT_G1V2.csv'
	with (
	firstrow = 2,
	fieldterminator = ',',
	tablock
	);
	print '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time , @end_time ) as NVARCHAR) + ' seconds ';
	print '>> -----------------------';
	print ' ' ;



	SET @batch_end_time = GETDATE();
		PRINT '=========================================='
		PRINT 'Loading Bronze Layer is Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '=========================================='




	end try 
	begin catch 
		print '====================================='
		print 'Error'
		print 'Error message' + error_message() ;
		print 'Error message' + cast( error_number() as nvarchar );
		print '====================================='
		
	end catch 
end
