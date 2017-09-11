all:

dataset.json:
	wget https://datahub.io/core/currency-codes/r/codes-all.json -O $@

list_one.xml:
	wget https://www.currency-iso.org/dam/downloads/lists/list_one.xml -O $@
