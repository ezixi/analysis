# No, Coding Is Required
I'm currently looking for work. (If I can help you, [get in touch](https://backhand.tech/contact.html#contact))

As part of a technical take-home project I had to use a proprietary ETL tool to mangle some data from a couple of api endpoints, collate it and push the data into an Excel file. Simple, you may say...

After finding out that the software only runs on Windows, creating a virtual machine on my Mac, installing Windows, wrangling with a GUI to create the ETL workflow, packing it into code that can be shared and finally publishing it, I wondered if I could do the same task any faster and produce something that could be version-controlled, reviewed, tested....

Of course I could. In 13 lines of Pandas code.

Today, the simplest, most effective way to manage data is with code. Anyone can learn it. 'No coding required' should no longer be a value-add. 



```python
import pandas as pd
import requests
```


```python
datasets = [
    'RUTH',
    'IRID',
    'RHOD',
    'PALL'
]
api_key = 'secret_key'
```


```python
def get_data(dataset):
    response = requests.get(f'https://www.quandl.com/api/v3/datasets/JOHNMATT/{dataset}?api_key={api_key}')
    raw = response.json()['dataset']
    df = pd.DataFrame(raw['data'], columns=raw['column_names'])
    df['Dataset name'] = raw['name']
    return df
```


```python
df = pd.concat([get_data(dataset) for dataset in datasets])
```


```python
df.to_excel("~/Desktop/metal_prices.xlsx", index=False, sheet_name='Rare Metal Prices')
```


```python

```
