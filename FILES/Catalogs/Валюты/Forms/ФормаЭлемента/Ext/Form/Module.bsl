﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Параметры.Свойство("АвтоТест") Тогда // Возврат при получении формы для анализа.
		Возврат;
	КонецЕсли;
	
	Если Объект.Ссылка.Пустая() Тогда
		
		Если Параметры.Свойство("КодВалюты") Тогда
			Объект.Код = Параметры.КодВалюты;
		КонецЕсли;
		
		Если Параметры.Свойство("НаименованиеКраткое") Тогда
			Объект.Наименование = Параметры.НаименованиеКраткое;
		КонецЕсли;
		
		Если Параметры.Свойство("НаименованиеПолное") Тогда
			Объект.НаименованиеПолное = Параметры.НаименованиеПолное;
		КонецЕсли;
		
		Если Параметры.Свойство("Загружается") И Параметры.Загружается Тогда
			Объект.СпособУстановкиКурса = Перечисления.СпособыУстановкиКурсаВалюты.ЗагрузкаИзИнтернета;
		Иначе 
			Объект.СпособУстановкиКурса = Перечисления.СпособыУстановкиКурсаВалюты.РучнойВвод;
		КонецЕсли;
		
		Если Параметры.Свойство("ПараметрыПрописиНаРусском") Тогда
			Объект.ПараметрыПрописиНаРусском = Параметры.ПараметрыПрописиНаРусском;
		КонецЕсли;
		
		ЗаполнитьФормуПоОбъекту();
		
	КонецЕсли;
	
	УстановитьДоступностьЭлементов(ЭтотОбъект);
	
	ИспользоватьНесколькоВалют = ПолучитьФункциональнуюОпцию("ИспользоватьНесколькоВалют");
	Если НЕ ИспользоватьНесколькоВалют Тогда
		Элементы.ГруппаСпособУстановкиКурса.Видимость = Ложь;
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
	ЗаполнитьФормуПоОбъекту();
	
КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	
	ТекущийОбъект.ПараметрыПрописиНаРусском = ПараметрыПрописиНаРусском(ЭтотОбъект);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

////////////////////////////////////////////////////////////////////////////////
// Страница "Основные сведения".

&НаКлиенте
Процедура ОсновнаяВалютаНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	ПодготовитьДанныеВыбораПодчиненнойВалюты(ДанныеВыбора, Объект.Ссылка);
	
КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
// Страница "Параметры прописи валюты".

&НаКлиенте
Процедура СуммаЧислоПриИзменении(Элемент)
	
	УстановитьСуммуПрописью(ЭтотОбъект);
	
КонецПроцедуры

&НаКлиенте
Процедура ПолеПрописи4наРусскомПриИзменении(Элемент)
	УстановитьСклоненияПараметровПрописи(ЭтотОбъект);
	УстановитьСуммуПрописью(ЭтотОбъект);
КонецПроцедуры

&НаКлиенте
Процедура ПолеПрописи4наРусскомАвтоПодбор(Элемент, Текст, ДанныеВыбора, Ожидание, СтандартнаяОбработка)
	
	ДанныеВыбора = АвтоПодборПоСпискуВыбора(Элемент, Текст, СтандартнаяОбработка);
	
КонецПроцедуры

&НаКлиенте
Процедура ПолеПрописи4наРусскомОкончаниеВводаТекста(Элемент, Текст, ДанныеВыбора, СтандартнаяОбработка)
	
	ДанныеВыбора = ОкончаниеВводаТекстаПоСпискуВыбора(Элемент, Текст, СтандартнаяОбработка);
	
КонецПроцедуры

&НаКлиенте
Процедура ПолеПрописи8наРусскомПриИзменении(Элемент)
	УстановитьСклоненияПараметровПрописи(ЭтотОбъект);
	УстановитьСуммуПрописью(ЭтотОбъект);
КонецПроцедуры

&НаКлиенте
Процедура ПолеПрописи8наРусскомАвтоПодбор(Элемент, Текст, ДанныеВыбора, Ожидание, СтандартнаяОбработка)
	
	ДанныеВыбора = АвтоПодборПоСпискуВыбора(Элемент, Текст, СтандартнаяОбработка);
	
КонецПроцедуры

&НаКлиенте
Процедура ПолеПрописи8наРусскомОкончаниеВводаТекста(Элемент, Текст, ДанныеВыбора, СтандартнаяОбработка)
	
	ДанныеВыбора = ОкончаниеВводаТекстаПоСпискуВыбора(Элемент, Текст, СтандартнаяОбработка);
	
КонецПроцедуры

&НаКлиенте
Процедура ПолеПрописи1наРусскомПриИзменении(Элемент)
	УстановитьСуммуПрописью(ЭтотОбъект);
КонецПроцедуры

&НаКлиенте
Процедура ПолеПрописи2наРусскомПриИзменении(Элемент)
	УстановитьСуммуПрописью(ЭтотОбъект);
КонецПроцедуры

&НаКлиенте
Процедура ПолеПрописи3наРусскомПриИзменении(Элемент)
	УстановитьСуммуПрописью(ЭтотОбъект);
