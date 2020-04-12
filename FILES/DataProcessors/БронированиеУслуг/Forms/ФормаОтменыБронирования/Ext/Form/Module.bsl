﻿
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	//Вставить содержимое обработчика
	УслугаПродажи = ЭтаФорма.Параметры.УслугаПродажи;
	ОтменаБронирования(УслугаПродажи);
КонецПроцедуры


&НаСервереБезКонтекста
Функция ОтменаБронированияНаСервере(СформированныйВариант)
	
	//<root>
	//	<SearchId>Iway_23_f58c4f5e-add0-49e6-98c1-bd800aea441b</SearchId>
	//</root>

	Результат = Новый Структура();
	
	Сервер = Константы.СерверШиныПредприятия.Получить();
	Адрес = "TransferAgregator/cancelbooking/json/"; 
	ВыхТело = УправлениеБТВызовСервера.ВJSON(СформированныйВариант);
	РезультатПоиска = УправлениеБТВызовСервера.ОтправитьЗапросВШину(Сервер.URL, Адрес, ВыхТело, Новый Структура());
	Если РезультатПоиска.Результат Тогда
		Результат = УправлениеБТВызовСервера.ИзJSON(РезультатПоиска.ВхОбъект);		
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

&НаСервере
Процедура ОтменаБронирования(УслугаПродажи)
		
	СтрокаСID = УслугаПродажи.ОписаниеУслуги.Найти(ПланыВидовХарактеристик.НаборХарактеристикДляНоменклатуры.IDБронирования, "Характеристика");
	Если ЗначениеЗаполнено(СтрокаСID) Тогда
		ID = СтрокаСID.Значение;
		ЗапросНаБронирование = Новый Структура("SearchId", ID);
		РезультатБронирования = ОтменаБронированияНаСервере(ЗапросНаБронирование);
	Иначе
		Элементы.Декорация1.Заголовок = "Данную услугу невозможно отменить!";
		Элементы.Декорация2.Заголовок = "В Услуге не хватает параметра ID Бронирования, а также она должна быть забронированна через систему бронирования mid-office";
		Элементы.УслугаОтменыБронирования.Видимость = Ложь;
	КонецЕсли;
	
КонецПроцедуры
