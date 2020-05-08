# Voyager 2 and the solar wind

On November 5th 2018, a marvelous thing happened.


```python
from common.chart_helper import *
```


```python
column_names = [
    "DECIMAL YEAR",
    "DAY OF YEAR",
    "V2 ANGLE",
    "V2 HELIOLATITUDE",
    "EARTH HELIOLATITUDE"
    "V2 HELIOLONGITUDE",
    "EARTH HELIOLONGITUDE",
    "VR",
    "VT",
    "VN",
    "DEN MOMENT",
    "DEN FIT",
    "W MOMENT",
    "W FIT",
    "R"]
```


```python
df = pd.read_csv('/Users/martinbell/analysis/voyager/source/VG2-SS-PLS-4-SUMM-1DAY-AVG-V1.0/DATA/2018_021_AUG.TAB', sep='\s+', header = None, names = column_names, index_col=False)
```


```python
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>DECIMAL YEAR</th>
      <th>DAY OF YEAR</th>
      <th>V2 ANGLE</th>
      <th>V2 HELIOLATITUDE</th>
      <th>EARTH HELIOLATITUDEV2 HELIOLONGITUDE</th>
      <th>EARTH HELIOLONGITUDE</th>
      <th>VR</th>
      <th>VT</th>
      <th>VN</th>
      <th>DEN MOMENT</th>
      <th>DEN FIT</th>
      <th>W MOMENT</th>
      <th>W FIT</th>
      <th>R</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>77.640076</td>
      <td>234.0</td>
      <td>0.65</td>
      <td>7.20</td>
      <td>6.96</td>
      <td>-105.56</td>
      <td>-106.17</td>
      <td>350.89</td>
      <td>30.24</td>
      <td>15.65</td>
      <td>4.82811</td>
      <td>4.54375</td>
      <td>28.89</td>
      <td>25.42</td>
    </tr>
    <tr>
      <th>1</th>
      <td>77.642250</td>
      <td>235.0</td>
      <td>0.92</td>
      <td>7.31</td>
      <td>6.99</td>
      <td>-104.55</td>
      <td>-105.41</td>
      <td>330.08</td>
      <td>26.39</td>
      <td>35.59</td>
      <td>9.81383</td>
      <td>9.17923</td>
      <td>20.89</td>
      <td>19.74</td>
    </tr>
    <tr>
      <th>2</th>
      <td>77.645432</td>
      <td>236.0</td>
      <td>1.32</td>
      <td>7.48</td>
      <td>7.02</td>
      <td>-103.06</td>
      <td>-104.29</td>
      <td>349.73</td>
      <td>19.66</td>
      <td>12.29</td>
      <td>9.33560</td>
      <td>8.88595</td>
      <td>27.19</td>
      <td>24.35</td>
    </tr>
    <tr>
      <th>3</th>
      <td>77.648155</td>
      <td>237.0</td>
      <td>1.66</td>
      <td>7.62</td>
      <td>7.06</td>
      <td>-101.78</td>
      <td>-103.33</td>
      <td>412.15</td>
      <td>-17.06</td>
      <td>30.62</td>
      <td>10.11626</td>
      <td>10.83677</td>
      <td>39.99</td>
      <td>45.81</td>
    </tr>
    <tr>
      <th>4</th>
      <td>77.649902</td>
      <td>238.0</td>
      <td>1.87</td>
      <td>7.71</td>
      <td>7.07</td>
      <td>-100.97</td>
      <td>-102.72</td>
      <td>413.96</td>
      <td>36.35</td>
      <td>43.00</td>
      <td>7.29820</td>
      <td>7.35626</td>
      <td>37.77</td>
      <td>38.45</td>
    </tr>
  </tbody>
</table>
</div>




```python
plt.scatter("DECIMAL YEAR", "VT", data=df)
```




    <matplotlib.collections.PathCollection at 0x1144aee50>




![png](solar_wind_files/solar_wind_6_1.png)



```python

```


```python

```
