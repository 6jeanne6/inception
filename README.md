![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white) ![MariaDB](https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white) ![WordPress](https://img.shields.io/badge/WordPress-%23117AC9.svg?style=for-the-badge&logo=WordPress&logoColor=white) ![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)

# 📖 Description

Setting up a website by using Docker containers to enable Nginx, MariaDB and Wordpress.

# ⚙️ Installation

1. Clone the git repository

```
git clone https://github.com/6jeanne6/inception inception
```

2. Go to the directory

```
cd inception
```

# 🚀 Usage

To launch Docker Compose and up and build containers: 

```
make
```

To stop containers and remove them :

```
make down
```

To clean everything, including unused images:

```
make vclean
```
