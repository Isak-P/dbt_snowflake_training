
def is_over_300000(x):
    if x > 300000:
        return True
    else:
        return False

def model(dbt, session):
    dbt.config(
        packages = ["pandas"]
    )
    opr_df = dbt.ref("orders_per_region").to_pandas()

    opr_df['IS_OVER_300000'] = opr_df['OPR_ORDERCOUNT'].apply(is_over_300000)

    return opr_df