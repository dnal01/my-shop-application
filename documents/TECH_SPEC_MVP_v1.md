# Tech Spec, MVP v1

## Data Scheme

Model `Product` 

- id: MEDIUMINT, NOT NULL
- title: VARCHAR(100), NOT NULL
- description: VARCHAR(255), NOT NULL
- category_id: VARCHAR(255), NOT NULL
- measure_unit_id: VARCHAR(255), NOT NULL
- vendor_id: SMALLINT, NOT NULL
- brand_id: SMALLINT, NOT NULL
- type_id: SMALLINT, NOT NULL
- is_weighed: TINYINT(1), NOT NULL
is_weighed true or false influence user interfaces during scanning a barcode when selling a product.
A new modal view appears, asking to enter weight of the product.

Also when adding product quantity and manipulating with inventory only those products which are weighed contain decimal number, otherwise it is an integer.

- is_deactivated: TINYINT(1), NOT NULL

  Sub-model `Variant`
  - id: MEDIUMINT, NOT NULL
  - media: VARCHAR(255), NOT NULL
  - barcode: VARCHAR(255), NOT NULL
  - avarage_cost: MEDIUMINT, NOT NULL
  - quantity: DECIMAL(6,4), NOT NULL
Checks if the product is weighed, if not only integer is allowed.
  - price: INT, NOT NULL
  - order_limits: SMALLINT, NOT NULL
When the limit is above actual inventory ammount, the push up is triggered on the employee UI side.
  - option_value: SMALLINT, NOT NULL
  - option_table_id: XL / blue / rubber
  - promo_id: SMALLINT, NOT NULL
  - product_id: MEDIUMINT, NOT NULL
  - is_deactivated: TINYINT(1), NOT NULL
If deactivated is true, than hide product from the UI and exclude from the deliveries, orders and inventory lsit
 
  Sub-model `Categories`
  - id:
  - name:
  - children:
  - attributes:
 
  Sub-model `Attributes`
  - id:
  - name:
  - description:
  - values:
 
  Sub-model `measure-unit`
  - id:
  - class:
  - values_full:
  - values_short:
  *** Sub-model `measure-unit` list
  - Weight:
    - Milligram (ml)
    - Gram (g)
    - Kilogram (kg)
  - Volume:
    - Milliliter (ml)
    - Liter (L)
    - Centimiter
    - Cubik Meter (m3)
  - Size:
    - Millimeter (mm)
    - Centimeter (cm)
    - Meter (m)
  - Area:
    - Square meter (m2)
  - Per item:
    - Item (Item)

  Sub-model `Vendor`
  - id:
  - name:
  - phone:
  - address:
 
  Sub-model `brand`
  - id:
  - title:
  - company:
 
  Sub-model `Type`
  - id:
  - title:
 
  Sub-model `Promos`
  - id:
  - discount_code:
  - discount_value:
  - products:

Model `Customer`

- id: MEDIUMINT, NOT NULL
- first_name: VARCHAR(20), NOT NULL
- last_name: VARCHAR(20), NOT NULL
- phone_number: VARCHAR(24), NOT NULL
- email_address: VARCHAR(64), NOTNULL

Model `User`

- id: MEDIUMINT, NOT NULL
- first_name: VARCHAR(20), NOT NULL
- last_name: VARCHAR(20), NOT NULL
- phone_number: VARCHAR(24), NOT NULL
- email_address: VARCHAR(64), NOT NULL
- role_id: SMALLINT, NOT NULL
Different role provides different access to the system. View, Edit or Full access.
- salary: MEDIUMINT, NOT NULL
- pin:
- enterence_history:

  Sub-model `roles`
  - id:
  - title:
  *** Sub-model `Vendor` list
  - admin;
  - cassier;
  - delivery_guy

Model `Promo`

- id: MEDIUMINT, NOT NULL
- title: VARCHAR(100), NOT NULL
- discount: SMALLINT, MOT NULL

Model `Account`