КонецПроцедуры

&НаКлиенте
Процедура ПолеПрописи5наРусскомПриИзменении(Элемент)
	УстановитьСуммуПрописью(ЭтотОбъект);
КонецПроцедуры

&НаКлиенте
Процедура ПолеПрописи6наРусскомПриИзменении(Элемент)
	УстановитьСуммуПрописью(ЭтотОбъект);
КонецПроцедуры

&НаКлиенте
Процедура ПолеПрописи7наРусскомПриИзменении(Элемент)
	УстановитьСуммуПрописью(ЭтотОбъект);
КонецПроцедуры

&НаКлиенте
Процедура ДлинаДробнойЧастиПриИзменении(Элемент)
	УстановитьСуммуПрописью(ЭтотОбъект);
КонецПроцедуры

&НаКлиенте
Процедура ДлинаДробнойЧастиАвтоПодбор(Элемент, Текст, ДанныеВыбора, Ожидание, СтандартнаяОбработка)
	
	ДанныеВыбора = АвтоПодборПоСпискуВыбора(Элемент, Текст, СтандартнаяОбработка);
	
КонецПроцедуры

&НаКлиенте
Процедура ДлинаДробнойЧастиОкончаниеВводаТекста(Элемент, Текст, ДанныеВыбора, СтандартнаяОбработка)
	
	ДанныеВыбора = ОкончаниеВводаТекстаПоСпискуВыбора(Элемент, Текст, СтандартнаяОбработка);
	
КонецПроцедуры

&НаКлиенте
Процедура КурсВалютыПриИзменении(Элемент)
	УстановитьДоступностьЭлементов(ЭтотОбъект);
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура ЗаполнитьФормуПоОбъекту()
	
	ПрочитатьПараметрыПрописи();
	
	УстановитьСклоненияПараметровПрописи(ЭтотОбъект);
	УстановитьСуммуПрописью(ЭтотОбъект);
	
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Функция ПараметрыПрописиНаРусском(Форма)
	
	Возврат Форма.ПолеПрописи1наРусском + ", "
			+ Форма.ПолеПрописи2наРусском + ", "
			+ Форма.ПолеПрописи3наРусском + ", "
			+ НРег(Лев(Форма.ПолеПрописи4наРусском, 1)) + ", "
			+ Форма.ПолеПрописи5наРусском + ", "
			+ Форма.ПолеПрописи6наРусском + ", "
			+ Форма.ПолеПрописи7наРусском + ", "
			+ НРег(Лев(Форма.ПолеПрописи8наРусском, 1)) + ", "
			+ Форма.ДлинаДробнойЧасти;
	
КонецФункции

&НаКлиентеНаСервереБезКонтекста
Процедура УстановитьСуммуПрописью(Форма)
	
	Форма.СуммаПрописью = ЧислоПрописью(Форма.СуммаЧисло, , ПараметрыПрописиНаРусском(Форма));
	
КонецПроцедуры

