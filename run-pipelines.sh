docker-compose exec orchestrator python -m luigi --module somedi-usecase.workflow StoreTask --query restauranteslateral --number 10 --source facebook --algorithm sentiment140 --lang es --id 5 --doc-type lateral
docker-compose exec orchestrator python -m luigi --module somedi-usecase.workflow StoreTask --query "@rest_lateral" --number 50 --source twitter --algorithm sentiment140 --lang es --id 6 --doc-type lateral
docker-compose exec orchestrator python -m luigi --module somedi-usecase.workflow StoreTask --query 100MontaditosSpain --number 10 --source facebook --algorithm sentiment140 --lang es --id 7 --doc-type competitor
docker-compose exec orchestrator python -m luigi --module somedi-usecase.workflow StoreTask --query 100montaditos --number 50 --source twitter --algorithm sentiment140 --lang es --id 8 --doc-type competitor
docker-compose exec orchestrator python -m luigi --module somedi-usecase.workflow StoreTask --query "restaurantes lateral" --number 50 --source tripadvisor --algorithm sentiment140 --lang es --id 9 --doc-type lateral
docker-compose exec orchestrator python -m luigi --module somedi-usecase.workflow StoreTask --query "100 montaditos" --number 50 --source tripadvisor --algorithm sentiment140 --lang es --id 10 --doc-type competitor

