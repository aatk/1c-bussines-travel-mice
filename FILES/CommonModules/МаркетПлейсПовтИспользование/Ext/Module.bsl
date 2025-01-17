﻿
Функция СписокДопФункционалаМП() Экспорт
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ДополнительныйФункционал.Ссылка КАК Ссылка,
		|	ДополнительныйФункционал.НаименованиеОбработки КАК НаименованиеОбработки,
		|	ДополнительныйФункционал.ТипДопФункционала КАК ТипДопФункционала
		|ИЗ
		|	Справочник.ДополнительныйФункционал КАК ДополнительныйФункционал
		|ГДЕ
		|	ДополнительныйФункционал.ПометкаУдаления = ЛОЖЬ
		|	И ДополнительныйФункционал.ТипДопФункционала = &ТипДопФункционала";
	Запрос.УстановитьПараметр("ТипДопФункционала", Перечисления.ТипыДополнительногоФункционала.КомпонентСобытий);
	
	РезультатЗапроса = Запрос.Выполнить();
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выгрузить();
	
	Возврат ВыборкаДетальныеЗаписи; 
КонецФункции

Функция ОбработкаМП(ДополнительныйФункционал) Экспорт
	ОшибкаОбработки = Ложь;
	Если ДополнительныйФункционал.Ссылка.РежимОтладки Тогда
		//
		ВОбработка = ВнешниеОбработки.Создать(ДополнительныйФункционал.Ссылка.ПутьКФайлуОтладки, Ложь);
		ИмяОбработки = СтрЗаменить(Строка(ВОбработка), "ВнешняяОбработкаОбъект.", "");
	Иначе
		НавигационнаяССылка = ПолучитьНавигационнуюСсылку(ДополнительныйФункционал.Ссылка, "ВнешняяОбработка");
		
		Попытка
			ОбъектОписанияЗащиты = Новый ОписаниеЗащитыОтОпасныхДействий;
			ОбъектОписанияЗащиты.ПредупреждатьОбОпасныхДействиях = Ложь;
			ИмяОбработки = ВнешниеОбработки.Подключить(НавигационнаяССылка,,Ложь,ОбъектОписанияЗащиты); 
			ВОбработка = ВнешниеОбработки.Создать(ИмяОбработки, Ложь);
		Исключение	
			ОшибкаОбработки = Истина;
		КонецПопытки;
	КонецЕсли;
	
	Возврат Новый Структура("ОшибкаОбработки, ИмяОбработки, ВОбработка", ОшибкаОбработки, ИмяОбработки, ВОбработка);
КонецФункции

Функция ДобавитьСостав(Подсистемы, Подсистема)
	
	Для Каждого ЭлементСостава ИЗ Подсистема.Состав Цикл
		Подсистемы.Добавить(Строка(ЭлементСостава));		
	КонецЦикла;
	
	Для Каждого ЭлементПодсистемы ИЗ Подсистема.Подсистемы Цикл
		ДобавитьСостав(Подсистемы, ЭлементПодсистемы);
	КонецЦикла;
	
КонецФункции

Функция ПолучитьСписокОбъектовБТ() Экспорт
	
	Подсистемы = Новый Массив;
	ДобавитьСостав(Подсистемы, Метаданные.Подсистемы.БизнесТревел);
	ДобавитьСостав(Подсистемы, Метаданные.Подсистемы.АдминистрированиеБТ);
	ДобавитьСостав(Подсистемы, Метаданные.Подсистемы.ВнешниеСервисы);
	
	Возврат УправлениеБТВызовСервера.ВJSON(Подсистемы);
КонецФункции

Функция ОбъектФункционалБТ(ВесьСоставJSON, МетаданныеОбъекта) Экспорт
	
	ВесьСостав = УправлениеБТВызовСервера.ИзJSON(ВесьСоставJSON);
	ЗначениеПоиска = ВесьСостав.Найти(МетаданныеОбъекта);
	Возврат ЗначениеПоиска;
	
КонецФункции
