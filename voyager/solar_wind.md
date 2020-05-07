```python
import pandas as pd
import numpy as np
from bokeh.plotting import figure, show
from bokeh.io import output_notebook
from bokeh.models import ColumnDataSource


output_notebook()
```



<div class="bk-root">
    <a href="https://bokeh.org" target="_blank" class="bk-logo bk-logo-small bk-logo-notebook"></a>
    <span id="1105">Loading BokehJS ...</span>
</div>





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
df = pd.read_csv('/Users/martinbell/analysis/voyager/source/VG2-SS-PLS-4-SUMM-1DAY-AVG-V1.0/DATA/2018_021_AUG.TAB', sep='\s+', header = None, names = column_names)
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
      <th>77.640076</th>
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
      <td>1.01235</td>
    </tr>
    <tr>
      <th>77.642250</th>
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
      <td>1.01124</td>
    </tr>
    <tr>
      <th>77.645432</th>
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
      <td>1.00993</td>
    </tr>
    <tr>
      <th>77.648155</th>
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
      <td>1.00895</td>
    </tr>
    <tr>
      <th>77.649902</th>
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
      <td>1.00800</td>
    </tr>
  </tbody>
</table>
</div>




```python
source = ColumnDataSource(df)
p = figure()
p.circle("R", "VR", source=source)
```




<div style="display: table;"><div style="display: table-row;"><div style="display: table-cell;"><b title="bokeh.models.renderers.GlyphRenderer">GlyphRenderer</b>(</div><div style="display: table-cell;">id&nbsp;=&nbsp;'1038', <span id="1041" style="cursor: pointer;">&hellip;)</span></div></div><div class="1040" style="display: none;"><div style="display: table-cell;"></div><div style="display: table-cell;">data_source&nbsp;=&nbsp;ColumnDataSource(id='1003', ...),</div></div><div class="1040" style="display: none;"><div style="display: table-cell;"></div><div style="display: table-cell;">glyph&nbsp;=&nbsp;Circle(id='1036', ...),</div></div><div class="1040" style="display: none;"><div style="display: table-cell;"></div><div style="display: table-cell;">hover_glyph&nbsp;=&nbsp;None,</div></div><div class="1040" style="display: none;"><div style="display: table-cell;"></div><div style="display: table-cell;">js_event_callbacks&nbsp;=&nbsp;{},</div></div><div class="1040" style="display: none;"><div style="display: table-cell;"></div><div style="display: table-cell;">js_property_callbacks&nbsp;=&nbsp;{},</div></div><div class="1040" style="display: none;"><div style="display: table-cell;"></div><div style="display: table-cell;">level&nbsp;=&nbsp;'glyph',</div></div><div class="1040" style="display: none;"><div style="display: table-cell;"></div><div style="display: table-cell;">muted&nbsp;=&nbsp;False,</div></div><div class="1040" style="display: none;"><div style="display: table-cell;"></div><div style="display: table-cell;">muted_glyph&nbsp;=&nbsp;None,</div></div><div class="1040" style="display: none;"><div style="display: table-cell;"></div><div style="display: table-cell;">name&nbsp;=&nbsp;None,</div></div><div class="1040" style="display: none;"><div style="display: table-cell;"></div><div style="display: table-cell;">nonselection_glyph&nbsp;=&nbsp;Circle(id='1037', ...),</div></div><div class="1040" style="display: none;"><div style="display: table-cell;"></div><div style="display: table-cell;">selection_glyph&nbsp;=&nbsp;None,</div></div><div class="1040" style="display: none;"><div style="display: table-cell;"></div><div style="display: table-cell;">subscribed_events&nbsp;=&nbsp;[],</div></div><div class="1040" style="display: none;"><div style="display: table-cell;"></div><div style="display: table-cell;">tags&nbsp;=&nbsp;[],</div></div><div class="1040" style="display: none;"><div style="display: table-cell;"></div><div style="display: table-cell;">view&nbsp;=&nbsp;CDSView(id='1039', ...),</div></div><div class="1040" style="display: none;"><div style="display: table-cell;"></div><div style="display: table-cell;">visible&nbsp;=&nbsp;True,</div></div><div class="1040" style="display: none;"><div style="display: table-cell;"></div><div style="display: table-cell;">x_range_name&nbsp;=&nbsp;'default',</div></div><div class="1040" style="display: none;"><div style="display: table-cell;"></div><div style="display: table-cell;">y_range_name&nbsp;=&nbsp;'default')</div></div></div>
<script>
(function() {
  var expanded = false;
  var ellipsis = document.getElementById("1041");
  ellipsis.addEventListener("click", function() {
    var rows = document.getElementsByClassName("1040");
    for (var i = 0; i < rows.length; i++) {
      var el = rows[i];
      el.style.display = expanded ? "none" : "table-row";
    }
    ellipsis.innerHTML = expanded ? "&hellip;)" : "&lsaquo;&lsaquo;&lsaquo;";
    expanded = !expanded;
  });
})();
</script>





```python
show(p)
```








<div class="bk-root" id="8be82a25-df8b-4013-9f2d-c0db3c7d5464" data-root-id="1004"></div>






```python

```
