#/bin/bash
# Generate search Index
# Deploy to prod
./hugo/assets/pagefind/pagefind --site hugo/public/ && cd hugo && hugo -b https://kissel.ch/ict && rsync -avz public/ mikcyons@kissel.ch:/home/mikcyons/www/kissel.ch/ict