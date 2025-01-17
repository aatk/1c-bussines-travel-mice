﻿
&НаКлиенте
Процедура ПослеРедактированияЗапроса(Текст, ЭлементДерева) Экспорт
        Если Не ПустаяСтрока(Текст) Тогда
            Запись.ЗапросМакета = Текст;
			Модифицированность = Истина;
        Иначе
            Модифицированность = Ложь;
        КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура КонструкторЗапроса(Команда)
	
	Текст = СокрЛП(Запись.ЗапросМакета);
	
	КодПрограммы = "
	|КонструкторЗапроса = Новый КонструкторЗапроса;
	|Если Не ПустаяСтрока(Текст) Тогда
	|		КонструкторЗапроса.Текст = Текст;
	|КонецЕсли;
	|";
		
    #Если ТолстыйКлиентУправляемоеПриложение Тогда
    Попытка
        
        КодПрограммы = КодПрограммы+ "
        |КонструкторЗапроса.АвтоДобавлениеПредставлений = ТекущиеДанные.АвтоДобавлениеПредставлений;
        |КонструкторЗапроса.РежимКомпоновкиДанных        = ТекущиеДанные.РежимКомпоновкиДанных;
        |
        |Если КонструкторЗапроса.ОткрытьМодально() Тогда
        |    ТекущиеДанные.Текст = КонструкторЗапроса.Текст;
        |    ПроверитьТекстЗапроса_ПолучитьПараметры_ОбновитьДанные();
        |КонецЕсли;
        |";
        Выполнить(КодПрограммы);
    Исключение
        Сообщить(ОписаниеОшибки());
    КонецПопытки;
    
    #Иначе
        
    Попытка
		
		КодПрограммы = КодПрограммы+ "
		|КонструкторЗапроса.Показать(Новый ОписаниеОповещения(""ПослеРедактированияЗапроса"", ЭтаФорма, Неопределено));
		|";
		Выполнить(КодПрограммы);
   Исключение
        Сообщить(ОписаниеОшибки());
    КонецПопытки;
	#КонецЕсли

КонецПроцедуры



&НаСервере
Процедура ОбъектПриИзмененииНаСервере()
	// Получим все макеты и заполним список макетов.
	Если Запись.Объект <> Справочники.ДополнительныеОтчетыИПечатныеФормы.ПустаяСсылка() Тогда
		ВОбработка = ВернутьОбработкуНаСервере();
		
		СведенияОПФ = ВОбработка.СведенияОВнешнейОбработке();
		ЭтаФорма.Элементы.ИмяМакета.СписокВыбора.Очистить();
		Для Каждого МакетВО ИЗ ВОбработка.Метаданные().Макеты Цикл
			ЭтаФорма.Элементы.ИмяМакета.СписокВыбора.Добавить(СведенияОПФ.Идентификатор+"."+МакетВО.Имя, СведенияОПФ.Идентификатор+"."+МакетВО.Имя);
		КонецЦикла;
	КонецЕсли;	
КонецПроцедуры

&НаКлиенте
Процедура ОбъектПриИзменении(Элемент)
	ОбъектПриИзмененииНаСервере();
КонецПроцедуры

&НаСервере
Функция ВернутьОбработкуНаСервере()
	
	ВОбработка = ДополнительныеОтчетыИПечатныеФормыВызовСервер.ВернутьОбработкуПоСсылке(Запись.Объект);
	Возврат ВОбработка;
	
КонецФункции



&НаСервере
Процедура ИмяМакетаПриИзмененииНаСервере()
	
	Если Запись.Объект <> Справочники.ДополнительныеОтчетыИПечатныеФормы.ПустаяСсылка() Тогда
		ВОбработка = ВернутьОбработкуНаСервере();
		ИмяМакетаОбработки = СтрРазделить(Запись.ИмяМакета, ".")[1];
		ЭтаФорма.Элементы.Параметр.СписокВыбора.Очистить();
		
		Попытка
			ПараметрыПечатныхФорм = ВОбработка.ПолучитьПараметрыПечатныхФорм();
			
			ЭтаФорма.ПараметрыПечатныхФормСтрока = УправлениеБТВызовСервера.ВJSON(ПараметрыПечатныхФорм);

			ПараметрыМакета = Новый Соответствие();
			Если ПараметрыПечатныхФорм.Свойство(ИмяМакетаОбработки,ПараметрыМакета) Тогда
				Для Каждого ПараметрМакета ИЗ ПараметрыМакета Цикл
					ЭтаФорма.Элементы.Параметр.СписокВыбора.Добавить(ПараметрМакета.Ключ, ПараметрМакета.Ключ);
				КонецЦикла;
				
			КонецЕсли;
		Исключение
			//Нет параметров у печатной формы
			Сообщить("У данного макета нет параметров");
		КонецПопытки;
	КонецЕсли;	
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗакрытияВопроса(Результат, Параметры) Экспорт
	
	Если Результат = КодВозвратаДиалога.Нет Тогда
        Возврат;
    КонецЕсли;

    ИмяМакетаПриИзмененииНаСервере()
	