- id: SMALLINT, NOT NULL
- title: VARCHAR(100), NOT NULL
- type_id: SMALLINT, MOT NULL
- current_amount: MEDIUMINT, NOT NULL
- currency_id: SMALLINT, MOT NULL
Currency fetches the current market cost and saves this value together with the transactions, letter to calculate earnings amoung different accounts.
- openning_date, DATETIME, NOT NULL
- closing_date, DATETIME, NOT NULL
- bank_commision, SMALLINT, NOTNULL
Commision is didacted from the credit card payments, either by the end of the day from total amount or from each of the order.

  Sub-model `types`
  - id:
  - title:
 
  Sub-model `Currency`
  - id:
  - title:
  - rate:

Model `Vendor`

- id: SMALLINT, NOT NULL
- company_name: VARCHAR(100), NOT NULL
- address: SMALLINT, NOTNULL
- phone_number: SMALLINT, NOTNULL

Model `Order`

- id: BIGINT, NOT NULL
- date_time: DATETIME, NOT NULL
- client_id: SMALLINT, MOTNULL
- employee_id: MEDIUMINT, NOT NULL
- total_price: MEDIUMINT, NOT NULL
- payment_status_id: SMALLINT, NOT NULL
Money will be withdrawn from an acount if refunded, partly.
- return_status_id: SMALLINT, NOT NULL
- order_status_id: SMALLINT, NOT NULL

  Sub-model `Order_Variant`
  - id: BIGINT, NOT NULL
  - order_id: BIGINT, NOT NULL
  - product_variant_id: MEDIUMINT, MOT NULL
  - discount: SMALLINT, NOT NULL
  - promo_id: TINYINT(1), NOTNULL
  - price: MEDIUMINT, NOT NULL
  - quantity: MEDIUMINT, NOT NULL
 
  Sub-model `payment_statuses`
  - id:
  - title:
  - description:
   *** Sub-model `payment_statuses` list
  - pending;
  - authorised;
  - paid;
  - Refunded;
  - Partially refunded;
  - partially_payed;
  - Voided;
  - Unpaid.

  Sub-model `return_statuses`
  - id:
  - title:
  *** Sub-model `return_statuses` list
  - return requested;
  - return in progress;
  - Returned;
  - Declined
 
  Sub-model `order_statuses`
  - id:
  - title:
 *** Sub-model `order_statuses` list
  - open;
  - archived;
  - canceled

Model `Delivery`

- id: BIGINT, NOT NULL
- date_time: DATETIME, NOT NULL
- vendor_id: SMALLINT, MOTNULL
- employee_id: MEDIUMINT, NOT NULL
- total_cost: MEDIUMINT, NOT NULL
- delivery_status_id: SMALLINT, NOT NULL

  Sub-model `Delivery_Variant`
  - id: BIGINT, NOT NULL
  - delivery_id: BIGINT, NOT NULL
  - product_variant_id: MEDIUMINT, MOT NULL
  - cost: MEDIUMINT, NOT NULL
  - quantity: MEDIUMINT, NOT NULL
 
  Sub-model `delivery_statuses`
  - id:
  - title
  *** Sub-model `delivery_statuses` list
  - draft;
  - ordered;
  - received;
  - canceled;
  - closed

## Application Architecture

1. Apple MVC arch: https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html 
2. MVVM arch. from Apple Community: https://www.hackingwithswift.com/books/ios-swiftui/introducing-mvvm-into-your-swiftui-project 
3. Redux architecture, based on js: https://redux.js.org/tutorials/fundamentals/part-1-overview and https://redux.js.org/tutorials/fundamentals/part-2-concepts-data-flow 

## Main User Workflow 

TBD to describe next bullet points from technical side:

- UI and UX specifics (SwiftUI vs UIKit)
- App Navigation (how exactly navigation work)
All tabs are on one screen. The state is saved of each of the tab.
- Services & business logic in entire application 
- Infrastructure around project & codebase 

## Misceleneous
*add shelflife. working schedule, worked gours, logging log and actions taken.
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
