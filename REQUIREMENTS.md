# Product Requirements Document

## Goals / Vision

- мати графічний інтерфейс додатку на платформі iPadOS для продавців
- application має працювати без інтернету
- (optional) мати графічний інтерфейс у додатку на платформі iOS для адміністратора
- (optional) application може синхронізуватися по мережі Internet (через окремий back-end)

## MVP v1

Requirements:

- Відправляти та приймати сигнал по блютуз від сканера штрих кодів
- Мати спільну базу даних з інтернет магазином
- Всі обєкти повязані щоб легко було проводити любу аналітику та мати відношення даних один з одним (data integrity) - master data concept
- Де є робота з товарами, мати можливість знайти товар за штрихкодом, та за назвою зі списку. Пошук по назві не має бути точним а приблизним, тобто можна комбінувати слова не залежно від порядку або розміщення у фактичній назві товару.
- Може бути кількість товару яка вимірються вагою або штуками.
- Товари мають варіанти (різний колір, вагу або смак). Ціна, назва, фото за окремий варіант має мати можливість виставлятися окремо
- Моделі: Товари, Клієнти, Акції, Персонал, Рахунок не мають видалятися а деактивовуватися. Ці моделі додатково мають властивість - статус (активний, неактивний).
- Неактивні обʼєкти не мають відображатися у інтерфейсі.

ТОВАРИ НА ПРОДАЖ

- Додавати товари до систему
  - внести товар у систему (кількість, назва etc)
  - схема: прийшов товар - дав гроші - отримав товар - виставив на продаж
- існує 2 категорії товарів:
  - продукти на продаж
  - продукти власного використання (те що не на продаж але треба для ведення бізнесу)
    - мило в туалеті
    - електроенергія
- товар як об'єкт має набір властивостей (properties):
  - може бути до ~10-12 параметрів у товару
  - example: назва, одиниця виміру, розмір, вага, дозування, смак, колір, ціна
  - (optional) термін придатності товару

- Керувати залишкми (кілкістю) товарів на складі (додання при постачанні, списання при продажам, ручним та автоматичним списанням або інвентаризації)
- Рахувати та оновлювати собівартість, націнку та ціну продажу автоматично після кожного постачання, списання або інвентаризації.
- Система має проводити інвентаризацію при цьому сканувати штрих код (Робити інвентаризацію не вибираючи перед тим товар тобто якийсь код відсканував такий товар і буде інвентаризований)
- Показувати при продажу (вибору) товару, його кількість у залишках
- Показувати сповіщення коли товар майже або взагалі закінчився після продажу
- (optional) Контролювати термін придатності товарів

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

## MVP v2

Requirements:

- Добавити безготівковий метод оплати (кредитними картками) при закритті замовлення.
  - Мати підтримку лише оплати карткою.
- Створення нової доменної моделі клієнти із властивостями та поведінкою
- Відображати статистику коштів окремо готівкового та безготівкового рахунків, або поєднану статистику готівкового та безготівкового рахунку
- Налаштовувати місячні автоматичні транзакції: витрати та доходи.
  - Оплата аренди, зарплати, податків, банківських зборів.

ТОВАРИ НА ПРОДАЖ

- Показувати які товари не були проінвентаризовані різними кольорами протягом місяця двох, трьох
- Надавати рекомендацію який товар краще замовити та коли
- Показувати наявну кількість товарів на складі у інтернет магазині
- Можливість зазначити за якими, товарами, категоріями або варіантами потрібно слідкувати щоб відімкнути для них нагадування про відсутність на складі. Також додатково автоматичне додання або вимкнення таких сповіщень на основі математики килькості продажу за останні місяці (популярності товару).
- Створювати акції на товари та / або категорію товарів та управляти акціями

ТОВАРИ ДЛЯ ВЛАСНИХ ПОТРЕБ
- Properties:
  - Тип (Електроенергія, Зарплата, Оренда, Господарчі речі)
  - Коментарь

ТРАНЗАКЦІЇ
- Properties:
  - Назва
  - Опис
  - Тип (послуга, комісія, прибуток)
  - Негативна чи позитивна
  - Обєкт (Замовлення)
 
  - Приклад:
    - transaction #1: 100 uah (послуга)
    - transaction #2: 97 uah (прибуток)
    - transaction #3: 3 uah (комісія)

ЗАМОВЛЕННЯ

- Properties:
  - Загальна сума
  - Товари
  - Коментарь
  - 

- Додавати товари (замовлення) до клієнта (аккаунт клієнта напр. через штрих-код)
- коментарі до замовлення
- оплата безготівкою - звичайний варіант вибору. Кошти зараховуються на безготівковий рахунок
- Додавати клієнта до замовлення
- оплата бонусами
  - Ціна всього замовлення може зменшитися на суму списаних бонусів.
  - Клієнт може викорисати бонуси для оплати замовлення у розмірі 1 бонус до 1 грн.
