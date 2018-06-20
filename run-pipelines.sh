docker-compose exec orchestrator python -m luigi --module somedi-usecase.workflow StoreTask --query restauranteslateral --number 10 --source facebook --algorithm sentiment140 --lang es --id 5
docker-compose exec orchestrator python -m luigi --module somedi-usecase.workflow StoreTask --query rest_lateral --number 10 --source twitter --algorithm sentiment140 --lang es --id 6
docker-compose exec orchestrator python -m luigi --module somedi-usecase.workflow StoreTask --query 100MontaditosSpain --number 10 --source facebook --algorithm sentiment140 --lang es --id 7
docker-compose exec orchestrator python -m luigi --module somedi-usecase.workflow StoreTask --query 100montaditos --number 10 --source twitter --algorithm sentiment140 --lang es --id 8
