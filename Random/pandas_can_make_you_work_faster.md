# Pandas Can Make You Work Faster
I'm currently looking for work. (If I can help you, [get in touch](https://backhand.tech/contact.html#contact))

As part of a technical take-home project I had to use a proprietary ETL tool to mangle some data from a couple of api endpoints, collate it and push the data into an Excel file. Simple, you may say...

After finding out that the software only runs on Windows, creating a virtual machine on my Mac, installing Windows, creating the ETL worflow and publishing it, I wondered if I could do the same task any faster....

Of course I could. In 13 lines of Pandas code.



```python
import pandas as pd
import requests
```


```python
datasets = ['RUTH', 'IRID', 'RHOD', 'PALL']
```


```python
def get_data(dataset):
    response = requests.get(f'https://www.quandl.com/api/v3/datasets/JOHNMATT/{dataset}?api_key={api_key}')
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