&НаСервере
Процедура ПрочитатьПараметрыПрописи()
	
	// Считывает параметры прописи и заполняет соответствующие поля диалога.
	
	СтрокаПараметров = СтрЗаменить(Объект.ПараметрыПрописиНаРусском, ",", Символы.ПС);
	
	ПолеПрописи1наРусском = СокрЛП(СтрПолучитьСтроку(СтрокаПараметров, 1));
	ПолеПрописи2наРусском = СокрЛП(СтрПолучитьСтроку(СтрокаПараметров, 2));
	ПолеПрописи3наРусском = СокрЛП(СтрПолучитьСтроку(СтрокаПараметров, 3));
	
	Род = СокрЛП(СтрПолучитьСтроку(СтрокаПараметров, 4));
	
	Если	  НРег(Род) = "м" Тогда
		ПолеПрописи4наРусском = "Мужской";
	ИначеЕсли НРег(Род) = "ж" Тогда
		ПолеПрописи4наРусском = "Женский";
	ИначеЕсли НРег(Род) = "с" Тогда
		ПолеПрописи4наРусском = "Средний";
	КонецЕсли;
	
	ПолеПрописи5наРусском = СокрЛП(СтрПолучитьСтроку(СтрокаПараметров, 5));
	ПолеПрописи6наРусском = СокрЛП(СтрПолучитьСтроку(СтрокаПараметров, 6));
	ПолеПрописи7наРусском = СокрЛП(СтрПолучитьСтроку(СтрокаПараметров, 7));
	
	Род = СокрЛП(СтрПолучитьСтроку(СтрокаПараметров, 8));
	
	Если	  НРег(Род = "м") Тогда
		ПолеПрописи8наРусском = "Мужской";
	ИначеЕсли НРег(Род = "ж") Тогда
		ПолеПрописи8наРусском = "Женский";
	ИначеЕсли НРег(Род = "с") Тогда
		ПолеПрописи8наРусском = "Средний";
	КонецЕсли;
	
	ДлинаДробнойЧасти     = СокрЛП(СтрПолучитьСтроку(СтрокаПараметров, 9));
	
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Процедура УстановитьСклоненияПараметровПрописи(Форма)
	
	// Склонение заголовков параметров прописи.
	
	Элементы = Форма.Элементы;
	
	Если Форма.ПолеПрописи4наРусском = "Женский" Тогда
		Элементы.ПолеПрописи1наРусском.Заголовок = НСтр("ru = 'Одна'");
		Элементы.ПолеПрописи2наРусском.Заголовок = НСтр("ru = 'Две'");
	ИначеЕсли Форма.ПолеПрописи4наРусском = "Мужской" Тогда
		Элементы.ПолеПрописи1наРусском.Заголовок = НСтр("ru = 'Один'");
		Элементы.ПолеПрописи2наРусском.Заголовок = НСтр("ru = 'Два'");
	Иначе
		Элементы.ПолеПрописи1наРусском.Заголовок = НСтр("ru = 'Одно'");
		Элементы.ПолеПрописи2наРусском.Заголовок = НСтр("ru = 'Два'");
	КонецЕсли;
	
	Если Форма.ПолеПрописи8наРусском = "Женский" Тогда
		Элементы.ПолеПрописи5наРусском.Заголовок = НСтр("ru = 'Одна'");
		Элементы.ПолеПрописи6наРусском.Заголовок = НСтр("ru = 'Две'");
	ИначеЕсли Форма.ПолеПрописи8наРусском = "Мужской" Тогда
		Элементы.ПолеПрописи5наРусском.Заголовок = НСтр("ru = 'Один'");
		Элементы.ПолеПрописи6наРусском.Заголовок = НСтр("ru = 'Два'");
	Иначе
		Элементы.ПолеПрописи5наРусском.Заголовок = НСтр("ru = 'Одно'");
		Элементы.ПолеПрописи6наРусском.Заголовок = НСтр("ru = 'Два'");
	КонецЕсли;
	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ПодготовитьДанныеВыбораПодчиненнойВалюты(ДанныеВыбора, Ссылка)
	
	// Подготавливает список выбора для подчиненной валюты таким образом,
	// чтобы в список не попала сама подчиненная валюта.
	
	ДанныеВыбора = Новый СписокЗначений;
	
	Запрос = Новый Запрос;
	
	Запрос.Текст = "ВЫБРАТЬ Ссылка, НаименованиеПолное
	               |ИЗ
	               |	Справочник.Валюты
	               |ГДЕ
	               |	Ссылка <> &Ссылка
	               |И
	               |	ОсновнаяВалюта  = Значение(Справочник.Валюты.ПустаяСсылка)
	               |УПОРЯДОЧИТЬ ПО НаименованиеПолное";
	
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	
	Выборка = Запрос.Выполнить().Выбрать();
	
	Пока Выборка.Следующий() Цикл
		ДанныеВыбора.Добавить(Выборка.Ссылка, Выборка.НаименованиеПолное);
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Функция АвтоПодборПоСпискуВыбора(Элемент, Текст, СтандартнаяОбработка)
	
	// Вспомогательная функция управлением вводом.
	
	Для Каждого ЭлементВыбора Из Элемент.СписокВыбора Цикл
		Если ВРег(Текст) = ВРег(Лев(ЭлементВыбора.Представление, СтрДлина(Текст))) Тогда
			Результат = Новый СписокЗначений;
			Результат.Добавить(ЭлементВыбора.Значение, ЭлементВыбора.Представление);
			СтандартнаяОбработка = Ложь;
			Возврат Результат;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Неопределено;
	
КонецФункции

&НаКлиенте
Функция ОкончаниеВводаТекстаПоСпискуВыбора(Элемент, Текст, СтандартнаяОбработка)
	
	// Вспомогательная функция управлением вводом.
	
	СтандартнаяОбработка = Ложь;
	
	Для Каждого ЭлементВыбора Из Элемент.СписокВыбора Цикл
		Если ВРег(Текст) = ВРег(ЭлементВыбора.Представление) Тогда
			СтандартнаяОбработка = Истина;
		ИначеЕсли ВРег(Текст) = ВРег(Лев(ЭлементВыбора.Представление, СтрДлина(Текст))) Тогда
			СтандартнаяОбработка = Ложь;
			Результат = Новый СписокЗначений;
			Результат.Добавить(ЭлементВыбора.Значение, ЭлементВыбора.Представление);
			Возврат Результат;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Неопределено;
	
КонецФункции

&НаКлиентеНаСервереБезКонтекста
Процедура УстановитьДоступностьЭлементов(Форма)
	Элементы = Форма.Элементы;
	Объект = Форма.Объект;
	Элементы.ГруппаНаценкаНаКурсДругойВалюты.Доступность = Объект.СпособУстановкиКурса = ПредопределенноеЗначение("Перечисление.СпособыУстановкиКурсаВалюты.НаценкаНаКурсДругойВалюты");
	Элементы.ФормулаРасчетаКурса.Доступность = Объект.СпособУстановкиКурса = ПредопределенноеЗначение("Перечисление.СпособыУстановкиКурсаВалюты.РасчетПоФормуле");
КонецПроцедуры
#КонецОбласти
