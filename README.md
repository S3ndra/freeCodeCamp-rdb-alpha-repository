# Universe Database Project

A PostgreSQL database project that demonstrates relational database design with tables for galaxies, stars, planets, and moons.

## Project Description

This project creates a comprehensive universe database with the following features:

### Tables
- **galaxy** - 6 rows, 7 columns
- **star** - 6 rows, 8 columns
- **planet** - 12 rows, 9 columns
- **moon** - 20 rows, 8 columns
- **asteroid** - 3 rows, 8 columns

### Key Features
- Auto-incrementing primary keys following naming convention (table_name_id)
- Foreign key relationships between tables
- Multiple data types (VARCHAR, INT, NUMERIC, TEXT, BOOLEAN)
- Unique constraints on name columns
- NOT NULL constraints for required fields

### Database Structure

#### Galaxy Table
- galaxy_id (PRIMARY KEY, SERIAL)
- name (VARCHAR, UNIQUE, NOT NULL)
- age_in_millions_of_years (INT, NOT NULL)
- num_of_stars (INT, NOT NULL)
- description (TEXT)
- has_life (BOOLEAN, NOT NULL)
- is_spherical (BOOLEAN)

#### Star Table
- star_id (PRIMARY KEY, SERIAL)
- name (VARCHAR, UNIQUE, NOT NULL)
- galaxy_id (INT, NOT NULL, FOREIGN KEY)
- age_in_millions_of_years (INT)
- temperature (NUMERIC, NOT NULL)
- has_life (BOOLEAN)
- is_main_sequence (BOOLEAN, NOT NULL)

#### Planet Table
- planet_id (PRIMARY KEY, SERIAL)
- name (VARCHAR, UNIQUE, NOT NULL)
- star_id (INT, NOT NULL, FOREIGN KEY)
- age_in_millions_of_years (INT)
- distance_from_earth (NUMERIC, NOT NULL)
- is_habitable (BOOLEAN)
- has_water (BOOLEAN, NOT NULL)
- description (TEXT)

#### Moon Table
- moon_id (PRIMARY KEY, SERIAL)
- name (VARCHAR, UNIQUE, NOT NULL)
- planet_id (INT, NOT NULL, FOREIGN KEY)
- diameter_in_km (INT, NOT NULL)
- age_in_millions_of_years (INT)
- is_spherical (BOOLEAN)
- description (TEXT)
- has_water (BOOLEAN, NOT NULL)

#### Asteroid Table
- asteroid_id (PRIMARY KEY, SERIAL)
- name (VARCHAR, UNIQUE, NOT NULL)
- diameter_in_km (INT, NOT NULL)
- distance_from_earth (NUMERIC, NOT NULL)
- composition (TEXT)
- is_metallic (BOOLEAN, NOT NULL)
- age_in_millions_of_years (INT)
- is_dangerous (BOOLEAN)

## How to Use

To restore the database from the dump file:

```bash
psql -U postgres < universe.sql
```

Or from within psql:

```
psql --username=freecodecamp --dbname=postgres
postgres=> \i universe.sql
```

## Files

- **universe.sql** - Complete PostgreSQL database dump with all schema and data

## Requirements Met

✅ Database named "universe"
✅ 5 tables with proper relationships
✅ Auto-incrementing primary keys with correct naming convention
✅ Foreign key relationships (Star→Galaxy, Planet→Star, Moon→Planet)
✅ Multiple data types (INT, NUMERIC, TEXT, BOOLEAN, VARCHAR)
✅ Minimum row requirements met for all tables
✅ Minimum column requirements met for all tables
✅ At least 2 NOT NULL columns per table
✅ UNIQUE constraints on all name columns

## Project Status

✅ All project requirements completed
✅ Database created and tested
✅ All data inserted successfully
✅ Dump file generated
