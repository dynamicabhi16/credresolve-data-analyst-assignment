"""Core analysis functions used by the notebook and reproducible runner."""
import pandas as pd

def monthly_recovery(payments):
    p=payments.copy(); p['event_at']=pd.to_datetime(p['event_at'],utc=True); p=p[p.payment_status=='SUCCESS']; p['month']=p.event_at.dt.to_period('M').astype(str)
    return p.groupby('month').agg(recovery=('amount','sum'),successful_payments=('payment_id','nunique'),unique_payers=('account_id','nunique')).reset_index()

def recovery_per_target(payments, targets):
    r=monthly_recovery(payments).set_index('month'); t=targets.copy(); t['target_date']=pd.to_datetime(t['target_date'],utc=True); t['month']=t.target_date.dt.to_period('M').astype(str); x=t.groupby('month').account_id.nunique().rename('targeted_accounts'); out=r.join(x); out['recovery_per_targeted_account']=out.recovery/out.targeted_accounts; return out.reset_index()
