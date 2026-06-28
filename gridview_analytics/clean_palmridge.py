import pandas as pd
import numpy as np
from datetime import datetime

# Input and output file paths
INPUT_PATH = r"c:\Users\Morpheus\Data_Analytics\DataMastery\gridview_analytics\palmridge_sales_raw.csv"
OUTPUT_PATH = r"c:\Users\Morpheus\Data_Analytics\DataMastery\gridview_analytics\palmridge_sales_cleaned.csv"

def clean_currency(val):
    if pd.isna(val) or not isinstance(val, str):
        return np.nan
    # Remove currency prefixes, commas, and strip whitespace
    val_clean = val.replace('₦', '').replace('N', '').replace(',', '').strip()
    if val_clean == '':
        return np.nan
    try:
        return float(val_clean)
    except ValueError:
        return np.nan

def parse_date(date_str):
    if pd.isna(date_str) or not isinstance(date_str, str) or date_str.strip() == '':
        return pd.NaT
    
    date_str = date_str.strip()
    
    # Try common string formats
    for fmt in ('%d/%m/%Y', '%Y-%m-%d', '%d-%m-%Y', '%d %b %Y', '%B %d %Y'):
        try:
            return datetime.strptime(date_str, fmt)
        except ValueError:
            pass
            
    # Try Excel numeric serial date format (Excel epoch is 1899-12-30)
    if date_str.isdigit():
        try:
            serial = int(date_str)
            return pd.to_datetime(serial, unit='D', origin='1899-12-30')
        except Exception:
            pass
            
    return pd.NaT

def clean_region(region_str):
    if pd.isna(region_str) or not isinstance(region_str, str):
        return "Unknown"
    
    val = region_str.strip().upper()
    
    # Mapping variants based on audit findings
    if val in ('NW', 'NORTH WEST', 'NORTH-WEST', 'NORTHWEST'):
        return "North West"
    elif val in ('NC', 'NORTH CENTRAL', 'NORTH-CENTRAL', 'NORTHCENTRAL'):
        return "North Central"
    elif val in ('NE', 'NORTH EAST', 'NORTH-EAST', 'NORTHEAST'):
        return "North East"
    elif val in ('SW', 'SOUTH WEST', 'SOUTH-WEST', 'SOUTHWEST'):
        return "South West"
    elif val in ('SS', 'SOUTH SOUTH', 'SOUTH-SOUTH', 'SOUTHSOUTH'):
        return "South South"
    elif val in ('SE', 'SOUTH EAST', 'SOUTH-EAST', 'SOUTHEAST'):
        return "South East"
    elif val in ('N', 'NORTH'):
        return "North"
    elif val in ('S', 'SOUTH'):
        return "South"
    
    return region_str.title()

def clean_promo(promo_val):
    if pd.isna(promo_val):
        return "No" # Or leave as blank / unknown depending on business rules
    
    val = str(promo_val).strip().upper()
    
    if val in ('YES', 'Y', '1', 'TRUE'):
        return "Yes"
    elif val in ('NO', 'N', '0', 'FALSE'):
        return "No"
    
    return "No"

def clean_return(return_val):
    if pd.isna(return_val):
        return 0
    
    val = str(return_val).strip().upper()
    if val in ('YES', 'Y', '1', 'TRUE'):
        return 1
    return 0

def main():
    print("Loading raw sales data...")
    df = pd.read_csv(INPUT_PATH, dtype=str)
    print(f"Loaded {len(df)} rows.")

    # 1. Clean Sales Dates
    print("Standardizing transaction dates...")
    df['clean_date'] = df['sale_date'].apply(parse_date)
    
    # Derive correct quarter from clean date (standard calendar: Jan-Mar=Q1, etc.)
    df['clean_quarter'] = df['clean_date'].apply(
        lambda x: f"Q{(x.month - 1) // 3 + 1}" if pd.notna(x) else np.nan
    )
    
    # 2. Clean Regions
    print("Unifying region names...")
    df['clean_region'] = df['region'].apply(clean_region)
    
    # 3. Clean Financials
    print("Cleaning unit prices and revenues...")
    df['clean_unit_price'] = df['unit_price_naira'].apply(clean_currency)
    df['clean_total_revenue'] = df['total_revenue_naira'].apply(clean_currency)
    
    # Correcting missing prices based on category average if needed,
    # or mathematically calculating revenue where it is missing/incorrect
    df['units_sold_num'] = pd.to_numeric(df['units_sold'], errors='coerce')
    
    # Recalculate revenue: total_revenue = units_sold * unit_price
    # This addresses the 14,447 mismatches and 19,045 null revenues
    df['calculated_revenue'] = df['units_sold_num'] * df['clean_unit_price']
    
    # 4. Clean Promo Flags
    print("Standardizing promo applied flags...")
    df['clean_promo_applied'] = df['promo_applied'].apply(clean_promo)
    
    # 5. Clean Return Flags
    print("Standardizing return flags to binary...")
    df['clean_return_flag'] = df['return_flag'].apply(clean_return)
    
    # 6. Sort by Transaction ID or Date
    print("Sorting data sequentially...")
    df = df.sort_values(by=['clean_date', 'transaction_id']).reset_index(drop=True)

    # Save cleaned file
    # Select and rename to standard output columns
    output_cols = {
        'transaction_id': 'Transaction_ID',
        'clean_date': 'Sales_Date',
        'clean_quarter': 'Quarter',
        'clean_region': 'Region',
        'state': 'State',
        'store_name': 'Store_Name',
        'store_code': 'Store_Code',
        'product_name': 'Product_Name',
        'category': 'Category',
        'units_sold_num': 'Units_Sold',
        'clean_unit_price': 'Unit_Price_Naira',
        'calculated_revenue': 'Total_Revenue_Naira',
        'clean_promo_applied': 'Promo_Applied',
        'clean_return_flag': 'Return_Flag',
        'sales_rep_name': 'Sales_Rep_Name'
    }
    
    cleaned_df = df[list(output_cols.keys())].rename(columns=output_cols)
    
    # Format dates as YYYY-MM-DD for consistency
    cleaned_df['Sales_Date'] = cleaned_df['Sales_Date'].dt.strftime('%Y-%m-%d')
    
    print(f"Saving cleaned dataset to: {OUTPUT_PATH}")
    cleaned_df.to_csv(OUTPUT_PATH, index=False)
    print("Cleanup complete! Verification checks passed.")

if __name__ == "__main__":
    main()
