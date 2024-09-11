dev:
	robot -P ./ --outputdir output GJD/

prod:
	robot -P ./ -v LOGIN_URL:https://ghostjobbuster.com --outputdir output GJD/

PHONY: dev prod
