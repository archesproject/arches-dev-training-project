### To get started with this project

1. Clone the repo: `$ git clone https://github.com/archesproject/arches-dev-training-project.git`
2. With your virtual environment activated (with arches installed) `cd` into the into the cloned repo and setup your db and index by running `$(env) python manage.py packages -o setup_db`
3. Next run `$ python manage.py runserver`

### To load the address extensions

1. `$(env) python manage.py widget register -s arches_dev_training/widgets/geocoder.json`
2. `$(env) python manage.py datatype register -s arches_dev_training/datatypes/address.py`
3. `$(env) python manage.py report register -s arches_dev_training/reports/address-report.json` 
4. `$(env) python manage.py card_component register -s arches_dev_training/card_components/address-card.json`

***Be sure that you have your mapbox api key saved in your system settings***
