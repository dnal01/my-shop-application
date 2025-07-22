Developing search fields as the Fuzzy search. Fuzzy search is a search technique that finds matches even when the search query doesn't perfectly match corresponding data. It looks beyond literal character-for-character matching and identifies results that are similar to the search query in terms of spelling, meaning, or other criteria.


ТОВАРИ НА ПРОДАЖ

- Додавати товари до систему
  - схема: прийшов товар - дав гроші - отримав товар - виставив на продаж
- існує 2 категорії товарів:
  - продукти на продаж
  - продукти власного використання (те що не на продаж але треба для ведення бізнесу)
    - мило в туалеті
    - електроенергія

- Система має проводити інвентаризацію при цьому сканувати штрих код (Робити інвентаризацію не вибираючи перед тим товар тобто якийсь код відсканував такий товар і буде інвентаризований)
- Показувати при продажу (вибору) товару, його кількість у залишках
- Показувати сповіщення коли товар майже або взагалі закінчився після продажу

ПОСТАЧАННЯ

- Зробити листок товарів до замовлення постачання (їх назва, кількість) - автоматично формується з урахуванням продажів та лімітів (можливість додати твоар вручну).
- Колий товар прийшов редагувати листок замовлення та внести фактичні кількості та товари. (можливість видалити товар зі списку якщо такий не поставився, або додати вручну якщо прийшов додатковий)
- Поля у листку: кількості твоірів, назва, хто поставив, загальна сума, ціна купівлі та продажу, дата

ЗАМОВЛЕННЯ

- сформувати замовлення з набору товарів (при продажі товарів)
- Модифікувати замовлення
- Оплатити готівкою

РАХУНОК КОМПАНІЇ

- 2 типу рахунків: (1) готівковий рахунок та (2) безготівковий рахунок
- cash account properties:
  - Номер рахунку
  - Сума
  - Валюта
  - Дата відкриття
  - Дата закриття
- bank account properties:
  - Комісія за кожну транзакцію на банківський рахунок
  - Номер рахунку
  - Сума
  - Валюта
  - Дата відкриття
  - Дата закриття
- готівковий рахунок у гривні UAH
- безготівковий рахунок у гривні (UAH)
- Контролювати витрати та доходи (debit and credit)
  - TBD описати математику обрахунку при додаванні товару в систему
  - TBD описати математику обрахунку при продажі товару клієнтам магазину 
- (optional) готівковий рахунок у іншій валюті, напр. EUR
- (optional) безготівковий рахунок у іншій валюті, напр. EUR

ПРАЦІВНИКИ

- Ролі: продавець, адміністратор
- Може бути ~10 параметрів
- Доступ до:
  Role: cashier
    ТОВАРИ
    ПОСТАЧАННЯ
    ЗАМОВЛЕННЯ
    КЛІЄНТ
    АНАЛІТИКА (інформацію про товари (популярність, кількість продажів, постачань, кількість твоарів у постачаннях...)
    АКЦІЇ

  Role: administrator
    ТОВАРИ
    ПОСТАЧАННЯ
    ЗАМОВЛЕННЯ
    РАХУНКИ
    КЛІЄНТ
    АНАЛІТИКА (вся)
    АКЦІЇ


# Data schema

## Product
BIGINT id NOT NULL AUTOCOMPLETE (PRIMARY KEY)

Назва

Опис
Одиниця виміру
Категорія
Виробник
Бренд
Групування за
Тип
Варіанти
Ціна закупівлі
Середня субіварітсть
Штрихкод
Фото
Назва опції
Значення опції
Кількість
shelf life
Customer entity має такі характеристи:

first name
last name
phone number
email address
User entity має такі характеристи:

first name
last name
phone number
email address
role
salary
working schedule
worked hours / days
loging log ?
actions taken in the system?
Promo entity має такі характеристи:

products
discount
Account entity має такі характеристи:

type
current amount
currency
opening date
closing date
commission / deduction
Vendor entity має такі характеристи:

company name
address
phone number
Order entity має такі характеристи:

time
client
employee
discount
Promo
total price
products
price for each product
payment status
return status
order status
Delivery entity має такі характеристи:

vendor
products
product amount
product cost
total cost
status
time
