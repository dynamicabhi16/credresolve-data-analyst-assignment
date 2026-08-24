import pandas as pd
from src.cleaning import clean_borrowers, clean_payments

def test_borrower_latest_snapshot():
    d=pd.DataFrame({'borrower_id':['B1','B1'],'updated_at':['2026-01-01','2026-02-01'],'name':['old','new']})
    x=clean_borrowers(d)
    assert len(x)==1 and x.iloc[0]['name']=='new'

def test_payment_exact_duplicate_dedup():
    d=pd.DataFrame({'payment_id':['P1','P1'],'payment_reference':['R1','R1'],'event_at':['2026-01-01','2026-01-01'],'payment_status':['SUCCESS','SUCCESS'],'amount':[10,10]})
    x=clean_payments(d)
    assert len(x)==1 and x.iloc[0].amount==10
