# Flight Mechanics projects with my database

Goal is to design plane in a neat way with updated database with version control.

## Usage tips

All updated engineering values should be stored in `sheet_name="Base"` in `ml_projekty.xlsx`.

### To get value from `Base` sheet:

```python
import pandas as pd

# Import database from excel sheet. It is organized in columns [variable | unit | symbol | value]
# You can set index col (you can take symbol for cleaner formulas)
df = pd.read_excel("../../database/ml_projekty.xlsx", sheet_name="Base", index_col="symbol")

# to get value us df.at[<index>, "value"]
df.at["w_e","value"]
```

You can pass values to `Base` sheet using this excel formula:

```
=<sheet_name>!<cell>
example:
=weight_iteration!B10
```

### Use of utility functions

- `dir_gen.py` - generates defualt tree with files,
  ```powershell
  python .\utility\dir_gen.py <proj_name>
  ```

### Commit rules

commits with prefix of current project number example:

```
git commit -m"<project_number>.<verion>:<Description>"
```

### Insert variables in `.tex` file

```
% import data
\DTLloaddb[noheader, keys={thekey,thevalue}]{mydata}{../../database/plane_properties.csv}

% Loads mydata.dat with column headers 'thekey' and 'thevalue'
\newcommand{\PlaneVar}[1]{\DTLfetch{mydata}{thekey}{#1}{thevalue}}

% Insert variable in text
\PlaneVar{S_h}

```

## TODOs:

- [ ] use json file to set working tree
- [ ] copy files from base_files to desired location automatically
