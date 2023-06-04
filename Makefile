FILES=title.basics.tsv.gz title.ratings.tsv.gz
TARGETS=$(FILES:.tsv.gz=.csv)
DB=imdb.duckdb

all: $(DB)

$(DB): $(TARGETS)
	for file in $^; do \
		table_name=`echo $$(basename $$file .csv) | tr '.' '_'` ; \
		duckdb $(DB) -c "DROP TABLE IF EXISTS raw_$$table_name; CREATE TABLE raw_$$table_name AS SELECT * FROM read_csv_auto('$$file');" ; \
	done
	rm $(TARGETS)

%.tsv.gz:
	wget https://datasets.imdbws.com/$@

%.tsv: %.tsv.gz
	gunzip -f $<

%.csv: %.tsv
	sed -e 's/\\N//g' -e 's/"//g' $< > "$(patsubst %.tsv,%.csv,$<)"
	rm $<

clean:
	rm -f $(TARGETS) $(DB)
