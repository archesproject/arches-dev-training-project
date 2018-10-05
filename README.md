### To get started with this project

1. Clone the repo: `$ git clone https://github.com/archesproject/arches-dev-training-project.git`
2. With your virtual environment activated (with arches installed) `cd` into the into the cloned repo and setup your db and index by running `$(env) python manage.py packages -o setup_db`
3. Next run `$ python manage.py runserver`

### To load the address extensions

1. `$ python manage.py widget register -s arches_dev_training/widgets/geocoder.json`
2. `$ python manage.py datatype register -s arches_dev_training/datatypes/address.py`
3. `python manage.py report register -s arches_dev_training/reports/address-report.json` 
