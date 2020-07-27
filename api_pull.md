```python
import pandas as pd
import requests
```


```python
datasets = ['RUTH', 'IRID', 'RHOD', 'PALL']
```


```python
def get_data(dataset):
    response = requests.get(f'https://www.quandl.com/api/v3/datasets/JOHNMATT/{dataset}?api_key=VrHmszM7eUY_n12xYZ4N')
    raw = response.json()['dataset']
    cols = raw['column_names']
    name = raw['name']
    df = pd.DataFrame(raw['data'], columns=cols)
    df['Dataset name'] = name
    return df
```


```python
df = pd.concat([get_data(dataset) for dataset in datasets])
```


```python
df.to_excel("~/Desktop/metal_prices.xlsx", index=False, sheet_name='Rare Metal Prices')
```