КонецПроцедуры

&НаКлиенте
Процедура ИмяМакетаПриИзменении(Элемент)
	
	ИмяМакетаПриИзмененииНаСервере();
	//Режим = РежимДиалогаВопрос.ДаНет;
	//Оповещение = Новый ОписаниеОповещения("ПослеЗакрытияВопроса", ЭтаФорма, Параметры);
	//ПоказатьВопрос(Оповещение, "Обновить параметры печатной формы?", Режим, 0);
	
КонецПроцедуры

&НаСервере
Процедура ПеречитатьЗапросНаСервере()
	ВОбработка = ВернутьОбработкуНаСервере();
	
	Попытка
		Запись.ЗапросМакета = ВОбработка.ПолучитьТекстЗапроса();
	Исключение
	КонецПопытки;
	ВидимостьНаФормеНаСервере();
	
КонецПроцедуры

&НаКлиенте
Процедура ПеречитатьЗапрос(Команда)
	ПеречитатьЗапросНаСервере();
КонецПроцедуры



&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	
	//ХЗ = Новый ХранилищеЗначения(ТабличныйДокумент, Новый СжатиеДанных(9));
	//ТекущийОбъект.Макет = ХЗ;
	
КонецПроцедуры

&НаСервере
Процедура ВидимостьНаФормеНаСервере()
	
	Если ЗначениеЗаполнено(Запись.ЗапросМакета) Тогда
		ЭтаФорма.Элементы.ИзменениеЗапроса.Видимость = Истина;		
		ЭтаФорма.Элементы.ОшибкаПолученияЗапроса.Видимость = Ложь;
	Иначе
		ЭтаФорма.Элементы.ИзменениеЗапроса.Видимость = Ложь;		
		ЭтаФорма.Элементы.ОшибкаПолученияЗапроса.Видимость = Истина;			
	КонецЕсли;
	
КонецПроцедуры


&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	//ЗаписьСервер = РеквизитФормыВЗначение("Запись");
	//ХЗ = ЗаписьСервер.Макет.Получить();
	//ТабличныйДокумент = ХЗ; 
	//
	//ВидимостьНаФормеНаСервере();
	//
	//ОбъектПриИзмененииНаСервере();

КонецПроцедуры




&НаСервере
Процедура ПараметрПриИзмененииНаСервере()
	ИмяМакета = СтрРазделить(Запись.ИмяМакета, ".")[1];
	ВыбранныйПараметрПечатнойФормы = Запись.Параметр;
	
	ПараметрыПечатныхФорм = УправлениеБТВызовСервера.ИзJSON(ЭтаФорма.ПараметрыПечатныхФормСтрока, Ложь);
	
	Для Каждого МакетПФ ИЗ ПараметрыПечатныхФорм Цикл
		Если МакетПФ.Ключ = ИмяМакета Тогда
			Для Каждого ПараметрыПФ ИЗ МакетПФ.Значение Цикл
				Если ПараметрыПФ.Ключ = ВыбранныйПараметрПечатнойФормы Тогда
					ЗначениеПараметра = ПараметрыПФ.Значение;
					
					КЧ = Новый КвалификаторыЧисла(12,2);
					КС = Новый КвалификаторыСтроки(255);
					
					Массив = Новый Массив;
					Если ТипЗнч(ЗначениеПараметра) = Тип("Строка") Тогда
						Массив.Добавить(Тип("Строка"));
						ТипК = Новый ОписаниеТипов(Массив, , КС);
					ИначеЕсли ТипЗнч(ЗначениеПараметра) = Тип("Число") Тогда
						Массив.Добавить(Тип("Число"));
						ТипК = Новый ОписаниеТипов(Массив, , ,КЧ);
					Иначе
						Массив.Добавить(ТипЗнч(ЗначениеПараметра));
						ТипК = Новый ОписаниеТипов(Массив);						
					КонецЕсли;

					ЭтаФорма.Элементы.ЗначеиеПараметра.ОграничениеТипа = ТипК;
					
				КонецЕсли;
			КонецЦикла;
		КонецЕсли;
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура ПараметрПриИзменении(Элемент)
	ПараметрПриИзмененииНаСервере();
КонецПроцедуры
