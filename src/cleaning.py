from pathlib import Path
import pandas as pd

def read_raw(raw_dir: str):
    raw=Path(raw_dir)
    return {p.stem: pd.read_csv(p) for p in raw.glob('*.csv')}

def clean_borrowers(df):
    df=df.copy()
    df['updated_at']=pd.to_datetime(df['updated_at'],utc=True,errors='coerce')
    return df.sort_values(['borrower_id','updated_at']).drop_duplicates('borrower_id',keep='last')

def clean_events(df, key, datetime_col='event_at'):
    df=df.drop_duplicates().copy()
    if datetime_col in df.columns:
        df[datetime_col]=pd.to_datetime(df[datetime_col],utc=True,errors='coerce')
    return df.sort_values(datetime_col).drop_duplicates(key,keep='last')

def clean_payments(df):
    df=df.drop_duplicates().copy()
    df['event_at']=pd.to_datetime(df['event_at'],utc=True,errors='coerce')
    df['ref_present']=df['payment_reference'].notna().astype(int)
    return df.sort_values(['payment_id','ref_present','event_at']).drop_duplicates('payment_id',keep='last').drop(columns='ref_present')

def resolve_event_borrower(event_df, accounts_df):
    # account_id is authoritative for borrower attribution.
    x=event_df.drop(columns=['borrower_id'],errors='ignore').merge(accounts_df[['account_id','borrower_id']],on='account_id',how='left')
    return x
