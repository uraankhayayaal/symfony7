# Generate entities
```bash
php bin/console doctrine:mapping:import "App\Entity" annotation --path=src/Entity
```

# ?Make CRUD
```bash
php bin/console make:crud
```

# ?Make Controller
```bash
php bin/console make:controller SectionController
```

# Make migration
```bash
php bin/console make:migration
```


# Generate keys for JWT
```bash
php bin/console lexik:jwt:generate-keypair
```