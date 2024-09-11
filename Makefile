dev:
	robot -P ./ -V .env.dev.json --outputdir output GJD/

prod:
	robot -P ./ -V .env.prod.json --outputdir output GJD/

clean:
	rm -rf output

PHONY: dev prod clean
