# CMakeLists.txt
cmake_minimum_required(VERSION 3.10)
project(CalculatorProject)

# Встановлюємо варіанти компіляції
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Додаємо бібліотеку
add_library(calculator STATIC calculator.cpp)

# Додаємо виконуваний файл
add_executable(calculator_app main.cpp)

# Підключаємо бібліотеку до виконуваного файлу
target_link_libraries(calculator_app PRIVATE calculator)

# Вказуємо директорії для заголовочних файлів
target_include_directories(calculator_app PRIVATE ${CMAKE_SOURCE_DIR})

# Секція для зборки за допомогою Ninja
set(CMAKE_GENERATOR "Ninja")

# Опис команди clean
add_custom_target(clean_all COMMAND ${CMAKE_COMMAND} -P ${CMAKE_BINARY_DIR}/cmake_clean.cmake)