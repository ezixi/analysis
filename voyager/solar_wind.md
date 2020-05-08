# Voyager 2 and the solar wind


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
plt.scatter("DECIMAL YEAR", "VT", data=df)
```




    <matplotlib.collections.PathCollection at 0x1144aee50>




![png](solar_wind_files/solar_wind_4_1.png)