- Ціна замовлення міняє свій колір щоб відмітити застосування бонусів.
- Приймати замовлення з інтернет магазину
- Відправляти електронний лист після оплати замовлення клієнтом
- При успішній оплаті у разі оплати банківською картою, автоматично відняти суму банківьсої комісії за транзакцію від оплаченого замовлення.
  
РАХУНОК КОМПАНІЇ
- Наявність грошового готівкового рахунку (у інших валютах)
- Наявність грошового безготівкового рахунку (у інших валютах)

ПРАЦІВНИКИ
- Налаштовувати доступи до секцій програми
- Рахувати математику зарплати в залежності від відпрацьованих годин та днів
- Рахувати математику графіку змін, щоб не перевищувало допустиму норму та бачити хто коли працює. Можуть бути денні зміни.

КЛІЄНТ
- Вести облік клієнтів, їхні покупок та бонусів
- Нараховувати бонуси клієнтам
- Properties:
  - Імя, Фамілія, номер телефону, електронна пошта, адреса, тип (бізнес (якщо бізнес то замість імя та фімілія буде "Назва", фізична особа), статус (активний, деактивований), бонуси, номер картки клієнта, адреса, стать.
- Behaviours:
  - Додання клієнта до замовлення за пошуком або скануванням номеру карти клієнта.
  - При оплаті замовлення з доданим клієнтом, нарахувати 1 % бонусів від покупки на бонусний рахунок клієнта.
  - При списанні бонусів з клієнта при оплаті замовлення, вибрана кількість бонусів списуєтсья з рахунку клієнта.

АКЦІЇ
- додавати акції на товари та / або їх категорії (відсоток знижки або фіксована цифра знижки):
  При доданні товару до замовлення, ціна товару зменшується з урахуванням акції. Змінена ціна підсвідчується окремо від звичайного кольору.
- редагувати акції
- 

## MISCELLANIOUS
- Відправляти дані у податкову
- Інтеграції з банківським терміналом
- Завдання працівникам. Формування автоматично та з можливістю мануально поправити та друк листа замовлення на постачання. Повідомлення для працівників.
- Відображення бізнес аналітики у графікаї.
- Мати Intelligence лоігку яка аналізує та виводить дані (Predictions): наприклад рекомендовані дії або попередження.
- Інтеграції з смс/месенджери службами
- Збільшення ролей працівників та додання прав дуступу до окремих модулів. Ролі будуть програмуватися до інмплементації. Покищо без динамічного присвоєння.
- Мати інтернет магазин (null)
- Відправляти та приймати сигнал по вайфай або блютуз від банківського терміналу
- Відправляти та приймати сигнал по вайфай або блютуз від вагів
АНАЛІТИКА
- Виводити кількість продажів по годино, днях, місяцях
- Виводити рух коштів
- Скільки було на рахунку у певний час, скільки було витрачено скільки було отримано 
- Виводити популярність товарів
- скільки купляють, як часто купляють
- Виводити інформацію про ТОВАРИ
- Кількість постачань та штук товарів у постачанні. Коли були постачання.
- (optional) Надавати статистику продажів, списань, витрат
- To have events for business analytics.
- відправляти SMS після оплати замовлення клієнтом

  
## USE CASES

total: 10,000 UAH на рахунку

- товар1: нажати -> деталі товару, усі характеристики товару
- товар2: нажати -> деталі товару
- товар3: нажати -> деталі товару
- товар4: нажати -> деталі товару 


Приклад грошового контролю

1/ прийшов новий товар у магазин
- товар5, ціна 1000 uah (напр. 10 пакетів кави)
- гроші total: 10,000 UAH - 1000 uah = 9,000 UAH
  - залишилось після отримання товару5

2/ 
- напр. 10 пакетів кави є в магазині
- прийшов клієнт - купив 5 пакетів кави
- гроші total: 9,000 UAH + 100 * 5 * 20% (націнка)
100 * 5 = 500
500 * 0.2 = 100

Приклад процесу постачання товаруПоставка товару:
    Додання товару:
        Сканування штрих коду або знаходження по назві або по картинці
            Якщо немає створити товар
                Назва, зображення, Ціна продажу, штрих код, Опис, Категорія, Ярлик, Варіанти
        Додання кількості товару
        Додання терміну придатності
        Додання ціни купівлі
        Бачити ціну продажу
        Автоматично змінити ціну продажу за математикою
        TBD - описати математику оновлення ціни продажу

Приклад списання товару
  Зробити фото товару
  ...
