import pandas as pd

def lambda_handler(event, context):
    print("Hello World!")
    data = [{'col_1': 3, 'col_2': 'a'},
        {'col_1': 2, 'col_2': 'b'},
        {'col_1': 1, 'col_2': 'c'},
        {'col_1': 0, 'col_2': 'd'}]
    df = pd.DataFrame.from_records(data)
    print(df)
